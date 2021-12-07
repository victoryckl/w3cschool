// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'

Shader "Siki/08-Specular Fragment" {
	Properties{
		_Diffuse("Diffuse Color", Color) = (1,1,1,1)
		_Specular("Specular Color", Color) = (1,1,1,1)
		_Gloss("Gloss", Range(8,200)) = 10
	}

	SubShader{
		Pass{
			//定义该Pass在Unity的流水线中的角色 (只有定义它才能获取到一些Unity内置的光照变量如_LightColor0)
			Tags{ "LightMode" = "ForwardBase" }

			CGPROGRAM

			#include "Lighting.cginc" //这个命名空间中包含_LightColor0

			//声明顶点函数的函数名，为vert，
			//将mesh fitler中的顶点，从模型空间转换到裁切空间（从游戏环境转换到视野相机屏幕上）
			#pragma vertex vert

			//声明片元函数，返回模型对于的屏幕上的每一个像素的颜色值
			#pragma fragment frag

			fixed4 _Diffuse;
			fixed4 _Specular;
			half _Gloss;

			//使用结构体传递参数
			//application to vertex
			struct a2v {
				float4 vertex : POSITION; //告诉unity把模式空间下的顶点坐标填充给vertex
				float3 normal : NORMAL; //包模型空间下的法线方向填充到normal
				float4 texcoord : TEXCOORD0; //把第一套纹理坐标填充到texcoord
			};

			struct v2f {
				float4 position : SV_POSITION;
				float3 worldNormal : TEXCOOD0;
				float3 worldVertex : TEXCOOD1;
			};

			v2f vert(a2v v) {
				v2f f;

				//定点坐标从模型空间转换到剪裁空间
				f.position = UnityObjectToClipPos(v.vertex);
				
				//把法线方向从模型空间转换到世界空间
				f.worldNormal = mul(v.normal, (float3x3) unity_WorldToObject);

				//顶点坐标：模型空间转世界空间
				f.worldVertex = mul(v.vertex, unity_WorldToObject).xyz;

				return f;
			}

			fixed4 frag(v2f f) : SV_Target {
				//把法线方向从模型空间转换到世界空间
				fixed3 normalDir = normalize(f.worldNormal);

				//直射光在世界空间下的方向
				fixed3 lightDir = normalize(_WorldSpaceLightPos0.xyz);

				//漫反射 Diffuse = 直射光颜色 * max(0, cos(光和法线的夹角))
				//向量点乘(dot)的结果就是两者夹角的cos值
				fixed3 diffuse = _LightColor0.rgb * max(0, dot(normalDir, lightDir));
				fixed3 tempColor = diffuse * _Diffuse.rgb;//颜色融合，相乘即可

				fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.rgb;//获取环境光颜色
				tempColor = tempColor + ambient;//直接叠加环境光

				//根据直射光方向和法线方向计算反射光的方向
				fixed3 reflectDir = normalize(reflect(-lightDir, normalDir));
				//视野方向 = 相机坐标-转世界坐标(模型空间顶点坐标)
				fixed3 viewDir = normalize(_WorldSpaceCameraPos.xyz - f.worldVertex);

				//高光反射 Specular = 直射光颜色 * pow ( max(cosθ,0), 10)
				//θ是反射光方向与视野方向的夹角
				fixed3 specular = _LightColor0.rgb * _Specular.rgb * pow(max(dot(reflectDir, viewDir), 0), _Gloss);
				tempColor = tempColor + specular;//直接叠加反射光境光

				return fixed4(tempColor, 1);
			}

			ENDCG
		}
	}

	Fallback "VertexLit"
}
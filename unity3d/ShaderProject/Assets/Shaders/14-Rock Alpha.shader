// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'

Shader "Siki/14-Rock Alpha" {
	Properties{
		//_Diffuse("Diffuse Color", Color) = (1,1,1,1)
		_MainTex("Main Tex", 2D) = "white"{}
		_Color("Color", Color) = (1,1,1,1)
		_NormalMap("Normal Map", 2D) = "bump"{}
		_BumpScale("Bump Scale", Range(0,10)) = 1
		_AlphaScale("Alpha Scale", Range(0,1)) = 1
	}
	SubShader{
		Tags{ "Queue" = "Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }

		Pass{
			Tags{"LightMode" = "ForwardBase"}

			ZWrite Off
			Blend SrcAlpha OneMinusSrcAlpha

			CGPROGRAM
	#include "Lighting.cginc"

	#pragma vertex vert
	#pragma fragment frag

			//fixed4 _Diffuse;
			sampler2D _MainTex;
			float4 _MainTex_ST;
			fixed4 _Color;
			sampler2D _NormalMap;
			float4 _NormalMap_ST;
			float _BumpScale;
			fixed _AlphaScale;

			struct a2v {
				float4 vertex:POSITION;
				//切线空间的确定是通过(存储到模型里面的)法线和(存储到模型里面的)切线确定的
				float3 normal:NORMAL;
				float4 tangent:TANGENT;//模型空间下的顶点切线，tangent.w是用来确定切线空间中坐标轴的方向的
				float4 texcoord:TEXCOORD0;
			};

			struct v2f {
				float4 svPos:SV_POSITION;
				//float3 worldNormal:TEXCOORD0;
				float3 lightDir : TEXCOORD0;//切线空间下平行光的方向
				float4 worldVertex:TEXCOORD1;
				float4 uv:TEXCOORD2; //xy用来存MainTex的纹理坐标，zw用来存储NormalMap的纹理坐标
			};

			v2f vert(a2v v) {
				v2f f;
				f.svPos = UnityObjectToClipPos(v.vertex);
				//f.worldNormal = UnityObjectToWorldNormal(v.normal);
				f.worldVertex = mul(v.vertex, unity_WorldToObject);
				f.uv.xy = v.texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				f.uv.zw = v.texcoord.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;

				TANGENT_SPACE_ROTATION;//这是一个宏，调用后，会得到一个矩阵 rotation，这个矩阵用来把模型空间下的方向转换成切线空间下的方向
				//这个宏中会使用 v.normal、v.tangent，所以参数名称必须是v，成员必须是normal和tangent，不能变

				//ObjSpaceLightDir(v.vertex);//模型空间下的平行光方向
				f.lightDir = mul(rotation, ObjSpaceLightDir(v.vertex));


				return f;
			}

			//把所有跟法线方向有关的运算都放在 切线空间下
			//从法线贴图中取得的法线方向是在切线空间下的
			fixed4 frag(v2f f) : SV_Target{

				//fixed3 normalDir = normalize(f.worldNormal);
				fixed4 normalColor = tex2D(_NormalMap, f.uv.zw);

				//fixed3 tangentNormal = normalize(normalColor.xyz * 2 - 1);//切线空间下的法线
				fixed3 tangentNormal = UnpackNormal(normalColor);//要UnpackNormal()才能正确获取到法线
				tangentNormal.xy = tangentNormal * _BumpScale;
				tangentNormal = normalize(tangentNormal);

				fixed3 lightDir = normalize(f.lightDir);

				fixed3 texColor = tex2D(_MainTex, f.uv.xy) * _Color.rgb;
				fixed3 diffuse = _LightColor0.rgb * texColor * max(0, dot(tangentNormal, lightDir));

				fixed3  tempColor = diffuse + UNITY_LIGHTMODEL_AMBIENT.rgb * texColor;
				
				return fixed4(tempColor, _AlphaScale);
			}

			ENDCG
		}
	}

	Fallback "Specular"
}
Shader "Siki/03-Shader" {
	SubShader{
		Pass{
			CGPROGRAM

//声明顶点函数的函数名，为vert，
//将mesh fitler中的顶点，从模型空间转换到裁切空间（从游戏环境转换到视野相机屏幕上）
#pragma vertex vert

//声明片元函数，返回模型对于的屏幕上的每一个像素的颜色值
#pragma fragment frag

			//使用结构体传递参数
			//application to vertex
			struct a2v {
				float4 vertex : POSITION; //告诉unity把模式空间下的顶点坐标填充给vertex
				float3 normal : NORMAL; //包模型空间下的法线方向填充到normal
				float4 texcoord : TEXCOORD0; //把第一套纹理坐标填充到texcoord
			};

			struct v2f {
				float4 position : SV_POSITION;
				fixed3 temp : COLOR0;
			};

			v2f vert(a2v v) {
				v2f f;
				f.position = UnityObjectToClipPos(v.vertex);
				f.temp = v.normal;
				return f;
			}

			fixed4 frag(v2f f) : SV_Target {
				return fixed4(f.temp,1);
			}

			ENDCG
		}
	}

	Fallback "VertexLit"
}
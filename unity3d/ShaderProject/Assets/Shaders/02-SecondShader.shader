// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Siki/02-SecondShader" {
	SubShader{
		Pass{
			CGPROGRAM

//声明顶点函数的函数名，为vert，
//将mesh fitler中的顶点，从模型空间转换到裁切空间（从游戏环境转换到视野相机屏幕上）
#pragma vertex vert

//声明片元函数，返回模型对于的屏幕上的每一个像素的颜色值
#pragma fragment frag

//实现顶点函数，每个顶点都会经过vert处理
//POSITION语义告知系统表示把顶点传递给v
//SV_POSITION语义说明返回值是剪裁空间下的顶点坐标
			float4 vert(float4 v : POSITION) : SV_POSITION{ 
				return UnityObjectToClipPos(v);
			}

			fixed4 frag() : SV_Target {
				return fixed4(1,1,1,1);
			}

			ENDCG
		}
	}

	Fallback "VertexLit"
}
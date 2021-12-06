Shader "Siki/01 shader" {
	Properties{
		_Color("Color", Color) = (1,1,1,1)
		_Vector("Vector", Vector) = (1,2,3,4)
		_Int("Int", Int) = 12154
		_Float("Float", Float) = 12.4
		_Range("Range", Range(1,23)) = 10
		_2D("Texture", 2D) = "red" {}
		_Cube("Cube", Cube) = "white" {}
		_3D("Texture", 3D) = "black" {}
	}

	SubShader{
		Pass {
			CGPROGRAM

			fixed4 _Color;//Color _Color
			//float3 half3 fixed3
			//float2 half2 fixed2
			//float 32位
			//half 16位
			//fixed 11位

			float4 _Vector; //half4 fixed4
			float _Int;
			float _Float;
			float _Range;
			sampler2D _2D;
			samplerCube _Cube;
			sampler3D _3D;


			ENDCG
		}
	}

	Fallback "VertexLit"
}
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/Outline"
{
	Properties
	{
	
	_OutlineVal("Outline value", Range(0., 2.)) = 1.                //描线的宽度
		_OutlineCol("Outline color", color) = (1., 1., 1., 1.)
	}
		SubShader
	{
		Tags{ "Queue" = "Geometry" "RenderType" = "Opaque" }
 
		Pass
	{
		Cull Front
 
		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#include "UnityCG.cginc"
 
		struct v2f {
		float4 pos : SV_POSITION;
	};
 
	float _OutlineVal;
 
	v2f vert(appdata_base v) {
		v2f o;
		o.pos = mul(UNITY_MATRIX_MV, v.vertex);       //注意这里只换算到观察空间，还没有到裁剪空间
		float3 normal = mul((float3x3) UNITY_MATRIX_IT_MV, v.normal); //上一篇博客说过，法线的变换需要用到UNITY_MATRIX_IT_MV
		o.pos.xy += _OutlineVal*normal.xy;   //观察空间里xy方向始终和最终屏幕方向相同，这保证了描线始终面向我们，边缘朝外偏移一点点
		o.pos = mul(UNITY_MATRIX_P, o.pos); //最终需要把坐标从观察空间变换到裁剪空间
		return o;
	}
 
	fixed4 _OutlineCol;
 
	fixed4 frag(v2f i) : SV_Target{
		return _OutlineCol;
	}
 
		ENDCG
	}
 
		Pass
	{
		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#include "UnityCG.cginc"
 
		float4 vert(appdata_base v) : SV_POSITION
	{
		return UnityObjectToClipPos(v.vertex);
	}
 
	fixed4 frag(float4 i : VPOS) : SV_Target
	{
		return fixed4(1,1,0,1);
	}
 
		ENDCG
	}
	}
}
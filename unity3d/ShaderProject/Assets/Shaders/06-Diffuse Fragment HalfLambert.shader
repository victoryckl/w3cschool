// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'

Shader "Siki/06-Diffuse Fragment HalfLambert" {
	Properties{
		_Diffuse("Diffuse Color", Color) = (1,1,1,1)
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

	//使用结构体传递参数
	//application to vertex
	struct a2v {
		float4 vertex : POSITION; //告诉unity把模式空间下的顶点坐标填充给vertex
		float3 normal : NORMAL; //包模型空间下的法线方向填充到normal
		float4 texcoord : TEXCOORD0; //把第一套纹理坐标填充到texcoord
	};

	struct v2f {
		float4 position : SV_POSITION;
		fixed3 worldNormalDir : COLOR0;
	};

	v2f vert(a2v v) {
		v2f f;

		//定点坐标从模型空间转换到剪裁空间
		f.position = UnityObjectToClipPos(v.vertex);

		//把法线方向从模型空间转换到世界空间
		f.worldNormalDir = mul(v.normal, (float3x3) unity_WorldToObject);
		return f;
	}

	fixed4 frag(v2f f) : SV_Target {
		fixed3 normalDir = normalize(f.worldNormalDir);

	//直射光在世界空间下的方向
	fixed3 lightDir = normalize(_WorldSpaceLightPos0.xyz);

	//漫反射
	//兰伯特光照模型 Diffuse = 直射光颜色 * max(0, cosθ)
	//θ是光和法线的夹角，θ∈[0,π]时，cosθ: 1 -> 0 -> -1，用max()去掉小于0的数值
	//向量点乘(dot)的结果就是两者夹角的cos值，cos(光和法线的夹角)
	//半兰伯特光照模型 Diffuse = 直射光颜色 * ( cosθ * 0.5 + 0.5 )
	//θ∈[0,π]时，( cosθ * 0.5 + 0.5 )∈[1,0]，整体渲染效果较亮，背光的部分也有光照

	fixed3 diffuse = _LightColor0.rgb * (dot(normalDir, lightDir) * 0.5 + 0.5);
	fixed3 tempColor = diffuse * _Diffuse.rgb;//颜色融合，相乘即可

	fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.rgb;//获取环境光颜色
	tempColor = tempColor + ambient;//直接叠加环境光

	return fixed4(tempColor,1);
}

ENDCG
}
	}

		Fallback "Diffuse" //系统默认的漫反射程序
}
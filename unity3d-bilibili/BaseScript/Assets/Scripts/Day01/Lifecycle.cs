using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// 脚本生命周期/必然时间/消息 Message
/// </summary>
public class Lifecycle : MonoBehaviour {
    //脚本：.cs的文本文件  类文件
    //      附加到游戏物体中，定义游戏对象行为指令的代码

    //

    public int a = 100;
    private int b;

    //系列化字段 作用：在unity编辑器中显示私有变量
    [SerializeField]
    private int c;

    //在unity编辑器中隐藏公有变量
    [HideInInspector]
    public int d;

    [Range(0, 100)]
    public int range;

    public string tagx;

    private float t;

    public float time;

    //public Lifecycle()
    //{
    //不要在脚本中写构造方法
    //不能再子线程中范围主线程成员
    //t = Time.time;
    //}

    /***********************初始阶段***********************/
    //执行时间：创建游戏对象 -> 立即执行，1次，早于Start
    private void Awake()
    {
        //Debug.Log() 耗性能，仅在调试时用，发布时要删除
        //复杂逻辑调试，用VS调试
        Debug.Log("Awake "+Time.time+" "+this.name);
    }

    // 创建游戏对手 且 脚本启用 才执行，1次
    private void Start()
    {
        Debug.Log("Start " + Time.time + " " + this.name);
    }

    //每当脚本启用时调用
    private void OnEnable()
    {
        Debug.Log("OnEnable " + Time.time + " " + this.name);
    }

    /***************物理阶段**************/
    //脚本启用后，固定时间调用 每个0.02秒，不受渲染影响
    //适合对物体做物理操作(移动、旋转)
    private void FixedUpdate()
    {
        //Debug.Log("FixedUpdate " + Time.time + " " + this.name);
        //比如检查子弹是否打中物体
    }

    /***************游戏逻辑**************/
    //渲染帧执行，执行间隔不固定
    //处理游戏逻辑
    private void Update()
    {
        //Debug.Log("Update " + Time.time + " " + this.name);
        time = Time.time;
    }

    //延迟移动，在Update()后执行，适用于逻辑跟随，在同一帧内执行
    private void LateUpdate()
    {
        //Debug.Log("LateUpdate " + Time.time + " " + this.name);
    }

    //鼠标点击带有碰撞器(collider)的物体时调用
    private void OnMouseDown()
    {
        Debug.Log("OnMouseDown " + Time.time + " " + this.name);
    }

    private void OnBecameVisible()
    {
        Debug.Log("OnBecameVisible " + Time.time + " " + this.name);
    }

    private void OnBecameInvisible()
    {
        Debug.Log("OnBecameInvisible " + Time.time + " " + this.name);
    }

    private void OnDisable()
    {
        Debug.Log("OnDisable " + Time.time + " " + this.name);
    }

    private void OnDestroy()
    {
        Debug.Log("OnDestroy " + Time.time + " " + this.name);
    }

    private void OnApplicationQuit()
    {
        Debug.Log("OnApplicationQuit " + Time.time + " " + this.name);
    }

}

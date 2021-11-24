using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TimeDemo : MonoBehaviour {
    public float time;
    public float unscaledTime;
    public float deltaTime;
    public float unscaledDeltaTime;
    public float realtimeSinceStartup;
    public int speed = 70;

    //不受到timeScale的影响，但Time.deltaTime受到timeScale的影响，timeScale=0时，deltaTime=0
    private void Update()
    {
        time = Time.time;
        unscaledTime = Time.unscaledTime;
        deltaTime = Time.deltaTime;
        unscaledDeltaTime = Time.unscaledDeltaTime;
        realtimeSinceStartup = Time.realtimeSinceStartup;

        //旋转速度*每帧消耗时间，保证旋转速度恒定，不受渲染速度影响
        //this.transform.Rotate(0, speed * Time.deltaTime, 0);

        this.transform.Rotate(0, speed*Time.unscaledDeltaTime, 0);//不受到timeScale的影响，实现暂停游戏后，继续移动的效果
    }

    //固定0.02S调用，受到timeScale的影响，timeScale=0时，不会再调用
    private void FixedUpdate()
    {
        //this.transform.Rotate(0, speed * Time.deltaTime, 0);
    }

    private void OnGUI()
    {
        GUILayout.BeginArea(new Rect(0, 50, 100, 60));
        if (GUILayout.Button("暂停游戏"))
        {
            Time.timeScale = 0;
        }
        if (GUILayout.Button("继续游戏"))
        {
            Time.timeScale = 1;
        }
        GUILayout.EndArea();
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class VectorDemo : MonoBehaviour {
    private void Update()
    {
        demo3();
    }


    //模长
    private void demo1()
    {
        Vector3 pos = this.transform.position;
        float m02 = pos.magnitude;
        float m03 = Vector3.Distance(Vector3.zero, pos);
        Debug.DrawLine(Vector3.zero, pos);
    }

    //方向
    private void demo2()
    {
        Vector3 pos = this.transform.position;
        Vector3 n01 = pos / pos.magnitude;
        Vector3 n02 = pos.normalized;

        Debug.DrawLine(Vector3.zero, pos);
        Debug.DrawLine(Vector3.zero, n02, Color.red);
    }

    //向量计算
    public Transform t1, t2, t3;
    public float moveSpeed = 8;
    private void demo3()
    {
        Vector3 vec = t1.position - t2.position;
        // 指向被减向量(前面的），大小为两点间距，起点移动到坐标原点
        Debug.DrawLine(Vector3.zero, vec);

        //t3沿着vec方向移动
        if (Input.GetKey(KeyCode.A))
        { //vec.normalized获取方向，避免两个物体间距对移动速度造成影响
            t3.Translate(vec.normalized * Time.deltaTime * moveSpeed);
            //同 t3.position += vec.normalized  * Time.deltaTime * moveSpeed;
        }
    }
}

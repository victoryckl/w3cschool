using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MyScript : MonoBehaviour {
    public GameObject myCube;

    private bool isForward = false;
    public int transSpeed = 100;
    public float rotaSpeed = 10.5f;

    private bool isScaled = false;
    public float scale = 3;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void OnGUI()
    {
        if (GUILayout.Button("移动立方体"))
        {
            Vector3 vector = isForward ? Vector3.forward : Vector3.back;
            myCube.transform.Translate(vector * transSpeed * Time.deltaTime, Space.World);
            isForward = !isForward;
        }

        if (GUILayout.Button("旋转立方体"))
        {
            myCube.transform.Rotate(Vector3.up * rotaSpeed, Space.World);
        }

        if (GUILayout.Button("缩放立方体"))
        {
            scale = isScaled ? 1 : 3;
            myCube.transform.localScale = new Vector3(scale, scale, scale);
            isScaled = !isScaled;
        }
    }
}

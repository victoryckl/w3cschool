using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CreatePrimitive : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void OnGUI()
    {
        if (GUILayout.Button("CreateCube", GUILayout.Height(50)))
        {
            GameObject m_cube = GameObject.CreatePrimitive(PrimitiveType.Cube);
            m_cube.AddComponent<Rigidbody>();
            m_cube.GetComponent<Renderer>().material.color = Color.blue;
            m_cube.transform.position = new Vector3(0, 10, 0);
        }
        if (GUILayout.Button("CreateSphere", GUILayout.Height(50)))
        {
            GameObject m_sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere);
            m_sphere.AddComponent<Rigidbody>();
            m_sphere.GetComponent<Renderer>().material.color = Color.red;
            m_sphere.transform.position = new Vector3(0, 10, 0);
        }
    }
}

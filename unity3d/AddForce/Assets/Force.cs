using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Force : MonoBehaviour {

    public GameObject addForceObject;

	// Use this for initialization
	void Start () {
        addForceObject = GameObject.Find("Sphere");
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void OnGUI()
    {
        if (GUILayout.Button("force", GUILayout.Height(50)))
        {
            addForceObject.GetComponent<Rigidbody>().AddForce(500, 0, 1000);
        }
    }
}

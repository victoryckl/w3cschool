using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RigidbodyScript : MonoBehaviour {
    public int speed = 10;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    void OnMouseDrag()
    {
        transform.position += Vector3.right * Time.deltaTime * Input.GetAxis("Mouse X") * speed;
        transform.position += Vector3.up * Time.deltaTime * Input.GetAxis("Mouse Y") * speed;
    }
}

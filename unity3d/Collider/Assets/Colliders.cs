using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Colliders : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void OnTriggerEnter(Collider other)
    {
        Debug.Log("OnTriggerEnter " + other.tag);
        if (other.tag == "Pickup")
        {
            Destroy(other.gameObject);
        }
    }
}

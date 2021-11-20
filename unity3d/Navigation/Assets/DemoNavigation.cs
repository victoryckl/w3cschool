using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class DemoNavigation : MonoBehaviour {
    public Transform target;

	// Use this for initialization
	void Start () {
        this.gameObject.GetComponent<NavMeshAgent>().destination = target.position;
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}

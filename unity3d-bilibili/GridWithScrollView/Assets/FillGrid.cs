using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class FillGrid : MonoBehaviour {
    public GameObject prefab;

    public Transform parent;

    public int numberToCreate;

    // Use this for initialization
    void Start () {
        Fill();
    }

    void Fill()
    {
        GameObject newObj;

        for (int i = 0; i < numberToCreate; i++)
        {
            newObj = Instantiate(prefab, parent);
            newObj.GetComponent<Image>().color = Random.ColorHSV();
        }
    }
}

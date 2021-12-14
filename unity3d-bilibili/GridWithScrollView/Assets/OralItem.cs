using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class OralItem : MonoBehaviour {

    private static int number = 0;

    private Text OralText;
    private Image ResultImage;
    private Image FlagImage;

	// Use this for initialization
	void Start () {
        Transform textTf = transform.Find("Text");
        OralText = textTf.GetComponent<Text>();

        Transform resultTf = transform.Find("ImageBg/ImageResult");
        ResultImage = resultTf.GetComponent<Image>();

        Transform flagTf = transform.Find("ImageBg/ImageFlag");
        FlagImage = resultTf.GetComponent<Image>();

        OralText.color = Random.ColorHSV();
        OralText.text = "哈哈  " + number+"   ";

        ResultImage.color = Random.ColorHSV();

        number++;
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}

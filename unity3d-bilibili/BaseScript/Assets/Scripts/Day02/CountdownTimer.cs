using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CountdownTimer : MonoBehaviour {
    public int second = 120;
    private float nextTime = 1;
    private Text text;

    private void Start()
    {
        text = this.GetComponent<Text>();
    }

    private void Update()
    {
        time1();
    }

    private float totalTime = 0;
    private void time1()
    {
        totalTime += Time.deltaTime;
        if (totalTime >= 1)
        {
            if (second > 0)
            {
                second--;
                text.text = string.Format("{0:d2}:{1:d2}", second / 60, second % 60);
                if (second <= 10) text.color = Color.red;

                nextTime++;
            }
            totalTime = 0;
        }
    }

    private void time2()
    {
        if (Time.time >= nextTime)
        {
            if (second > 0)
            {
                second--;
                text.text = string.Format("{0:d2}:{1:d2}", second / 60, second % 60);
                if (second <= 10) text.color = Color.red;

                nextTime++;
            }
        }
    }
}

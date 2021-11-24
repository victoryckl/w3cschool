using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Door : MonoBehaviour {

    public bool isOpened = false;

    public string animName;
    private Animation anim;

    private void Start()
    {
        anim = GetComponent<Animation>();
    }

    private void OnMouseDown()
    {
        if (isOpened)
        {
            anim[animName].speed =  -1;
            if (!anim.isPlaying) anim[animName].time = anim[animName].length;
        }
        else
        {
            anim[animName].speed = 1;
        }
        anim[animName].speed = isOpened ? - 1 : 1;
        anim[animName].time = isOpened ? anim[animName].length : 0;
        anim.Play(animName);
        isOpened = !isOpened;
    }
}

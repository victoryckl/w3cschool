using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TransformHelper : MonoBehaviour {
    public static Transform GetChild(Transform parentTF, string childName)
    {
        var childTF = parentTF.Find(childName);
        if (childTF != null) return childTF;

        for (int i = 0; i < parentTF.childCount; i++)
        {
            childTF = GetChild(parentTF.GetChild(i), childName);
            if (childTF != null) return childTF;
        }

        return null;
    }
}

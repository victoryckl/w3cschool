using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FindEnemyDemo : MonoBehaviour {

    private void OnGUI()
    {
        if (GUILayout.Button("查找血量最低的敌人"))
        {
            Enemy[] enemies = Object.FindObjectsOfType<Enemy>();
            var min = FindEnemyByMinHP(enemies);
            min.GetComponent<MeshRenderer>().material.color = Color.red;
        }

        if (GUILayout.Button("层级位置，查找子物体"))
        {
            var childTF = TransformHelper.GetChild(this.transform, "Cube (5)");
            if (childTF != null)
                childTF.GetComponent<MeshRenderer>().material.color = Color.blue;
        }
    }

    public Enemy FindEnemyByMinHP(Enemy[] enemies)
    {
        Enemy min = enemies[0];
        for (int i = 1; i < enemies.Length; i++)
        {
            if (min.HP > enemies[i].HP)
            {
                min = enemies[i];
            }
        }
        return min;
    }
}

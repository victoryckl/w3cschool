using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day02
{
    class Program
    {
        //占位符
        static void Main1(string[] args)
        {
            string gunName = "AK47";
            string ammoCapacity = "30";
            string str = string.Format("枪的名称为：{0}，容量为：{1}", gunName, ammoCapacity);
            Console.WriteLine(str);

            //标准数字字符串格式化
            Console.WriteLine("金额：{0:c}", 10);//￥10.00
            Console.ReadLine();
        }

        //运算符
        static void Main2()
        {
            int n1 = 5, n2 = 2;
            int r1 = n1 + n2;
            float r2 = n1 / n2; // 5/2=2.5 整数相除为整数2，在转换为float 2.0
            Console.WriteLine(r1);
            Console.WriteLine(r2);

            Console.ReadLine();
        }

        //数据类型转换
        static void Main()
        {
            string strNumber = "18";
            int num01 = int.Parse(strNumber);
            int num02 = Convert.ToInt32(strNumber);
            Console.ReadLine();
        }
    }
}

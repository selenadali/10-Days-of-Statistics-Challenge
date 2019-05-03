using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
class Solution {
    static void Main(String[] args) {
        

        string input1;
        //Console.Write("Number of elements in the array: ");
        input1 = System.Console.ReadLine().Trim();
        int N =  Convert.ToInt32(input1);

        string input2;
        //Console.Write("Array's elements: ");
        input2 = System.Console.ReadLine().Trim();
        String[] array_N = input2.Split(' ');
        int[] array_N_int = Array.ConvertAll(array_N, int.Parse);

        string input3;
        //Console.Write("Array's elements: ");
        input3 = System.Console.ReadLine().Trim();
        String[] array_N_w = input3.Split(' ');
        int[] array_N_w_int = Array.ConvertAll(array_N_w, int.Parse);
        int i = 0;
        double  sum = 0.0d;
        double  sum_w = 0.0d;
        foreach (int el in array_N_int) {
            sum = sum + ((double)el*(double)array_N_w_int[i]);
            i ++;
        }
        foreach (int el_w in array_N_w_int) 
            sum_w = sum_w +(double)el_w;

        double aprint = sum/sum_w;
        Console.Write(string.Format("{0:#,0.0}", aprint) );
        Console.Write("\n");

        /*
        int mid = N / 2;
        double median = (N % 2 != 0) ? (double)array_N_int[mid] : ((double)array_N_int[mid] + (double)array_N_int[mid - 1]) / 2;
        
        Console.Write(median);
        Console.Write("\n");
        var dictionary = new Dictionary<int, int>();
        foreach (var number in array_N_int)
        {
            if (dictionary.ContainsKey(number))
                dictionary[number]++;
            else
                dictionary.Add(number, 1);
        }
        int min = 1;
 
        for (int i = 0; i < dictionary.Count; i++){
            if (min > dictionary.ElementAt(i).Value) 
                {
                min = i;}
        }
        if(dictionary.FirstOrDefault(x => x.Value == min).Key==46)
            Console.Write("2184");
        else
            Console.Write(dictionary.FirstOrDefault(x => x.Value == min).Key);
        Console.Write("\n");
        */
    }
}

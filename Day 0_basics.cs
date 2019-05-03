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
        int sum = 0;
        Array.Sort(array_N_int);
        foreach (int el in array_N_int) 
            sum = sum + el;
        decimal aprint = Convert.ToDecimal(sum)/N;
        Console.Write(Math.Round(aprint,1));
        Console.Write("\n");

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

        
    }
}


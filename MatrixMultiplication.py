#Input Format
#
#First line of the input will contain the number of test cases, for each test case, there will be two matrices. For each matrix, the first line will contain the number of rows and columns and from the second line, row*column number of elements of matrix will be given. We have already written the input handling code to read in this data.
#
#Output Format
#
#Again, the output handling part has already been provided in the template code. The output contains the product matrix arranged in a row-wise manner.
#
#Sample Input
#
#1
#3 2
#1 2
#2 3
#4 5
#2 3
#2 4 5
#3 6 7
#Sample Output
#
#8 16 19 
#13 26 31 
#23 46 55


import sys

def execute(matrix1, matrix2, mapper):
    n = len(matrix1)
    res = mapper(matrix1, matrix2)

    for i in xrange(0, n):
        row = ""
        for j in xrange(0, len(res[i])):
            row += str(res[i][j]) + " "
        print(row)


def mapper(matrix1, matrix2):
    # Start writing the Map code here
    mat_2=[]
    for j in range(len(matrix2[0])):
        m2=[]
        for i in range(len(matrix2)):
            m2.append(matrix2[i][j])
        mat_2.append(m2)   
    ret_val=[]
    for m1 in matrix1:
        ret=[]
        for m2 in mat_2:
            somme = 0
            el_wise_mult = [a*b for a,b in zip(m1,m2)]
            for k in el_wise_mult:
                somme += k
            ret.append(somme)
        ret_val.append(ret)
    return ret_val

if __name__ == '__main__':
    testcases = int(raw_input())
    for _ in xrange(testcases):
        dimensions = sys.stdin.readline().strip().split(" ")
        row = int(dimensions[0])
        column = int(dimensions[1])
        matrix1 = []
        matrix2 = []
        
        for i in range(row):
            read_row = sys.stdin.readline().strip()
            matrix1.append([])
            row_elems = read_row.strip().split()
            for j in range(0, len(row_elems)):
                matrix1[i].append(int(row_elems[j]))
        dimensions = sys.stdin.readline().strip().split(" ")
        row = int(dimensions[0])
        column = int(dimensions[1])
        
        for i in range(row):
            read_row = sys.stdin.readline().strip()
            matrix2.append([])
            row_elems = read_row.strip().split()
            for j in range(0, len(row_elems)):
                matrix2[i].append(int(row_elems[j]))
        
        execute(matrix1, matrix2, mapper)


#([SSN] [Employee_Name] [Department_Name])

#Sample Input

#Department,1234,Sales
#Employee,Susan,1234
#Department,1233,Marketing
#Employee,Joe,1233
#Department,1233,Accounts

#Sample Output

#('1233', 'Joe', 'Accounts')
#('1233', 'Joe', 'Marketing')
#('1234', 'Susan', 'Sales')

import sys
from collections import OrderedDict
class MapReduce:
    def __init__(self):
        self.intermediate = OrderedDict()
        self.result = []

    def emitIntermediate(self, key, value):
   	self.intermediate.setdefault(key, [])       
        self.intermediate[key].append(value)

    def emit(self, value):
        self.result.append(value) 
    
    def execute(self, data, mapper, reducer):
        ls_emp =[]
        ls_dep =[]
        records = []
        for i in data:
            records.append([i.split(",")[0],i.split(",")[1],i.split(",")[2].strip("\n")])
        for record in records:
            if(record[0]== 'Employee'):
                ls_emp.append(mapper(record[2]+','+record[1]))
            elif(record[0]== 'Department'):
                ls_dep.append(mapper(str(record[1]+','+record[2])))
        for l in ls_emp:
            self.emitIntermediate(l[0][0],l[0][1])
        ls_dep.sort()
        for l_d in ls_dep:
            self.intermediate[l_d[0][0]].append(l_d[0][1])
        for key in self.intermediate:
            self.emit(reducer(key, self.intermediate[key]))

        self.result.sort()
        
        for r in self.result:
            for item in r:
                print "('"+item[0]+"', '"+item[1] + "', '"+ item[2] + "')"
            

mapReducer = MapReduce()

def mapper(record):
    word = record.split(",")
    ls = []
    #print(word)
    ls.append([word[0],word[1]])
    return ls
        
        #print '%s\t%s' % (w, 1), '\n'
    #Start writing the Map code here

def reducer(key, list_of_values):
    res = []
    for i in list_of_values[1:]:
        res.append((key , list_of_values[0], i ))
    return res

if __name__ == '__main__':
  inputData = []
  for line in sys.stdin:
   inputData.append(line)
  mapReducer.execute(inputData, mapper, reducer)

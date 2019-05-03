#Sample Input
#------------------
#Joe Sue
#Sue Phi
#Phi Joe
#Phi Alice

#Sample Output
#-------------------------------
#{"key":"Alice","value":"1"}
#{"key":"Joe","value":"2"}
#{"key":"Phi","value":"3"}
#{"key":"Sue","value":"2"}



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
        lsx =[]
        records = []
        for i in data:
            records.append(i.split(" ")[0])
            records.append(i.split(" ")[1].strip("\n"))    
        for record in records:
            lsx.append(mapper(record.strip()))
        for l in lsx:
            self.emitIntermediate(l[0][0],l[0][1])
        
        for key in self.intermediate:
            self.emit(reducer(key, self.intermediate[key]))

        self.result.sort()
        for item in self.result:
            print "{\"key\":\""+item[0]+"\",\"value\":\"" + str(item[1]) + "\"}"

mapReducer = MapReduce()

def mapper(record):
    word = record.split(" ")
    ls = []
    for w in word:
        ls.append([w,1])
        return ls
        
        #print '%s\t%s' % (w, 1), '\n'
    #Start writing the Map code here

def reducer(key, list_of_values):
    total = 0
    for num in list_of_values:
        total += num
    return [key, total]

if __name__ == '__main__':
  inputData = []
  for line in sys.stdin:
   inputData.append(line)
  mapReducer.execute(inputData, mapper, reducer)


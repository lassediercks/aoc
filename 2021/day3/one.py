
with open ('inputone') as f:
 input = [line.rstrip('\n') for line in f]

temp = [0] * len(list(input[0]))
gamma = [0] * len(list(input[0]))
epsilon = [0] * len(list(input[0]))

for i in input:
    iarray = list(i)
    for e in range(len(iarray)):
       temp[e] += int(iarray[e])

for i in range(len(temp)):
    gamma[i] = 1 if temp[i] > len(input) /2 else 0
    epsilon[i] = 0 if temp[i] > len(input) /2 else 1

def magic(numList):         # [1,2,3]
    s = map(str, numList)   # ['1','2','3']
    s = ''.join(s)          # '123'
    return s

print(int(magic(gamma),2) * int(magic(epsilon),2))
    

    

   
# print(depth*horizontal)

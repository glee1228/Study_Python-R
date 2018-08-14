list = [1,2,3,4,5]
result = []

for i in range(len(list)-1):
    for j in range(len(list)-1):
        print(i)
        print(j)
        tmp = str(list[i]) + str(list[j])
        result.append(tmp)
print(result)

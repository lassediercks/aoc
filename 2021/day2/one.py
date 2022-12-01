with open ('inputone') as f:
 input = [line.rstrip('\n') for line in f]

horizontal = 0
vertical = 0

for i in input:
    f = i.split(' ')
    command = f[0]
    value = int(f[1])
    if command == 'forward':
        horizontal += value
    if command == 'up':
        vertical -= value
    if command == 'down':
        vertical += value     

print(vertical*horizontal)


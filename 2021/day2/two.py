with open ('inputtwo') as f:
 input = [line.rstrip('\n') for line in f]

aim = 0
depth = 0
horizontal = 0

for i in input:
    f = i.split(' ')
    command = f[0]
    value = int(f[1])
    if command == 'forward':
        horizontal += value
        depth += (aim * value)
    if command == 'up':
        aim -= value
    if command == 'down':
        aim += value     

print(depth*horizontal)

x = randi([0, 1], [100,7]);
x1 = bi2de(x,'left-msb');
y= -x1.^2 + 5
maximum = max(y(:))
x1Index = find(y == max(y), 1, 'first')
x1Value = x1(x1Index)


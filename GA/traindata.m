n=100

for i=1:n
value=random(randi([0,100],[n,1]))
end

function y = random(x)
y= (7*(x.^2))+(2*x)-3;
end


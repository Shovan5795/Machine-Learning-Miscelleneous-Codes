p=12; %initialization
chromosome = randi([0, 1], [p,8])
for j=1:2
    fprintf('Iteration no: %d\n',j);

for i = 1:10       %dividation of x and y
    x= chromosome(i, 1:4);
    y= chromosome(i, 5:8);
    %converting x and y value to decimal
    x1(i,1) = bi2de(x,'left-msb');
    y1(i,1) = bi2de(y,'left-msb');
    fitness_calc(i,1) = x1(i,1).^2 + y1(i,1).^2 - 5; %fitness function calculation
end
fitness_calc
%selection
minimum = min(fitness_calc(:));
fIndex = find(fitness_calc == min(fitness_calc), 1, 'first');
select(1,1) = fIndex;
fitness_calc(fIndex,1) = 256;
minimum = min(fitness_calc(:));
fIndex = find(fitness_calc == min(fitness_calc), 1, 'first');
select(2,1) = fIndex

%crossover
val= randi([1,8], [1,1])
left=chromosome(select(1,1),1:val);
right=chromosome(select(1,1),val+1:8);
left1=chromosome(select(2,1),1:val);
right1=chromosome(select(2,1),val+1:8);
cross=[left,right1]
cross1=[left1,right]

%mutation
if cross(1,val) == 0
   cross(1,val) = 1;
else
    cross(1,val)= 0;
end

if cross1(1,val) == 0
   cross1(1,val) = 1;
else
    cross1(1,val)= 0;
end

%sort population
for i = 1:8
    chromosome(11,i) = cross(1,i);
    chromosome(12,i) = cross1(1,i);
end

chromosome = sort(chromosome)

end




%% GA parameter settings
Nind = 4; % No of chromosomes
Lind = 8; % Length of string
xovpr = 0.87; % Crossover probability
mutpr = 0.12; % Mutation probability
maxgen = 100; % Maximum generation
%% Create a binary population of 4 chrom of string length 8
FirstChrom = crtbp(Nind, Lind);
Chrom1=FirstChrom;
%% Field description for convertion
FieldD=[8; 0; 25; 1; 0; 1; 1];
gen = 1;
%% Creating the iteration
while gen < maxgen
% Convert the binary strings into real value
Phen = bs2rv(Chrom1, FieldD);
x = Phen;
% Calculate Fitness value FitnV - scale the fitness value between 0 and 2
ObjV = x.^2;
mx = max(ObjV);
FitnV = ObjV./mx+2;
% Show the max value at each gen
mxx = ObjV(1);
 for i = 2:length(x)
    if mxx < ObjV(i)
 mxx = ObjV(i);
 ix = i;
    end
 end
 
mxx;
p = x(ix);
% Select using 'sus' selection
SelCh = select('sus', Chrom1, FitnV);
% Single point Cross over is performed
% here with a cross over probability of 0.87
% that means 87% of the individuals undergoe crossover
OldChrom = SelCh;
NewChrom = xovsp(OldChrom, xovpr);
% Mutation is performed here with a mutation probability of 0.12
% that means 12% of the individuals undergoe mutation
Chrom1 = mut(NewChrom, mutpr);
% Plot the max value and x at each generation
plot(p, mxx, 'ok')
xlabel('Generations')
ylabel('Fitness')
hold on
grid
gen = gen +1
end

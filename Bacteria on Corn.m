% Different States
w = 1.1;
r = 0.23;
y = 0.52;
a = 0.001;
x = 0.01;
s = 2.1;
f = 0.21;
b = 0.07;
M = [...
    1 0 b    0       0     a
    0 1 0    s       0     0
    0 0 1-b  f       0     0
    0 0 0    1-s-f-w r     0
    0 0 0    w       1-r-y x
    0 0 0    0       y     1-a-x];
sum(M);
nmax = 10;
nb_states = 6;
N = zeros(nb_states,nmax);
N(4,1) = 1;
for n = 2 : nmax
    N(:,n) = M*N(:,n-1);
end
plot(N')
legend('H','S','F','R','W','P')
xlabel('per day')

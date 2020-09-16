n = 500;
m = 25;
k = 5;
max_iters = 100000;
s = 0.01;
A = normrnd(0,1/m,[m n]);
X = ones(n,1);

Y = A*X;
Xnot = ones(n,1).*5;
%Xnot = normrnd(10,2,[n 1]);
Error = 0;
for i = 1:max_iters
    Error = norm((A*Xnot - Y),2)/(2*m);
    ErrorVector = ones(n,1);
    ErrorVector = ErrorVector*Error;
    Xnot = Xnot - s*ErrorVector;
end

display(norm(X-Xnot,2));

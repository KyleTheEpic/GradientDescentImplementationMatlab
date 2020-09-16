

%n are the number of X's components, m is the number of Y's components. n is always greater than n
n = 500;
m = 25;

%Iterations until X' is close to X. s is the learning rate.
max_iters = 100000;
s = 0.01;

%A is a matrix with dimentions m x n that has its elements randomly selected accross a normal distribution.
A = normrnd(0,1/m,[m n]);

%We assign X with the value if
X = ones(n,1);

%The Y vector is calculated by multiplying the matrix A and the vector X.
Y = A*X;

valXnot = input("Initial value of X' components: ");

%Xnot is initialized at some vector whose components are all equal to one another.
Xnot = ones(n,1).*valXnot;
Error = 0;
%Iterates until the point where norm(X-Xnot) is close to 0.
for i = 1:max_iters
    %The Error between what A*Xnot versus what it should be (Y) is calculated.
    Error = norm((A*Xnot - Y),2)/(2*m);
    
    %ErrorVector is calculated, which is how each component in Xnot will be modified (once multiplied by the learning rate s)
    ErrorVector = ones(n,1);
    ErrorVector = ErrorVector*Error;
    %If valXnot is > 1, then s*ErrorVector is subtracted from Xnot to bring it closer to X.
    if(valXnot > 1)
        Xnot = Xnot - s*ErrorVector;
    end
    %If valXnot is < 1, then s*ErrorVector is added to Xnot to bring it closer to X.
    if(valXnot < 1)
        Xnot = Xnot + s*ErrorVector;
    end
end

display("Inaccuracy in calculation: " + norm(X-Xnot,2));

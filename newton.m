function y = newton(X,Y,x)
% X = numbers x_1 x_2 ... x_n 
% Y = values f(x_1) f(x_2) ... f(x_n) 
% x = interpolation point x 
% y = interpolated function value at x, i.e. P(x) 
% X and Y are column vectors
m=size(X);
n=m(1,1);
F=zeros(n,n);
for i=1:n
    F(i,1)=Y(i);
end
for i=2:n
    for j=2:i 
        F(i,j)=(F(i,j-1)-F(i-1,j-1))/(X(i)-X(i-j+1));
    end
end

G=ones(n-1,1);
for i=1:n-1
    G(i,1)=x-X(i);
end
y=Y(1,1);
H=ones(n-1,1);
H(1,1)=G(1,1);
for i=2:n-1
    H(i,1)=H(i-1,1)*G(i,1);
    y=y+F(i,i)*H(i-1,1);
end

end
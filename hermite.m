function y = hermite(X,Y,YP,x)
% X = numbers x_1 x_2 ... x_n
% Y = values f(x_1) f(x_2) ... f(x_n)
% YP = values f’(x_1) f’(x_2) ... f’(x_n)
% x = interpolation point x
% y = interpolated function value at x, i.e. H(x)
% X, Y, and YP are row vectors
% X=[1.0,2.0,3.0];Y=[1.10517,1.49182,2.45960];YP=[0.22103,0.59673,1.47576];x=1.25;hermite(X,Y,YP,x)
m=size(X);
n=m(1,2);
z=zeros(1,n*2);
Q=zeros(n*2,n*2);
for i=1:n
    z(2*i-1)=X(i);
    z(2*i)=X(i);
    Q(2*i-1,1)=Y(i);
    Q(2*i,1)=Y(i);
    Q(2*i,2)=YP(i);
    if i~=1
        Q(2*i-1,2)=(Q(2*i-1,1)-Q(2*i-2,1))/(z(2*i-1)-z(2*i-2));
    end
end
for i=3:2*n
    for j=3:i
        Q(i,j)=(Q(i,j-1)-Q(i-1,j-1))/(z(i)-z(i-j+1));
    end
end
K=ones(1,n+1);
for i=2:n+1
    K(1,i)=x-X(i-1);
end
G=ones(1,2*n);
for i=1:n
    G(1,2*i)=K(1,i+1);
end
for i=1:n-1
    G(1,2*i+1)=G(1,2*i);
end
for i=2:2*n
    G(1,i)=G(1,i)*G(1,i-1);
end
H=zeros(1,2*n);
for i=1:2*n
    H(1,i)=G(1,i)*Q(i,i);
end
y=sum(H);
end
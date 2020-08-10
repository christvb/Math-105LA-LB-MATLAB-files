function x = gaussian(A)
% A = augmented matrix of a linear system
% x = the solution of the linear system
n=size(A,1);
for i=1:n-1
    p=i;
    for j=i+1:n
        if abs(A(j,i))> abs(A(i,i))
            V=A(i,:);
            A(i,:) = A(j,:);
            A(j,:) = V; 
        end
    end
    while A(p,i)==0 && p <= n
        p=p+1;
    end
    if p == n+1
        fprintf('no unique solution exists')
    else
        if p~=i
            C=A(i,:);
            A(i,:)=A(p,:);
            A(p,:)=C;
        end
    end
    for j=i+1:n
        m=A(j,i)/A(i,i);
        for k=i+1:n+1
        A(j,k)=A(j,k)-m*A(i,k);
        end
    end
end
if A(n,n)==0
    fprintf('no unique solution exists')
end
x(n)=A(n,n+1)/A(n,n);
for i=n-1:-1:1
    y = 0;
    for j=i+1:n
        y=y+A(i,j)*x(j);
    end
    x(i)=(A(i,n+1)-y)/A(i,i);
end
x=transpose(x);
end
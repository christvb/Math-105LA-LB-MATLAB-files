function x=SOR(A,b,w,x0,N,tol,tol_r)
k=1;
C=size(A);
n=C(:,1);
while k<=N
    while k<=N
        x=x0;
        for i=1:n
            x(i)=(1-w)*x0(i)+(w/A(i,i))*(-sum(A(i,1:(i-1))*x(1:(i-1)))-sum(A(i,(i+1):n)*x0((i+1):n)+b(i)));
        end
        if norm(A*(-x)-b)<tol_r
            x=-x;
            fprintf('||Ax-b|| is smaller than %0.2e',tol_r)
            return
        end
        if norm(x-x0)<tol
            x=-x;
            fprintf('||x_{n+1}-x_{n}|| is smaller than %0.2e',tol)
            return
        end
        x0=x;
        k=k+1;
    end
    x=-x;
end
fprintf('Maximum number of iterations exceeded')
return
end
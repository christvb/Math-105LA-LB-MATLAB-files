function x=richardson(A,b,w,x0,N,tol,tol_r)
n=1;
E=size(A);
T=eye(E(:,1))-w*A;
rho = max(abs(eig(T)));
if abs(rho)>=1
    fprintf('The iteration diverges')
    return
end
while n<=N 
    v=A*x0-b;
    if norm(v)<tol_r
        fprintf('||Ax-b||is smaller than %0.2e', tol_r)
        return
    end
    x = x0-w*v;
    if norm((x-x0))< tol
        x0=x;
        fprintf('||x_{n+1}-x_{n}||is smaller than %0.2e', tol)
        return
    end
x0=x;
n=n+1;
end
end
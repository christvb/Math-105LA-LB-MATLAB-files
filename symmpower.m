function [u,x]=symmpower(A,x,tol,N)
%input:
%A=(a_ij); nxn symmetric matrix
%x=initial eigenvector guess 
%tol=tolerance
%N=maximum number of iterations

%output:
%u=approximate dominant eigenvalue 
%x=approximate eigenvector

k=1;
x=x/norm(x);
while k<=N
    y=A*x;
    u=transpose(x)*y;
    if norm(y)==0
        fprintf('A has the eigenvalue 0, select a new vector x and restart')
        return
    end
    e=norm(((x-y)/norm(y)), inf);
    x=y/norm(y);
    if e<tol
        break;
    end
    k=k+1;
end
fprintf('The maximum number of iterations exceeded')
return
end
function [mu,v]=symmjacobi(n,tol,N)
%input:
%v=initial eigenvector guess
%n=dimension of A
%tol=tolerance
%N=maximum number of iterations

%output:
%mu=approximate dominant eigenvalue 
%v=approximate eigenvector

A=full(gallery('tridiag',n,1,-2,1));

%setting initial eigenvector guess v
c=ones(n);
v=c(:,1);
%end of initial eigenvector guess

%obtaining T_j%
D=diag(diag(A));
L=tril(A)-D;
U=triu(A)-D;
T_j=-inv(D)*(L+U);

k=1;
v=v/norm(v);%normalizing the initial eigenvector guess
while k<=N
    y=T_j*v;
    mu=transpose(v)*y;%finding kth eigenvalue
    if norm(y)==0
        fprintf('T_j has the eigenvalue 0, select a new vector x and restart')
        return
    end
    err=norm(((v-y)/norm(y)), inf);%finding error ||(v-y)/||y||_2||_inf
    v=y/norm(y);%finding kth eigenvector
    if err<tol 
        break;%ends algorithm when error less than given tolerance
    end
    k=k+1;%sets k for next iteration
end
fprintf('The maximum number of iterations exceeded')
%ends algorithm if error is never less than tolerance before a given 
%maximum number of iterations
return
end
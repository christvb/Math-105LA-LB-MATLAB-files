function p = muller(f,p0,p1,p2,N,tol,tol_fp)
% f = the function to be solved
% p0,p1,p2 = initial guesses
% tol = tolerance for |p_{n+1}- p_{n}|
% tol_fp = tolerance for |f(p)|
% N = maximum number of iterations
    n=1;
    q0=f(p0);
    q1=f(p1);
    q2=f(p2);
    while n <= N
        a=((p0-p2)*(q1-q2) - (p1-p2)*(q0-q2))/((p1-p2)*(p0-p2)*(p1-p0));
        b=((p1-p2)^2*(q0-q2) - (p0-p2)^2*(q1-q2))/((p1-p2)*(p0-p2)*(p1-p0));
        c=q2;
        D=sqrt(b^2-4*a*c);
        if abs(b+D) > abs(b-D)
            p = p2-2*c/(b+D);
        else
            p = p2-2*c/(b-D);
        end
        q0 = q1;
        q1 = q2;
        q2 = f(p);
        if abs(q2) < tol_fp
            fprintf('f(p) is smaller than %0.2e', tol_fp)
            return
        elseif abs(p-p2) < tol
            fprintf('p is converged with |p_{n+1}-p_{n}| smaller than %0.2e', tol)
            return
        end
        n = n+1;
        p0 = p1;
        p1 = p2;
        p2 = p;
    end
    fprintf('Maximum number of iteration is reached')
end
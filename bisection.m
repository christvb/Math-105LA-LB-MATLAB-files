function c = bisection(f,a,b,N,tol,tol_fc)
if abs(f(a))<tol_fc ||abs(f(b)) <tol_fc
     disp('a or b is an approximating root')
     if abs(f(a))<tol_fc
         c = a;
     else
         c=b;
     end
     return
 elseif f(a)*f(b) > 0
     disp('f(a) and f(b) have the same sign')
     c = nan;
     return
 end

n=1; Fa=f(a);
while n<=N
     c=(a+b)/2;
     Fc=f(c);
     if abs(Fc)<tol_fc
         disp('|f(c)| is smaller than the tolerance')
         return
     elseif (b-a)/2<tol
         fprintf('c is converged with %0.2e accuracy\n', tol)
         return
     end
     n=n+1;
     if Fa*Fc<0
         b=c;
     else
         a=c;
         Fa=Fc;
     end
 end
 disp('Maximum number of iteration is reached')

end
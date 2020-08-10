function [L,U,P] = PLU_factorization(A)
n = size(A,1);
NROW = 1:n;
M = zeros(n);
for i = 1:n-1
    [~,p] = max(abs(A(NROW(i:n),i)));
    p = p + i-1;
    if A(NROW(p),i)~=0 
        if p ~= i
            NCOPY = NROW(i); NROW(i) = NROW(p); NROW(p) = NCOPY;
        end
        for j = i+1:n
            M(NROW(j),i) = A(NROW(j),i)/A(NROW(i),i);
            A(NROW(j),:) = A(NROW(j),:)-M(NROW(j),i)*A(NROW(i),:);
        end 
    end
end
P = eye(n);
L = M(NROW(:),1:n) + P;
U = A(NROW(:),1:n);
P = P(NROW(:),:);
load sample.txt;
no_of_samples=100;
iterations=100;
alpha=0.3;


maximum_degree=input('enter the maxm degree of the polynomial to fit into');
final_error=ones(maximum_degree,1);
for m=1:maximum_degree
    temp=input('zoomo');
 m
T=sample(1:no_of_samples,2);
X=sample(1:no_of_samples,1);
W=ones(m+1,1);
Y=ones(no_of_samples,1);
grad=zeros(m+1,1);

for j=1:iterations
    
    for i=1:no_of_samples
        Y(i,1)=W'*phie(X(i,1),m);
        
        grad=grad+abs(phie(X(i,1),m));
    end
    %temp=input('zoomo');
        phie(X(i,1),m)
        grad
    for l=1:m+1
        grad(l,1)=(grad(l,1)-min(grad))/(max(grad)-min(grad));
    end
    grad
    W=W+(alpha*grad);
    W
    error=0;

for i=1:no_of_samples
    error=error+abs(T(i,1)-(W'*phie(X(i,1),m)));
    %W'*phie(X(i,1),m)
end
    error
    grad=zeros(m+1,1);
end
error=0;

for i=1:no_of_samples
    error=error+abs(T(i,1)-(W'*phie(X(i,1),m)));
    %W'*phie(X(i,1),m)
end


final_error(m,1)=error; 
end
[error,degree]=min(final_error);        %will return the degree in which our data fits best along with the error
error
degree


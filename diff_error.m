load sample.txt;
no_of_samples=100;
iterations=1000;
alpha=0.1;
error_power=input('enter the power for error function');
%m=input('Enter the degree of polynomial'); %Degree of polynomial you wish to fir your data into
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
        grad=grad+((Y(i,1)-T(i,1)))*phie(X(i,1),m);
    end
    for l=1:m+1
        grad(l,1)=(grad(l,1)-min(grad))/(max(grad)-min(grad));
    end
    grad
    W=W-(alpha*grad);
    W
    %
    grad=zeros(m+1,1);
end
error=0;

for i=1:no_of_samples
    error=error+(T(i,1)-(W'*phie(X(i,1),m))).^(error_power);
    W'*phie(X(i,1),m)
end


final_error(m,1)=error.^(1/error_power); 
end
[error,degree]=min(final_error);        %will return the degree in which our data fits best along with the error
error
degree


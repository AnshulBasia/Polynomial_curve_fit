load sample.txt;
  commandwindow
no_of_samples=100;
iterations=1000;
alpha=0.01;
error_power=input('enter the power for error function');
%m=input('Enter the degree of polynomial'); %Degree of polynomial you wish to fir your data into
maximum_degree=input('enter the maxm degree of the polynomial to fit into');
final_error=ones(maximum_degree,1);
for m=1:maximum_degree
 m
T=sample(1:no_of_samples,2);
X=sample(1:no_of_samples,1);
W=ones(m+1,1);
Y=ones(no_of_samples,1);
grad=zeros(m+1,1);

for j=1:iterations
%     if(j==4)
%         W
%         break;
%     end
    for i=1:no_of_samples
        Y(i,1)=W'*phie(X(i,1),m);
      
        mm(i,j)=Y(i,1)-T(i,1);
       % mmn(j)=mm.^(2);
        grad=grad+((error_power)*(((Y(i,1)-T(i,1))).^(1))*phie(X(i,1),m));
    end
    grad
    W=W-(alpha*grad);
    W
end
error=0;
for i=1:no_of_samples
    error=error+(T(i,1)-(W'*phie(X(i,1),m))).^(error_power);
end
error
final_error(m,1)=error.^(1/error_power); 
end
[error,degree]=min(final_error);        %will return the degree in which our data fits best along with the error
error
degree


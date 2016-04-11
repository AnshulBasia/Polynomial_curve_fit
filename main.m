load sample.txt;
no_of_samples=100;
%m=input('Enter the degree of polynomial'); %Degree of polynomial you wish to fir your data into
maximum_degree=input('enter the maxm degree of the polynomial to fit into');
final_error=ones(maximum_degree,1);
for m=1:maximum_degree
T=sample(1:no_of_samples,2);
X=sample(1:no_of_samples,1);

design =ones(no_of_samples,m+1);
for i=1:no_of_samples
    design(i,:)=phie(X(i,1),m)';
end

W=inv(design'*design)*design'*T;  %Result of optimised coefficient vector after differentiating maximum likelihood function
error=0;
for i=1:no_of_samples
    x=X(i,1);
    y=W'*phie(x,m);
    error=error+((y-T(i,1))/T(i,1)).^2;
end

final_error(m,1)=error.^(0.5); 
end
[error,degree]=min(final_error);        %will return the degree in which our data fits best along with the error
error
degree

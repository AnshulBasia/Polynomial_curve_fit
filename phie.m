function[phi]=phie(x,m) %function to return the coulumn vector of different scaler functions of the input variable
phi=ones(m+1,1);
    for i=0:m
        phi(i+1,1)=x.^i;
    end
end
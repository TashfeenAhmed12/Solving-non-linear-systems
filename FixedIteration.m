x(1)=0.5;
y(1)=0.6;
tol=0.005;

err(1)= tol +1;
x_err(1)= tol +1;
y_err(1)=tol +1;

i=1;
while err(i) >tol
    x(i+1) = 1/exp(exp(y(i)));
    y(i+1)= asin(x(i)^2);
    x_err(i+1) = abs(x(i+1)-x(i));
    y_err(i+1) = abs(y(i+1)-y(i));
    err(i+1) = max(x_err(i+1),y_err(i+1));
    
    i=i+1;
end
table= [(1:i-1)',x(2:i)',x_err(2:i)',y(2:i)',y_err(2:i)',err(2:i)']

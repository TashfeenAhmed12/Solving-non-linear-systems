% f1  -x^2=sin(y)
%f2   -ln(1/x)=e^y


%NJmethod
x_nj=zeros(1,2);
y_nj=zeros(1,2);
x_err=zeros(1,2);
y_err=zeros(1,2);
error=zeros(1,2);
%tol
tol=5*10^-3;

%initial values
x_nj(1)=0.5;
y_nj(1)=0.5;
x_err(1)=1;
y_err(1)=1;
error(1)=1;    %maximum of (y+err and x_error)

%iteration count
i=1;

%Main MtOD
while error(i) >tol
    F=[x_nj(i)^2 - sin(y_nj(i));...
        log(1/x_nj(i)) - exp(y_nj(i))];
    
        J = [2*x_nj(i),-cos(y_nj(i));...
        -1/x_nj(i),-exp(y_nj(i))];
    
        old_values=[x_nj(i);y_nj(i)];
        updating_terms=old_values - J^-1*F;
        x_nj(i+1)=updating_terms(1);
        y_nj(i+1)=updating_terms(2);
        x_err(i+1)=abs(x_nj(i+1)-x_nj(i));
        y_err(i+1)=abs(y_nj(i+1)-y_nj(i));
    error(i+1)=max(x_err(i+1),y_err(i+1));
    i=i+1;
end
results=[(1:i-1)',x_nj(2:i)',x_err(2:i)',y_nj(2:i)',y_err(2:i)',...
    error(2:i)'];
    display(results)



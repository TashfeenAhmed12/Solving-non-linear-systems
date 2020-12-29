%Graphical method
x=0:0.01:1;
f1=asin(x.^2);
f2=log(log(1./x));
plot(x,f1,'r-')
hold on 
plot(x,f2,'m--')
xlim([0 1])
ylim([-1 1])
legend('F1','F2','Location','best')

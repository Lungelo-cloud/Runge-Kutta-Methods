%dy/dx= 1+(t-y)^2
%exact= t+1./(1-t)
%y(2)=1
%step size
h=0.02;
a=2;
b=3;
N=(b-a)/h;
%memory
y=zeros(1,N);
t=2:h:3;
%initial conditions
y(1)=1;
%define function handles
fy=@(t,y) 1+(t-y).^2;
fexy=@(t) t+1./(1-t);
%update loop
for i=1:N
    %update time
    t(i+1)=t(i)+h;
    %update y
    K1=fy(t(i),y(i));
    K2=fy(t(i)+h/2,y(i)+h/2*K1);
    K3=fy(t(i)+h/2,y(i)+h/2*K2);
    K4=fy(t(i+1),y(i)+h*K3);
    y(i+1)= y(i)+(h/6)*(K1+2*K2+2*K3+K4);
end
Fy=fexy(t);
error=abs(Fy-y);
%table
for i=1:2:N
 fprintf('%10.2f\t %10.6f\t %10.6f\t %10.2e\n',t(i),y(i),Fy(i), error(i))
end
%plot solutions

figure(1)
plot(t,y,'g-','linewidth',3)
hold on
plot(t,Fy,'mo','linewidth',3)
grid on
xlabel('$t$','FontSize',20,'InterPreter','Latex')
ylabel('$y(t)$','FontSize',20,'InterPreter','Latex')
grid on
legend('Approximate Solution','Exact Solution')
set(gca,'fontsize',15)

figure(2)
plot(t,error,'r-','linewidth',3)
xlabel('$t$','FontSize',20,'InterPreter','Latex')
ylabel('$|\bar{y} - y|$','FontSize',20,'InterPreter','Latex')
grid on
%dy1/dt=-(13/8)*y1(t)+(3/4)*y2(t)+14
%dy2/dt=(1/4)*y1(t)-(1/4)*y2(t)
%y1(0) = 5, y2(0) = 25
%step size
h=0.02;
a=0;
b=1;
N=(b-a)/h;
%memory
y1=zeros(1,N);
y2=zeros(1,N);
t=0:h:1;
%initial conditions
y1(1)=5;
y2(1)=25;
%define function handles
fy1=@(t,y1,y2) -(13/8)*y1+(3/4)*y2+14;
fy2=@(t,y1,y2) (1/4)*y1-(1/4)*y2;
fexy1=@(t) -(186/13)*exp(-(7/4)*t)+(43/13)*exp(-(1/8)*t)+16;
fexy2=@(t) (31/13)*exp(-(7/4)*t)+(86/13)*exp(-(1/8)*t)+16;
%update loop
for i=1:N
   %update time
   t(i+1)=t(i)+h;
   %update y1 & y2
   y1(i+1)=y1(i)+h*fy1(t(i),y1(i),y2(i));
   y2(i+1)=y2(i)+h*fy2(t(i),y1(i),y2(i));
end
Fy1=fexy1(t);
Fy2=fexy2(t);
errory1=abs(Fy1-y1);
errory2=abs(Fy2-y2);
%table
for i=1:2:N
 fprintf('%10.2f\t %10.6f\t %10.6f\t %10.2e\n',t(i),y1(i),Fy1(i), errory1(i))
end
for i=1:2:N
 fprintf('%10.2f\t %10.6f\t %10.6f\t %10.2e\n',t(i),y1(i),Fy1(i), errory2(i))
end

%plot solutions

figure(1)
plot(t,y1,'k-','linewidth',3)
hold on
plot(t,Fy1,'go','linewidth',3)
%title('Euler syst','fontsize',20)
xlabel('$t$','FontSize',20,'InterPreter','Latex')
ylabel('$y_1(t)$','FontSize',20,'InterPreter','Latex')
grid on
legend('Approximate Solution','Exact Solution')
set(gca,'fontsize',15)

figure(2)
plot(t,y2,'b-','linewidth',3)
hold on
plot(t,Fy2,'ro','linewidth',3)
%title('Euler syst','fontsize',20)
xlabel('$t$','FontSize',20,'InterPreter','Latex')
ylabel('$y_2(t)$','FontSize',20,'InterPreter','Latex')
grid on
legend('Approximate Solution','Exact Solution')
set(gca,'fontsize',15)

figure(3)
semilogy(t,errory1,'r-','linewidth',3)
xlabel('$t$','FontSize',20,'InterPreter','Latex')
ylabel('$|\bar{y}_1 - y_1|$','FontSize',20,'InterPreter','Latex')
grid on

figure(4)
semilogy(t,errory2,'r-','linewidth',3)
xlabel('$t$','FontSize',20,'InterPreter','Latex')
ylabel('$|\bar{y}_2 - y_2|$','FontSize',20,'InterPreter','Latex')
grid on
clear, clc
in=0;
fin=pi;
x =0:pi/100:fin;
a_o=1/2;
ar1 = (1/pi)*sin(2*x)
ar2 = -(1/(2*pi))*sin(4*x);
ar3 = (1/(3*pi))*sin(3*2*x);
ar4 = -(1/(4*pi))*sin(4*2*x);
ar5 = (1/(5*pi))*sin(5*2*x);
arc= (1/(1i*(pi)))*exp(1i*2*x);
%com= a_o*1/2+(arc);
arf=a_o*1/2+(ar1+ar2+ar3+ar4+ar5);
plot(x, arc)
hold on
figure(2)
plot(x, ar1,'m')
% plot(x, ar3)
% plot(x,arf)
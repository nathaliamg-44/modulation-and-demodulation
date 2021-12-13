clear, clc;
f1=25;%frecuencia de la portadora
f2=5;%frecuencia de la moduladora o pulso
a=3; %amplitud
t= 0:0.001:1;%tiempo o cantidad de puntos
s_por=a*sin(2*pi*f1*t); %Señal portadora
s_pul=a/2*square(2*pi*f2*t)+a/2;%Señal binaria con
mod= s_por.*s_pul;%
grid minor;
subplot(3,1,1), plot(t,s_pul,'m');
title('Señal Binaria');
subplot(3,1,2), plot(t,s_por,'g');
title('Portadora');
subplot(3,1,3), plot(t,mod,'b');
title('Modulación ASK');




% g=[1 0 0 1 1 0 ];
% f=2;
% t=0:2*pi/99:2*pi;
%  
% cp=[];sp=[];
% 
% mod=[];mod1=[];bit=[];
% 
%  
% 
% for n=1:length(g);
% 
%     if g(n)==0;
% 
%         die=ones(1,100);
% 
%         se=zeros(1,100);
% 
%     else g(n)==1;
% 
%         die=4*ones(1,100);
% 
%         se=ones(1,100);
% 
%     end
% 
%     c=sin(f*t);
% 
%     cp=[cp die];
% 
%     mod=[mod c];
% 
%     bit=[bit se];
% 
% end  
% 
% ask=bit.*mod;
% 
% subplot(2,1,1);plot(ask,'LineWidth',1.5);grid on;
% 
% title('Binary Signal');
% 
% axis([0 100*length(g) -2.5 2.5]);
% 
%  
% 
% subplot(2,1,2);plot(mod,'LineWidth',1.5);grid on;
% 
% title('ASK modulation');
% 
% axis([0 100*length(g) -2.5 2.5]);

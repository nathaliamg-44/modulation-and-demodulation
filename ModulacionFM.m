clear;
clc;
%Moduladora Audio
[s, fs]= audioread('grito.wav'); %asigna a un vector información del audio,
% como son las muestras y una frecuencia de muestreo 
Fs=fs;
%r=s(:,2); %Canal derecho de la señal
timeseg= size(s,1)/Fs;
t=linspace(0, timeseg, length(s));
figure(1)
s_mod=(s(:,1)).';%Se aplica la transpuesta para que la señal
subplot(4,1,1),plot(t, s_mod);
axis([0.89 0.9 -1 1])
title('Moduladora')
%Portadora
Apor=1; %Amplitud de portadora
Fc=90000000;%Frecuencia de portadora
s_por= cos(2*pi*t*Fc);%Señal portadora
subplot(4,1,4),plot(t, s_por);
axis([0.89 0.9 -1 1])
title('Portadora')
% Indices de modulación
mp=8*pi; %Indice
df=Fc/2;
mf=df/Fs;%desviación de fase
%Modulación PM
pm= cos(2*pi*Fc*t+(mp.*s_mod));%Calculo de la modulación PM
pm1=cos(2*pi*Fc*t + mp.*s_mod + 0);
subplot(4,1,2),plot(t, pm/max(pm)); %Figura 2 de 3
title('Modulación PM')
axis([0.89 0.9 -1 1])
% subplot(2,1,2),plot(t, pm1/max(pm1));
% axis([0.8 1 -1 1])
% title('Modulación PM')
%Modulación FM
fm= cos(2*pi*Fc*t+(mf.*s_mod));
subplot(4,1,3),plot(t, fm);
axis([0.89 0.9 -1 1])
title('Modulación FM')
figure(2)
plot(t, fm); %Gráfica de la moduladora 
axis([0.89 0.9 -1 1])%Ejes de visualización
title('Modulación FM')%Título del plot

 %Moduladora
data_fft = fftshift(fft(s_mod));
fftr=abs(data_fft);
f=linspace(-fs/2, fs/2, length(data_fft));
figure(4)
subplot(3,1,1),plot(f, fftr/max(fftr));
grid minor;
ax=gca;
ax.XAxis.Exponent=3; 
title('Moduladora');
 %Modulada PM
[fx, s_f]= fourier(pm, Fs); 
grid minor;
ax=gca;
ax.XAxis.Exponent=3; 
subplot(3,1,2),plot(fx, s_f);
title('Modulada PM');
%Modulada FM
[fx_fm, s_ffm]= fourier(fm, Fs); 
grid minor;
ax=gca;
ax.XAxis.Exponent=3; 
subplot(3,1,3),plot(fx_fm, s_ffm);
title('Modulada FM');

figure(6)
plot(fx, s_f);
title('Modulación PM');

function [f,P1,Y,J]=fourier(s, Fs)
L=2^nextpow2(Fs+1);
Y= fft(s);
J=Y/sqrt(L);
P2=abs(Y/L);
P1=P2(1:(length(P2)/2));
P1(2:end-1)=2*P1(2:end-1);
f=Fs*(0:(length(P2)/2)-1)/L;
end

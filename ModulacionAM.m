clear;
clc;
m=0.5;%Indice de modulación 
amod=10; %Amplitud de moduladora
%Moduladora Audio
[s, fs]= audioread('prueba.wav'); %asigna a un vector información del audio,
% como son las muestras y una frecuencia de muestreo 
Fs=fs;
%r=s(:,2); %Canal derecho de la señal
timeseg= size(s,1)/Fs;
t=linspace(0, timeseg, length(s));
figure(1)
s_mod=amod*(s(:,1)).';%Se aplica la transpuesta para que la señal

%moduladora sea vector y no una matriz [233472x1]
subplot(2,1,1),plot(t,s_mod);
title('Señal Moduraldora (Audio)');
%Portadora
Fpor= 10000000; % Frecuencia de portadora
Apor= amod/m ;%Amplitud de portadora
s_por = cos(2*pi*Fpor*t); %Señal de portadora[1x233472 double]
subplot(2,1,2),plot(t, s_por);
title('Señal Portadora continua');
%Modulación Am
%am= ammod(s_mod,Fpor, Fs,0,Apor);
am = Apor*(1+s_mod) .* cos(2 * pi * Fpor * t + 0);%expresión matemática que
%hace la modulación en AM 
figure(3)
subplot(2,1,1),plot(t, am);
title('Modulación en AM');
%Modulación AM-PS
am_ps= s_mod.* cos(2 * pi * Fpor * t + 0);%expresión matemática que
%hace la modulación en AM con portadora suprimida
subplot(2,1,2),plot(t, am_ps);
title('Modulación en Am con Portadora Comprimida');

%Frecuencia
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
 %Modulada AM
[fx, s_f]= fourier(am, Fs); 
grid minor;
ax=gca;
ax.XAxis.Exponent=3; 
subplot(3,1,2),plot(fx, s_f);
title('Modulada AM');
%Modulada AM-PS
[fx_ps, s_fps]= fourier(am_ps, Fs); 
grid minor;
ax=gca;
ax.XAxis.Exponent=3; 
subplot(3,1,3),plot(fx_ps, s_fps);
title('Modulada AM-PS');

function [f,P1,Y,J]=fourier(s, Fs)
L=2^nextpow2(Fs+1);
Y= fft(s);
J=Y/sqrt(L);
P2=abs(Y/L);
P1=P2(1:(length(P2)/2));
P1(2:end-1)=2*P1(2:end-1);
f=Fs*(0:(length(P2)/2)-1)/L;
end



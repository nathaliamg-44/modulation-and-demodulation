clear, clc;

[s, fs]= audioread('record.wav'); % leer señal de audio prueba fs(frecuncia de muestreo m/s) s(muestras de sonido)


Fs = fs;   %Frecuencia de muestreo
Ts = 1/Fs; %Periodo de Muestro 

t_duracion=size(s,1)/Fs; %Tiempo de duracion del audio
t1 = 0:1/Fs:t_duracion;   %Vector de tiempo
t=t1(2:end);

m = 0.5; %Indice de modulación 

%Señal moduladora
    transpuesta=s';
    s_mod=transpuesta(1,:); %canal derecho de la grabacion 
    subplot(2,2,1),plot(t,s_mod),title('Señar moduladora');
%   sound(s_mod, fs)
    Am=max(s_mod);
%Señal Portadora
    Apor=(Am)/m;
    Fpor=Fs/4;
    s_por = Apor * cos (2*pi*Fpor.*t); 
    subplot(2,2,2),plot(t, s_por),title('Señal portadora');
%Modulacion 
    %s_am =Apor*(1+m.*s_mod).*s_por;
    s_am =s_por.*(s_mod+Apor);
    subplot(2,2,[3,4]),plot(t, s_am),title('Señal modulada en amplitud AM');

%Demodulacion 
    



 
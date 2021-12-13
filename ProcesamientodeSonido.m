clc, clear 
[s, fs]= audioread('record.wav');
can= audioread('record.wav');
%audioplayer(s, fs)- escucharlo
%saber el tiempo que dura
timeseg= size(s,1)/fs; % una de la dimensiones de s _ da el total, length(s)/fs
x= 0:1/fs:timeseg;
l=s(:,1);
r=s(:,2); %Canal derecho
t=linspace(0, timeseg, length(r));
s_m=0.5*(s(:,1)+s(:,2)).';
cancionseg= can(fs*0.2:fs*1);
calidad=40;
smala = cancionseg(1:calidad:end);
sound(smala,fs/calidad);

%Frecuencia
data_fft = fftshift(fft(s_m));
fftr=abs(data_fft);
f=linspace(-fs/2, fs/2, length(data_fft));
hplayer = audioplayer(s, fs); 
figure(2)
plot(f, fftr/max(fftr));
grid minor;
ax=gca;
ax.XAxis.Exponent=3; 

new=fftr(1:223470);
xnew = ifft(new,length(can),'symmetric');
h2player = audioplayer(xnew, fs); 
hold on
plot(smala);
% subplot(3,1,3);
% subplot(3,1,1);
figure(3)
plot(x(2:end),s,'m'), xlim([0 timeseg]),ylim([-0.8 0.8])
figure(4)
plot(t,s_m);
% subplot(3,1,2); 
% plot(can, 'c')


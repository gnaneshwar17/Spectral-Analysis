clc;
clear all;
t=0:200; %time 
n=256;
fs=150; %sampling frequency 150Hz 
s1=sin(2*pi*10*t/fs) ; %Input signall of 10Hz
subplot (4, 1, 1);
plot (s1); 
title ('s1-10Hz signal');
s2=sin(2*pi*20*t/fs) ; %Input signal2 of 20H2
subplot (4, 1, 2);
plot (s2);
title ('s2-20Hz signal');
s3=sin (2*pi*50*t/fs) ; %Input signal3 of 50Hz 
subplot (4, 1, 3) ;
plot (s3);
title ('s3-50Hz signal');
xlabel (' Time');
ylabel ('Magnitude');

%Sum of the given input signals
s=s1+s2+s3;
subplot (4,1,4) ;
plot (s); title ('s=s1+s2+s3 (Sum of the signals) ');

%Spectra of the sum of given signals
f=fft(s,n); 
d=abs(f);
figure(2);
h=0:fs/n:fs-(fs/n);
plot(h,d);
xlabel(' Frequency');
ylabel('Magnitude') ;
title('Spectra of the sum of the signals');

%Spectra of Additive White Guassian Noise (AWN) 
sn=awgn(s, 0.6) ; %s-signal; SNR=0.6; Input signal with added AWGN
fn=fft(sn, n) ; 
dn=abs(fn) ;
subplot(2, 1, 1) ;
plot(s,'b'); hold on;
plot (sn, 'r');
title('Input signal (Blue) + Noise signal (Red) ');
subplot (2,1, 2) ;
plot(h,dn);
title('Spectra of the input signal with noise')
close all
clc
%% part 1
load('a.mat' , 'a');
load('b.mat' , 'b');
freqz(b , a, -pi : pi/256:pi)
title('Channel')

%% part 2 
sys1 = tf(b , a);
figure();
zplane(b ,a)
title('Channel Zero Pole location')
%% part 3
f = 44100;
samp = [1, 12.2*f];
[y , Fs]=  audioread('sampleaudio.wav', samp);
figure();
freqz(y)
title('Original Audio')
% sound(y , Fs)
%% part 4
outchannel = filter(b , a , y);
figure();
plot(outchannel);
grid on;
title('Output of Channel');
figure();
freqz(outchannel);
title('Frquency Response of Output of Channel');

%% part 5

[beq , aeq] = MinPhaseInverse(b ,a);

figure();
freqz(beq , aeq , -pi : pi/256 : pi)
title('Minimum Phase Inverse')
figure();
zplane(beq , aeq);
title('Minimum Phase Inverse Zero Pole location')
%% part 6
bt = conv(b , beq);
at = conv(a , aeq);
figure();
freqz(bt , at , -pi : pi/256 : pi)
title('Frequency Responce of Overall system')
%% part 8
figure();
subplot(2,2,1)

zplane(quantize_m(beq,4) , Correct(quantize_m(aeq , 4)));
title('Direct2 : 4 bits')

subplot(2,2,2)
zplane(quantize_m(beq,8) , Correct(quantize_m(aeq , 8)));
title('Direct2 : 8 bits')

subplot(2,2,3)
zplane(quantize_m(beq,16) , Correct(quantize_m(aeq , 16)));
title('Direct2 : 16 bits')

subplot(2,2,4)
zplane(quantize_m(beq,32) , Correct(quantize_m(aeq , 32)));
title('Direct2 : 32 bits')



%% part 9
[scas , g] = tf2sos(beq , aeq);
sizes = size(scas);
ls = sizes(1);
nb = 4;
squan = scas;
for r = 1 :ls
    squan(r , 1:3) = quantize_m(scas(r , 1:3),nb);
    squan(r , 5:6) = quantize_m(scas(r , 5:6),nb);
end
[bc4 ,ac4] = sos2tf(squan , g);

nb = 8;
squan = scas;
for r = 1 :ls
    squan(r , 1:3) = quantize_m(scas(r , 1:3),nb);
    squan(r , 5:6) = quantize_m(scas(r , 5:6),nb);
end
[bc8 , ac8] = sos2tf(squan , g);

nb = 16;
squan = scas;
for r = 1 :ls
    squan(r , 1:3) = quantize_m(scas(r , 1:3),nb);
    squan(r , 5:6) = quantize_m(scas(r , 5:6),nb);
end
[bc16 , ac16] = sos2tf(squan , g);

nb = 32;
squan = scas;
for r = 1 :ls
    squan(r , 1:3) = quantize_m(scas(r , 1:3),nb);
    squan(r , 5:6) = quantize_m(scas(r , 5:6),nb);
end
[bc32 ,ac32] = sos2tf(squan , g);


figure();
subplot(2,2,1)

zplane(bc4 , ac4);
title('CaseCade Form : 4 bits')

subplot(2,2,2)
zplane(bc8 , ac8);
title('CaseCade Form : 8 bits')

subplot(2,2,3)
zplane(bc16 , ac16);
title('CaseCade Form : 16 bits')

subplot(2,2,4)
zplane(bc32 , ac32);
title('CaseCade Form : 32 bits')

figure();
freqz(bc32 , ac32 , -pi : pi/256 : pi);
title('Quantized CaseCade 32 bit')
%% part 10 
outsig = filter(bc32 , ac32 , outchannel);
audiowrite('FinalAudio.wav',outsig , Fs);
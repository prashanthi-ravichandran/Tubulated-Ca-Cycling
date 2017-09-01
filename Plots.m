fileID = fopen('states1.txt','r');
formatSpec = '%s';
C_data  = textscan(fileID,'%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s');
Time    = str2double(C_data{1}(2:100:end));
V       = str2double(C_data{2}(2:100:end));
mNa     = str2double(C_data{3}(2:100:end));
hNa     = str2double(C_data{4}(2:100:end));
jNa     = str2double(C_data{5}(2:100:end));
Nai     = str2double(C_data{6}(2:100:end));
Ki      = str2double(C_data{7}(2:100:end));
Cai     = str2double(C_data{8}(2:100:end));
CaNSR   = str2double(C_data{9}(2:100:end));
xKs     = str2double(C_data{10}(2:100:end));
LTRPNCa = str2double(C_data{11}(2:100:end));
HTRPNCa = str2double(C_data{12}(2:100:end));
C0Kv43	= str2double(C_data{13}(2:100:end));
C1Kv43	= str2double(C_data{14}(2:100:end));
C2Kv43	= str2double(C_data{15}(2:100:end));
C3Kv43	= str2double(C_data{16}(2:100:end));
OKv43	= str2double(C_data{17}(2:100:end));
CI0Kv43	= str2double(C_data{18}(2:100:end));
CI1Kv43	= str2double(C_data{19}(2:100:end));
CI2Kv43	= str2double(C_data{20}(2:100:end));
CI3Kv43	= str2double(C_data{21}(2:100:end));
OIKv43	= str2double(C_data{22}(2:100:end));
C0Kv14	= str2double(C_data{23}(2:100:end));
C1Kv14	= str2double(C_data{24}(2:100:end));
C2Kv14	= str2double(C_data{25}(2:100:end));
C3Kv14	= str2double(C_data{26}(2:100:end));
OKv14	= str2double(C_data{27}(2:100:end));
CI0Kv14	= str2double(C_data{28}(2:100:end));
CI1Kv14	= str2double(C_data{29}(2:100:end));
CI2Kv14	= str2double(C_data{30}(2:100:end));
CI3Kv14 = str2double(C_data{31}(2:100:end));
OIKv14	= str2double(C_data{32}(2:100:end));
CaToT	= str2double(C_data{33}(2:100:end));
C1Herg	= str2double(C_data{34}(2:100:end));
C2Herg	= str2double(C_data{35}(2:100:end));
C3Herg	= str2double(C_data{36}(2:100:end));
OHerg	= str2double(C_data{37}(2:100:end));
IHerg   = str2double(C_data{38}(2:100:end));
fclose(fileID);

fileID = fopen('currents1.txt','r');
formatSpec = '%s';
C_data1  = textscan(fileID,'%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s');
INa       = str2double(C_data1{2}(2:100:end));
IKr     = str2double(C_data1{3}(2:100:end));
IKs     = str2double(C_data1{4}(2:100:end));
Ito1     = str2double(C_data1{5}(2:100:end));
IK1     = str2double(C_data1{6}(2:100:end));
IKp     = str2double(C_data1{7}(2:100:end));
INaCa     = str2double(C_data1{8}(2:100:end));
INaK   = str2double(C_data1{9}(2:100:end));
IpCa     = str2double(C_data1{10}(2:100:end));
ICab = str2double(C_data1{11}(2:100:end));
INab = str2double(C_data1{12}(2:100:end));
ICa	= str2double(C_data1{13}(2:100:end));
JDHPR	= str2double(C_data1{14}(2:100:end));
Jup	= str2double(C_data1{15}(2:100:end));
Jtrpn	= str2double(C_data1{16}(2:100:end));
Jtr	= str2double(C_data1{17}(2:100:end));
Jxfer	= str2double(C_data1{18}(2:100:end));
IKv43	= str2double(C_data1{19}(2:100:end));
IKv14	= str2double(C_data1{20}(2:100:end));
IKv14_K	= str2double(C_data1{21}(2:100:end));
IKv14_Na = str2double(C_data1{22}(2:100:end));
Ito2	= str2double(C_data1{23}(2:100:end));
Istim	= str2double(C_data1{24}(2:100:end));
Itot	= str2double(C_data1{25}(2:100:end));
fclose(fileID);

fileID = fopen('otherstates1.txt');
C_data2 = textscan(fileID,'%s %s %s %s %s %s %s %s %s %s %s %s %s');
CaSSavg = str2double(C_data2{2}(2:100:end));
CaJSRavg = str2double(C_data2{3}(2:100:end));
JRyRtot = str2double(C_data2{4}(2:100:end));
PRyR_open = str2double(C_data2{5}(2:100:end));
PRyR_ready = str2double(C_data2{6}(2:100:end));
PNorm_mode = str2double(C_data2{7}(2:100:end));
PnotVinact = str2double(C_data2{8}(2:100:end));
PLType_open = str2double(C_data2{9}(2:100:end));
CaToT2 = str2double(C_data2{10}(2:100:end));
PIto2_open = str2double(C_data2{11}(2:100:end));
CaJSRtot = str2double(C_data2{12}(2:100:end));
CaSStot = str2double(C_data2{13}(2:100:end));

%% Plots
startPlot = 1;
endPlot  = 5000;

%% Plot membrane voltage
figure
plot(Time(startPlot:endPlot), V(startPlot:endPlot));
%% Plot the myoplasmic calcium and NSR calcium
figure
subplot(4,1,1)
plot(V)
title('Voltage Protocol');
subplot(4,1,2)
plot(Cai);
hold on
title('Myoplasmic calcium');
plot(Cai(1).*ones(1000,1), 'r--');
subplot(4,1,3)
plot(CaNSR);
hold on
plot(CaNSR(1).*ones(1000,1), 'r--');
title('NSR Calcium');
subplot(4,1,4)
plot(Nai);
hold on
plot(Nai(1).*ones(1000,1), 'r--');
title('Nai');

%% Plot currents
figure
subplot(3,4,1)
plot(INa, 'r');
title('Fast Na+  current');
subplot(3,4,2)
plot(IKr, 'r');
title('Rapid potassium rectifier');
subplot(3,4,3)
plot(IKs, 'r');
title('Slow potassium rectifier current');
subplot(3,4,4)
plot(Ito1, 'r');
title('Transient outward K+ current');
subplot(3,4,5)
plot(IK1, 'r');
title('Time independent K');
subplot(3,4,6)
plot(IKp, 'r');
title('Plateau K ');
subplot(3,4,7)
plot(Ito2, 'r');
title('Chlorine current');
subplot(3,4,8)
plot(INaK, 'r');
title('Sodium potassium pump');
subplot(3,4,9)
plot(INaCa, 'r');
title('Sodium calcium exchanger');
subplot(3,4,10)
plot(IpCa, 'r');
xlim([0 5000])
title('Calcium pump');
subplot(3,4,11)
plot(INab, 'r');
xlim([0 5000])
title('Background sodium');
subplot(3,4,12)
plot(ICab, 'r');
title('Background Calcium');

%% Plot fluxes
figure
subplot(3,2,1)
plot(Jup);
title('Serca Pump');
subplot(3,2,2)
plot(Jtr);
title('NSR-JSR');
subplot(3,2,3)
plot(Jxfer);
title('Dyad myo');
subplot(3,2,4)
plot(JRyRtot);
title('RyR flux');
subplot(3,2,5)
plot(Jtrpn);
title('Buffer');
%% Plot concentrations
figure
subplot(4,1,1)
plot(V)
ylim([-110, 20])
xlabel('Time')
ylabel('Membrane voltage (mV)')
subplot(4,1,2)
plot(CaSSavg)
ylabel('Dyadic calcium');
xlabel('Time (ms)');
subplot(4,1,3)
plot(Cai)
ylabel('Myoplasmic calcium');
xlabel('Time (ms)');
subplot(4,1,4)
plot(CaNSR);
hold on
plot(CaJSRavg);
title('NSR and JSR');
xlabel('Time (ms)');

%%
cai = vertcat(cai_10, cai_3);
nsr = vertcat(nsr_10, nsr_3);
nai = vertcat(nai_10, nai_3);
figure
subplot(3,1,1)
plot(cai)
title('Intracellular calcium');
xlabel('Time (ms)')
xlim([0 13000])
subplot(3,1,2)
plot(nsr)
xlabel('Time (ms)')
title('NSR Calcium');
xlim([0 13000])
subplot(3,1,3)
plot(nai)
xlabel('Time (ms)')
title('Intracellular sodium');
xlim([0 13000])

%% Plot frequency relationships
figure
subplot(2,1,1)
title('Myoplasmic Calcium')
plot(Cai2_5Hz);
hold on
plot(Cai2Hz);
plot(Cai1Hz);
%plot(Cai0_5Hz);
%plot(Cai0_25Hz);
legend('2.5 Hz','2 Hz', '1 Hz');
xlim([0 4000])
title('Myoplasmic Calcium')
subplot(2,1,2)
plot(CaNSR2_5Hz);
hold on
plot(CaNSR2Hz);
plot(CaNSR1Hz);
%plot(CaNSR0_5Hz);
%plot(CaNSR0_25Hz);
legend('2.5 Hz','2 Hz', '1 Hz');
xlim([0 4000])
title('NSR Calcium')
% subplot(3,1,3)
% plot(Nai_2_5Hz);
% hold on
% plot(Nai_2Hz);
% plot(Nai_1_3Hz);
% plot(Nai_1Hz);
% plot(Nai_0_5Hz);
% plot(Nai_0_25Hz);
% legend('2.5 Hz','2 Hz', '1.3 Hz', '1 Hz', '0.5 Hz','0.25 Hz');
%%
freq = [1,2,2.5];

%systolic_Ca(1) = max(Cai0_5Hz);
systolic_Ca(1) = max(Cai1Hz);
systolic_Ca(2) = max(Cai2Hz);
systolic_Ca(3) = max(Cai2_5Hz);

%diastolic_Ca(1) = min(Cai0_5Hz);
diastolic_Ca(1) = min(Cai1Hz);
diastolic_Ca(2) = min(Cai2Hz);
diastolic_Ca(3) = min(Cai2_5Hz);
amplitude = systolic_Ca - diastolic_Ca;
figure
plot(freq, systolic_Ca);
hold on
plot(freq,diastolic_Ca);
plot(freq,amplitude);
legend('Systolic Ca','Diastolic Ca','Amplitude');
xlim([0 3])
xlabel('Frequency')
ylabel('Calcium conc mM')

%%
figure
subplot(2,1,1)
plot(CaSSavg(7000:10000))
title('Average Dyadic concentration');
xlim([0 3000])
subplot(2,1,2)
plot(PRyR_open(7000:10000))
hold on
plot(PRyR_ready(7000:10000));
hold on
plot(ones(3001,1) - PRyR_open(7000:10000) - PRyR_ready(7000:10000));
legend('Open','Available','Adapted', 'Location','bestoutside');
xlim([0 3000])
%% 
	k21=250.0;
    k32=9.6;
    k43=0.07/0.06667*13.0;
    k45=0.07;
	k52=0.001235;
    k65=30.0; 
	k12cf=3000.0;
    k23cf=10.0*30000.0;
    k34cf=0.6*3000.0; 
	k54cf=0.6*0.198;
    k25cf=10.0*300.0;
    k56cf=2.0*4.0*3000.0;
    
    k_rate=0.00127215;	 
	
	k_rate2=3.4188;
	threshCa34to7=0.0368369379834969;	 
	
	threshCa56to8=0.00011447933531005 ;

	threshMAX=2.0;	
	threshMAXCa = 0.0504410547074504; 
    Sat_term  = min(threshMAX,(CaSSavg.^2)/k_rate);
	Sat_term2 =	min(threshMAX,(CaSSavg.^2)/k_rate2);
	k12	= k12cf	* Sat_term2;
	k23	= k23cf	* Sat_term;
	k34	= k34cf	* Sat_term;
	k54	= k54cf	* Sat_term;
	k25	= k25cf	* Sat_term;
	k56	= k56cf	* Sat_term;
    %%
    in1  = k21;
    out1 = k12;
    in2  = k12 + k32 + k52;
    out2 = k21 + k23 + k25;
    in3 = k43 + k23;
    out3 =  k32 + k34;
    in4 = k34 + k54;
    out4 = k43 + k45;
    in5 = k45 + k52 + k65;
    out5 = k52 + k54 + k56;
    in6 = k56;
    out6 = k65;
    
    figure
    subplot(2,3,1)
    plot(in1./(in1 + out1));
    title('State 1')
    subplot(2,3,2)
    plot(in2./(in2 + out2));
    title('State 2')
    subplot(2,3,3)
    plot(in3./(in3 + out3));
    title('State 3')
    subplot(2,3,4)
    plot(in4./(in4 + out4));
    title('State 4')
    subplot(2,3,5)
    plot(in5./(in5 + out5));
    title('State 5')
    subplot(2,3,6)
    plot(in6./(in6 + out6));
    title('State 6')
%%
figure
subplot(2,1,1)
plot(Cai1Hz);
hold all
%plot(Cai_1Hz, '--');
plot(Cai2Hz);
%plot(Cai_2Hz, '--');
legend('1Hz', '2Hz');
subplot(2,1,2)
plot(CaNSR1Hz);
hold all
%plot(CaNSR_1Hz, '--');
plot(CaNSR2Hz);
%plot(CaNSR_2Hz, '--');
legend('1Hz', '2Hz');
clc

%%
freq = [1,2];
sys = [max(Cai1Hz), max(Cai2Hz)];
sys_old = [max(Cai_1Hz), max(Cai_2Hz)];
dia = [min(Cai1Hz), min(Cai2Hz)];
dia_old = [min(Cai_1Hz), min(Cai_2Hz)];
amp = sys - dia;
amp_old = sys_old - dia_old;
figure
plot(freq, sys, 'b-o','MarkerFaceColor','b');
hold all
plot(freq, sys_old, 'b--o');
plot(freq, dia, 'm-^','MarkerFaceColor','m');
plot(freq, dia_old, 'm--^');
plot(freq, amp, 'g-s','MarkerFaceColor','g');
plot(freq,amp_old,'g--s');
xlim([0 3])
ylim([0 1e-3])
legend('systole','systole old','diastole','diastole old','amplitude','amplitude old');
%%
fileID = fopen('conc.txt','r');
C_data  = textscan(fileID,'%s');
cai_matlab = str2double(C_data{1}(1:300000));
nsr_matlab = str2double(C_data{1}(300001:600000));

%% 
figure
subplot(2,1,1)
plot(Jup(7000:10000));
title('SERCA Pump');
xlim([0 3000])
subplot(2,1,2)
plot(INaCa(7000:10000));
hold on
plot(zeros(3000,1), 'r--');

title('Sodium calcium exchanger');
xlim([0 3000])

%%

    kNaCa=0.9*0.30; 

	KmNa=87.5;% Na+  half sat. constant for Na+/Ca++ exch. (mM)
	KmCa=1.38;% Ca++ half sat. constant for Na+/Ca++ exch. (mM)
	KmK1=13.0;% Ca++ half sat. constant for IK1 (mM)
	ksat=0.2;% Na+/Ca++ exch. sat. factor at negative potentials 
	eta=0.35;% controls voltage dependence of Na+/Ca++ exch.
	INaKmax=1.3*0.693; % maximum Na+/K+ pump current (uA/uF)
	%  INaKmax=1.0*0.693; % in Canine C++
	KmNai=10.0; % Na+  half sat. constant for Na+/K+ pump (mM)
	KmKo=1.5; % K+   half sat. constant for Na+/K+ pump (mM)
	IpCamax=0.6*0.05; % maximum sarcolemmal Ca++ pump current (uA/uF)
	KmpCa=0.0005; % half sat. constant for sarcolemmal Ca++ pump (mM)
	
    VF_over_RT=V/RT_over_F;
    exp_etaVFRT=exp(eta*VF_over_RT);
    a1 = exp_etaVFRT*(Nai*Nai*Nai)*Cao;
	a2 = exp_etaVFRT/exp_VFRT*(Nao*Nao*Nao)*Cai;
	a3 = 1.0+ksat*exp_etaVFRT/exp_VFRT;
	a4 = KmCa+Cao;
	a5 = 5000.0/(KmNa*KmNa*KmNa+Nao*Nao*Nao);
	INaCa = kNaCa*a5*(a1-a2)/(a4*a3);
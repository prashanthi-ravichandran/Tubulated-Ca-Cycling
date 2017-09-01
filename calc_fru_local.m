function [dFRU_state, Jxfer, Jtr, ICa, Ito2] = calc_fru_local( FRUdep_states, FRU_state, Ltype_state,RyR_state,Ito2_state)

global Nclefts_FRU NFRU_sim NRyRs_per_cleft NFRU_scale
% Define the flux rates

Cao=   2.0;   % extracellular Ca++ concentration (mM)
Clo= 150.0;   % extracellular Cl-  concentration (mM)
Cli=  20.0;   % intracellular Cl-  concentration (mM)

Faraday=  96.5;     % Faraday's constant (C/mmol)
Temp=    310.0;     % absolute temperature (K)
Rgas=      8.314;   % ideal gas constant (J/[mol*K])
RT_over_F= 8.314*310.0/96.5; % (Rgas*Temp/Faraday); %  Rgas*Temp/Faraday (mV)


Acap= 1.534e-4; % capacitive membrane area (cm^2)
VJSR= ((double(Nclefts_FRU))*0.53*0.5*0.2*1.05e-10); % network SR volume (uL)
VSS= (0.5*0.2*2.03e-12); % subspace volume (uL)

PCa= (1.5/2.8*0.2*0.9*0.9468e-11); %(cm/s) *uF  

PCl= 2.65e-15; %(cm/s) *uF 
	 
BSLtot=   1.124;  % (mM)
KBSL=     0.0087; 
CSQNtot= 13.5; 
KmCSQN=   0.63; 
BSRtot=   0.047; 
KBSR=     0.00087; 

% JSR to subspace through a single RyR (1/ms)
JRyRmax= (0.6*1.5*1.1*3.96);
% NSR to JSR (1/ms)
tautr= 3.0;
% subspace to cytosol (1/ms)
tauxfer= 0.005;
% intersubspace transfer rate (1/ms)
tauss2ss= (10.0*0.005);

% Read in the state variables

V     = FRUdep_states(1);
Cai   = FRUdep_states(2);
CaNSR = FRUdep_states(3);

CaJSR  = FRU_state(:,1);
CaSS_1 = FRU_state(:,2);
CaSS_2 = FRU_state(:,3);
CaSS_3 = FRU_state(:,4);
CaSS_4 = FRU_state(:,5);

% Calculate the open fraction of the LCC, RyR and ClCh gates
 O1_LType = 6;
 O2_LType = 12;
 Oy_LType = 2;
 O1_RyR   = 3;
 O2_RyR   = 4;
 O3_RyR   = 7;
 O_Ito2   = 2;
 
 LType_open = zeros(NFRU_sim, Nclefts_FRU);
 for i = 1:NFRU_sim
     for j = 1:Nclefts_FRU
         if((Ltype_state(i,j,1) == O1_LType || Ltype_state(i,j,1) == O2_LType) && (Ltype_state(i,j,2) == Oy_LType))
             LType_open(i,j) = 1;
         end
     end
 end
 
 NRyR_open = zeros(NFRU_sim, Nclefts_FRU);
 for i = 1:NFRU_sim
     for j = 1:Nclefts_FRU
         for k = 1:NRyRs_per_cleft
             if(RyR_state(i,j,k) == O1_RyR || RyR_state(i,j,k) == O2_RyR || RyR_state(i,j,k) == O3_RyR)
                 NRyR_open(i,j) = NRyR_open(i,j) + 1;
             end
         end
     end
 end
 
 NIto2_Open = 0;
  for i = 1:NFRU_sim
     for j = 1:Nclefts_FRU
         if(Ito2_state(i,j) == O_Ito2)
             NIto2_Open = NIto2_Open  + 1;
         end
     end
 end
% Calculate the fluxes and the currents
JDHconstant=1.0/(2.0*VSS*Faraday*1000.0);

Jtr = (CaNSR.*ones(NFRU_sim,1) - CaJSR)./tautr;

JRyR_1 = JRyRmax*NRyR_open(:,1).*(CaJSR-CaSS_1);
JRyR_2 = JRyRmax*NRyR_open(:,2).*(CaJSR-CaSS_2);
JRyR_3 = JRyRmax*NRyR_open(:,3).*(CaJSR-CaSS_3);
JRyR_4 = JRyRmax*NRyR_open(:,4).*(CaJSR-CaSS_4);
JRyRtot = JRyR_1+JRyR_2+JRyR_3+JRyR_4;

Jxfer_1 = (CaSS_1-Cai.*ones(NFRU_sim,1))/tauxfer;
Jxfer_2 = (CaSS_2-Cai.*ones(NFRU_sim,1))/tauxfer;
Jxfer_3 = (CaSS_3-Cai.*ones(NFRU_sim,1))/tauxfer;
Jxfer_4 = (CaSS_4-Cai.*ones(NFRU_sim,1))/tauxfer;

Jss1ss_2 = (CaSS_1 - CaSS_2)/tauss2ss;
Jss2ss_3 = (CaSS_2 - CaSS_3)/tauss2ss;
Jss3ss_4 = (CaSS_3 - CaSS_4)/tauss2ss;
Jss4ss_1 = (CaSS_4 - CaSS_1)/tauss2ss;

VF_over_RT=V/RT_over_F;
VFsq_over_RT=(1000.0*Faraday)*VF_over_RT;
exp_VFRT = exp(2.0*VF_over_RT);

if(abs(V) < 1e-6)
     JDHPR_1 = -PCa*2.0*1000.0*Faraday*(CaSS_1-Cao*0.341.*ones(NFRU_sim,1)).*LType_open(:,1)*JDHconstant;
	 JDHPR_2 = -PCa*2.0*1000.0*Faraday*(CaSS_2-Cao*0.341.*ones(NFRU_sim,1)).*LType_open(:,2)*JDHconstant;
	 JDHPR_3 = -PCa*2.0*1000.0*Faraday*(CaSS_3-Cao*0.341.*ones(NFRU_sim,1)).*LType_open(:,3)*JDHconstant;
	 JDHPR_4 = -PCa*2.0*1000.0*Faraday*(CaSS_4-Cao*0.341.*ones(NFRU_sim,1)).*LType_open(:,4)*JDHconstant;
else
      a2     = PCa*4.0*VFsq_over_RT/(exp_VFRT-1.0)*JDHconstant;
	  JDHPR_1 = -(CaSS_1.*exp_VFRT-Cao*0.341.*ones(NFRU_sim,1)).*a2.*LType_open(:,1);
	  JDHPR_2 = -(CaSS_2.*exp_VFRT-Cao*0.341.*ones(NFRU_sim,1)).*a2.*LType_open(:,2);
	  JDHPR_3 = -(CaSS_3.*exp_VFRT-Cao*0.341.*ones(NFRU_sim,1)).*a2.*LType_open(:,3);
	  JDHPR_4 = -(CaSS_4.*exp_VFRT-Cao*0.341.*ones(NFRU_sim,1)).*a2.*LType_open(:,4);
end
    
      beta_JSR  = 1./( 1 + (CSQNtot*KmCSQN)./(KmCSQN + CaJSR).^2);

      beta_SS_1 = 1./(1 + (BSRtot*KBSR)./(KBSR + CaSS_1).^2 + (BSLtot*KBSL)./(KBSL + CaSS_1).^2 );
      beta_SS_2 = 1./(1 + (BSRtot*KBSR)./(KBSR + CaSS_2).^2 + (BSLtot*KBSL)./(KBSL + CaSS_2).^2 );
      beta_SS_3 = 1./(1 + (BSRtot*KBSR)./(KBSR + CaSS_3).^2 + (BSLtot*KBSL)./(KBSL + CaSS_3).^2 );
      beta_SS_4 = 1./(1 + (BSRtot*KBSR)./(KBSR + CaSS_4).^2 + (BSLtot*KBSL)./(KBSL + CaSS_4).^2 );
    
      ICa_numerator = 0.0;
      OCa_numerator = 0;
  
      for iFRU = 1:NFRU_sim
        for icleft = 1:Nclefts_FRU
            if ((Ltype_state(iFRU,icleft,1)==O1_LType)||(Ltype_state(iFRU,icleft,1)==O2_LType) && Ltype_state(iFRU,icleft,1)==Oy_LType )
            	  ICa_numerator = ICa_numerator + FRU_state(iFRU, icleft+1);
                  OCa_numerator = OCa_numerator + 1;
            end
        end
      end
     exp_2VFRT = exp_VFRT*exp_VFRT;
     if (abs(V)<1.e-6) 
        ICa_fac = ICa_numerator - OCa_numerator*Cao*0.341; 
        ICa_local = PCa*2.0*1000.0*Faraday*ICa_fac;
        ICa_local = ICa_local/Acap;		% divide by uF(Acap) to get current normalized to surface area
        Ito2_local = NIto2_Open*PCl*1000.0*Faraday*(Clo-Cli);
        Ito2_local = Ito2_local/Acap;	% divide by uF(Acap) to get current normalized to surface area
    else 
        ICa_fac = ICa_numerator*exp_2VFRT- ICa_numerator*Cao*0.341; 
        ICa_local =  PCa*4.0*VFsq_over_RT*ICa_fac/(exp_2VFRT-1.0); 
        ICa_local =  ICa_local/Acap;		% divide by uF(Acap) to get current normalized to surface area
        Ito2_local = NIto2_Open*PCl*VFsq_over_RT*(Cli-Clo*exp_VFRT)/(1.0 - exp_VFRT);
        Ito2_local = Ito2_local/Acap;	% divide by uF(Acap) to get current normalized to surface area
    end

    
    dFRU_state = zeros(NFRU_sim,1);
	dFRU_state(:,1) = beta_JSR.*(Jtr - VSS/VJSR*JRyRtot); % dCaJSR

	dFRU_state(:,2) = beta_SS_1.*(JDHPR_1 + JRyR_1 - Jxfer_1 - Jss1ss_2 + Jss4ss_1); % dCaSS1
	dFRU_state(:,3) = beta_SS_2.*(JDHPR_2 + JRyR_2 - Jxfer_2 - Jss2ss_3 + Jss1ss_2); % dCaSS2
	dFRU_state(:,4) = beta_SS_3.*(JDHPR_3 + JRyR_3 - Jxfer_3 - Jss3ss_4 + Jss2ss_3); % dCaSS3
	dFRU_state(:,5) = beta_SS_4.*(JDHPR_4 + JRyR_4 - Jxfer_4 - Jss4ss_1 + Jss3ss_4); % dCaSS4
    
    sum_CaSS_local = 0.0;
    sum_CaJSR_local = 0.0;
  
   for iFRU = 1:NFRU_sim 
    sum_CaJSR_local = sum_CaJSR_local + FRU_state(iFRU,1);
    for icleft = 1: Nclefts_FRU
      sum_CaSS_local = sum_CaSS_local + FRU_state(iFRU,icleft+1);
    end
   end
    Jtr_local =    (NFRU_sim*CaNSR - sum_CaJSR_local)/tautr;
    Jxfer_local = (sum_CaSS_local - (NFRU_sim*Nclefts_FRU)*Cai)/tauxfer;
    
    
    Jtr   = NFRU_scale*Jtr_local;
    ICa   = NFRU_scale*ICa_local;
    Ito2  = NFRU_scale*Ito2_local;
    Jxfer = NFRU_scale*Jxfer_local;
end


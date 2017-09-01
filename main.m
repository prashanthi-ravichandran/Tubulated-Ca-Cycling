% Model definitions

 global Nclefts_FRU Nstates_FRU Nstates_FRUdep Nstates_LType Nstates_RyR NRyRs_per_cleft Nindepstates_LType 
 global NFRU_sim NFRU_scale
 Nclefts_FRU = 4;
 Nstates_FRU = (1+Nclefts_FRU);
 Nstates_FRUdep = 3;

 Nstates_LType = 12;
 Nstates_RyR  = 6;
 NRyRs_per_cleft  = 5;
 Nindepstates_LType = 2;
 NFRU_sim_low  = 250;
 NFRU_scale_low = 50.0; % ratio of 12500/NFRU_sim_low
 NFRU_sim_high = 250;
 NFRU_scale_high = 50.0; % ratio of 12500/NFRU_sim_high
 
 NFRU_sim_max = 250;
 
 NFRU_sim=NFRU_sim_high;
 NFRU_scale = NFRU_scale_high;
% Specify simulation parameters
num_beats  = 3;
freq       = 1;
ISI        = 1000/freq; %ms
time_start = 0.0;
time_end = num_beats*ISI;
tstep    = 0.01;

% AP Clamp
global pulse_duration pulse_amplitude  period shift
pulse_duration = 0.5;
pulse_amplitude = -100.0;
period = 1000.0;
shift = 5.0;

% Define parameters for voltage clamp.
 global vclamp_flag vclamp_duration vclamp_set vclamp_shift vclamp_hold vclamp_period
 vclamp_flag = 1;
 vclamp_duration = 200.0;
 vclamp_set  =   0.0;
 vclamp_shift =  10.0;
 vclamp_hold  =  -100.0;
 vclamp_period = 1000.0;
 
% Specify input and output files
% Define input files
 ic_clamp = 1;
 input_dir = 'ic/vclamp';
 ic_states_file = strcat(input_dir,'/','ic_states_NVC.txt');
 ic_FRU_file = strcat(input_dir, '/','ic_FRU_NVC.txt');
 ic_LCh_file = strcat(input_dir,'/','ic_LCh_NVC.txt');
 ic_RyR_file = strcat(input_dir,'/','ic_RyR_NVC.txt');
 ic_Ito2_file = strcat(input_dir,'/','ic_Ito2_NVC.txt');
 
 % Define output files
 output_dir           = 'Ramp';
 mkdir(output_dir);
 filenumber           = 1;
 output_states_file   = strcat(output_dir,'/','states', num2str(filenumber),'.txt');
 output_currents_file = strcat(output_dir,'/','currents', num2str(filenumber),'.txt');
 output_otherstates_file = strcat(output_dir,'/','otherstates', num2str(filenumber),'.txt');
 fileID = fopen(output_states_file, 'w');
 fprintf(fileID, '%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s \n', ...
		'Time','V','mNa','hNa','jNa','Nai','Ki','Cai','CaNSR','xKs', ...
		'LTRPNCa','HTRPNCa','C0Kv43','C1Kv43','C2Kv43','C3Kv43','OKv43','CI0Kv43','CI1Kv43','CI2Kv43', ...
		'CI3Kv43','OIKv43','C0Kv14','C1Kv14','C2Kv14','C3Kv14','OKv14','CI0Kv14','CI1Kv14','CI2Kv14', ...
		'CI3Kv14','OIKv14','CaToT','C1Herg','C2Herg','C3Herg','OHerg','IHerg');
 fclose(fileID);  
 fileID = fopen(output_currents_file, 'w');
 fprintf(fileID, '%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s \n', ...
		'Time','INa','IKr','IKs','Ito1','IK1','IKp','INaCa','INaK','IpCa', ...
		'ICab','INab','ICa','JDHPR','Jup','Jtrpn','Jtr','Jxfer','IKv43','IKv14', ...
		'IKv14_K','IKv14_Na','Ito2','Istim','Itot');
 fclose(fileID);
 
 fileID = fopen(output_otherstates_file, 'w');
 
 fprintf(fileID, '%s %s %s %s %s %s %s %s %s %s %s %s %s \n', ...
			'Time','CaSSavg','CaJSRavg','JRyRtot','PRyR_open','PRyR_ready','PNorm_mode','PnotVinact','PLType_open','CaToT2', ...
		    'PIto2_open','CaJSRtot','CaSStot');
 fclose
%Initialize state variables and gates
if(ic_clamp)
    [state, FRU_state, Ltype_state, RyR_state, Ito2_state] = initialize(ic_states_file, ic_FRU_file, ic_LCh_file,ic_RyR_file,ic_Ito2_file);
else
    state = [ -100.0100   1.21087e-4    0.999484    0.999480      10.0000     133.24    1.11074e-4   0.72873    0.104829e-3    0.1003...
                 0.9780      0.968277     0.0133601   0.691875e-4   0.159092e-6 0.0       0.0153235    0.00271424   0.243515e-3 ...
                 0.115007e-4    0.163239e-6 0.824239    0.0522865   0.00124396  0.131359e-4 0.522383e-7 0.118010    0.003334011 0.684631e-3...
                 0.136717e-3 0.451249e-4 0.6810488214E+01   0.990   0.008   0.002   0.0     0.0];
    Ltype_state = zeros(NFRU_sim, Nclefts_FRU,Nindepstates_LType);
    FRU_state = horzcat( 0.728921.*ones(NFRU_sim,1), 0.111074e-3.*ones(NFRU_sim, Nclefts_FRU));
    RyR_state = ones(NFRU_sim, Nclefts_FRU, NRyRs_per_cleft);
    Ito2_state = ones(NFRU_sim, Nclefts_FRU);
    Ltype_state(:,:,1) = ones(NFRU_sim, Nclefts_FRU);
    Ltype_state(:,:,2) = 2.*ones(NFRU_sim, Nclefts_FRU);  
end
% Set up arrays to store simulation data
global N Ncur Nother
N = 37;
Ncur = 24;
Nother = 12;
current     = zeros(Ncur,1);
otherstates = zeros(Nother,1);
Fstate = zeros(N,1);
ii = 1;
saveinterval = 1;
%% Main loop
for time = time_start:tstep:time_end
    index_V = 1;
     if(vclamp_flag == 1)
      time_vclamp_on = floor((time-vclamp_shift)/vclamp_period)*vclamp_period;
	  time_vclamp_off = time_vclamp_on + vclamp_duration;
          if (((time-vclamp_shift) >= time_vclamp_on)  && (time_vclamp_on>=0.0) && ((time-vclamp_shift) < time_vclamp_off)) 
             ramp = (((time-vclamp_shift)-time_vclamp_on)/2.0)*(vclamp_set-vclamp_hold) + vclamp_hold;
                  if (vclamp_hold<=vclamp_set) 
                    state(index_V) = min(vclamp_set,ramp); % depol.  steps
                  else 
                    state(index_V) = max(vclamp_set,ramp); % hyperpol. steps
                  end
               %state(index_V) = vclamp_set;
          else 
              if (((time-vclamp_shift)<time_vclamp_on)||(time_vclamp_on<0.0)) 
                  state(index_V) = vclamp_hold;
              else 
                   ramp = vclamp_set +((time_vclamp_on + vclamp_duration-(time-vclamp_shift))/2.0)*(vclamp_set-vclamp_hold);
                   if (vclamp_hold<=vclamp_set) 
                      state(index_V) = max(vclamp_hold,ramp); % depol. step
                   else 
                      state(index_V) = min(vclamp_hold,ramp); % hyper. step
                   end
              end
                %state(index_V) = vclamp_hold;
          end
     end
     
     % Calculate the derivatives
     FRUdep_states(1) = state(1);
     FRUdep_states(2) = state(7); 
     FRUdep_states(3) = state(8);
   
     [dFRU_state, Jxfer, Jtr, ICa, Ito2]  = calc_fru_local(FRUdep_states,FRU_state, Ltype_state, RyR_state,Ito2_state);
     [state, Fstate, current]             = calc_derivative(time, state, current, Jxfer, Jtr, ICa, Ito2);
    

     % Write current states into file
     fileID = fopen(output_states_file, 'a');
     fprintf(fileID, '%d %s', time,' ');
     dlmwrite(output_states_file, state,'-append','delimiter',' ')
     fclose(fileID);

    % Populate currents file and otherstates file
    [otherstates] = simulation_data( FRU_state, state, Ltype_state, RyR_state, Ito2_state);

    fileID = fopen(output_currents_file, 'a');
    fprintf(fileID,'%d %s',time,' ');
    dlmwrite(output_currents_file, current','-append','delimiter',' ')
    fclose(fileID);
    
    fileID = fopen(output_otherstates_file,'a');
    fprintf(fileID, '%d %s', time,' ');
    dlmwrite(output_otherstates_file,otherstates ,'-append','delimiter',' ')
    fclose(fileID);

    % Determine stochastic switching of the gates
    
      [Ltype_state, RyR_state, Ito2_state] = new_gate(tstep,FRUdep_states, FRU_state, Ltype_state,RyR_state,Ito2_state);
    
    % Euler integration
   
    state = state + (tstep.*Fstate);
    FRU_state = FRU_state + (tstep.*dFRU_state);
end
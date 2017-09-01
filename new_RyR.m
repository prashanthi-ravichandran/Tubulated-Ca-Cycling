function [ RyR ] = new_RyR(dt,CaSS, RyR, rand1, rand2)

k21=250.0;
k32=9.6;
k43=13.6493;
k45=0.07;
k52=0.001235;
k65=30.0; %	at 10 CaNSR	rises
k12cf=3000.0;
k23cf=10.0*30000.0;
k34cf=0.6*3000.0; %	(ms-1 mM-2)
k54cf=0.6*0.198;
k25cf=10.0*300.0;
k56cf=2.0*4.0*3000.0;
% parameters below	determine threshold	Ca levels for switching	between	different
% RyR models based	on rapid equilibrium approximations
k_rate=  0.00127215;	 
k_rate2= 3.4188;
threshCa34to7= 0.0368369379834969;	 %	Factor of 200 (0.005) difference in	rates 
threshCa56to8= 0.00011447933531005 ;

threshMAX=2.0;	
threshMAXCa = 0.0504410547074504; 
Sat_term = min(threshMAX,(CaSS*CaSS)/k_rate);
Sat_term2 =	min(threshMAX,(CaSS*CaSS)/k_rate2);

k12	= k12cf	* Sat_term2;
k23	= k23cf	* Sat_term;
k34	= k34cf	* Sat_term;
k54	= k54cf	* Sat_term;
k25	= k25cf	* Sat_term;
k56	= k56cf	* Sat_term;

if(min(CaSS, threshMAXCa)<threshCa56to8)
    if(RyR == 1)
        Accum_Prob = 1.0 - dt*k12;
        if (rand2>Accum_Prob) 
            RyR = 2;
        end
    else
         if(RyR == 2)
             Accum_Prob = 1.0 - dt*(k21+k23+k25);
				if (rand2>Accum_Prob) 
					RyR = 1;
                    Accum_Prob = Accum_Prob + dt*k21;
                    if(rand2 > Accum_Prob)
                        RyR = 3;
                        Accum_Prob = Accum_Prob + dt*k23;
                        if(rand2> Accum_Prob)
                            RyR = 5;
                        end
                    end
                end
        else
            if(RyR == 3)
                Accum_Prob = 1.0 - dt*(k32+k34);
				if (rand2>Accum_Prob) 
					RyR = 2;
                    Accum_Prob = Accum_Prob + dt*k32;
                    if(rand2 > Accum_Prob)
                        RyR = 4;
                    end
                end                
            else
                if(RyR == 4)
                    Accum_Prob = 1.0 - dt*(k43+k45);
                    if (rand2>Accum_Prob)
                        RyR = 3;
                        Accum_Prob = Accum_Prob + dt*k43;
                        if(rand2 > Accum_Prob)
                            RyR = 5;
                        end
                    end                  
                else
                    if(RyR == 5)
                        Accum_Prob = 1.0 - dt*(k52+k54+k56);
                        if (rand2>Accum_Prob) 
                            RyR = 2;
                            Accum_Prob = Accum_Prob + dt*k52;
                            if(rand2 > Accum_Prob)
                                RyR = 4;
                                Accum_Prob = Accum_Prob + dt*k54;
                                if(rand2 > Accum_Prob)
                                    RyR = 6;
                                end
                            end
                        end
                    else
                        if(RyR == 6)
                            Accum_Prob = 1.0 - dt*k65;
                            if (rand2>Accum_Prob) 
                                RyR = 5;
                            end
                        else
                            if(RyR == 7)
                              if (rand1<(k34/(k34+k43)))           
                                RyR = 4;           
                                Accum_Prob = 1.0 - dt*(k43+k45);
                                    if (rand2>Accum_Prob) 
                                        RyR = 3;
                                        Accum_Prob = Accum_Prob + dt*k43;
                                        if(rand2>Accum_Prob)
                                            RyR = 5;
                                        end
                                    end
                              else 
                                  RyR = 3;
                                  Accum_Prob = 1.0 - dt*(k32+k34);
                                  if (rand2>Accum_Prob) 
                                        RyR = 2;
                                        Accum_Prob = Accum_Prob + dt*k32;
                                        if(rand2 > Accum_Prob)
                                            RyR = 4;
                                        end
                                  end  
                              end
                            else
                                if(RyR == 8)
                                  if (rand1< k56/(k56+k65)) 
                                        RyR = 6;
                                        Accum_Prob = 1.0 - dt*k65;
                                        if (rand2>Accum_Prob) 
                                            RyR = 5;
                                        end
                                  else
                                      RyR = 5;
                                      Accum_Prob = 1.0 - dt*(k52+k54+k56);
                                      if (rand2>Accum_Prob) 
                                        RyR = 2;
                                        Accum_Prob = Accum_Prob + dt*k52;
                                        if(rand2 > Accum_Prob)
                                            RyR = 4;
                                            Accum_Prob = Accum_Prob + dt*k54;
                                            if(rand2 > Accum_Prob)
                                                RyR = 6;
                                            end
                                        end
                                      end
                                  end                                  
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
else
    if(min(CaSS,threshMAXCa)<threshCa34to7)
    if(RyR == 1)
        Accum_Prob = 1.0 - dt*k12;
        if (rand2>Accum_Prob) 
            RyR = 2;
        end
    else
        if(RyR == 2)
            Accum_Prob = 1.0 - dt*(k21+k23+k25);
                if(rand2 > Accum_Prob)
                    RyR = 1;
                    Accum_Prob = Accum_Prob + dt*k21;
                    if(rand2 > Accum_Prob)
                        RyR = 3;
                        Accum_Prob = Accum_Prob + dt*k23;
                        if(rand2 > Accum_Prob)
                            RyR = 8;
                        end
                    end
                end
        else
            if(RyR == 3)
                Accum_Prob = 1.0 - dt*(k32 + k34);
				if (rand2>Accum_Prob) 
                    RyR = 2;
                    Accum_Prob = Accum_Prob + dt*k32;
                    if(rand2 > Accum_Prob)
                        RyR = 4;
                    end
                end
            else
                if(RyR == 4)
                    Accum_Prob = 1 - dt*(k43+k45);
                    if (rand2>Accum_Prob) 
                        RyR = 3;
                        Accum_Prob = Accum_Prob + dt*k43;
                        if(rand2 > Accum_Prob)
                            RyR = 8;
                        end
                    end
                else
                    if(RyR == 5)
                          RyR = 8;
                          a1 = k65/(k56+k65);
                          a2 = a1*k52;
                          a3 = a1*k54;                          
                          Accum_Prob = 1.0 - dt*(a2+a3);
                          if (rand2>Accum_Prob)
                            RyR = 2;
                            Accum_Prob = Accum_Prob + dt*a2;
                            if(rand2 > Accum_Prob)
                                RyR = 4;
                            end
                          end
                    else
                        if(RyR == 6)
                            RyR = 8;
                            a1 = k65/(k56+k65);
                            a2 = a1*k52;
                            a3 = a1*k54;
                            Accum_Prob = 1.0 - dt*(a2+a3);
                              if (rand2>Accum_Prob)
                                RyR = 2;
                                Accum_Prob = Accum_Prob + dt*a2;
                                if(rand2 > Accum_Prob)
                                    RyR = 4;
                                end
                              end
                        else
                            if(RyR == 7)
                                	if (rand1< k34/(k34+k43)) 
                                      RyR = 4;
                                      Accum_Prob = 1 - dt*(k43+k45);
                                        if (rand2>Accum_Prob) 
                                            RyR = 3;
                                            Accum_Prob = Accum_Prob + dt*k43;
                                            if(rand2 > Accum_Prob)
                                                RyR = 8;
                                            end
                                        end
                                    else
                                        RyR = 3;
                                        Accum_Prob = 1.0 - dt*(k32 + k34);
                                        if (rand2>Accum_Prob) 
                                            RyR = 2;
                                            Accum_Prob = Accum_Prob + dt*k32;
                                            if(rand2 > Accum_Prob)
                                                RyR = 4;
                                            end
                                        end
                                    end
                            else
                                if(RyR == 8)
                                    a1 = k65/(k56+k65);
                                    a2 = a1*k52;
                                    a3 = a1*k54;
                                    Accum_Prob = 1.0 - dt*(a2+a3);
                                    if(rand2 > Accum_Prob)
                                        RyR = 2;
                                        Accum_Prob = Accum_Prob + dt*a2;
                                        if(rand2 > Accum_Prob)
                                            RyR = 4;
                                        end
                                    end                                 
                                end
                            end
                        end
                    end
                end
            end
        end
    end
        
    else
        
    if(RyR == 1)
        Accum_Prob = 1.0 - dt*k12;
        if (rand2>Accum_Prob) 
            RyR = 2;			
        end
    else
        if(RyR == 2)
            Accum_Prob = 1.0 - dt*(k21+k23+k25);
            if (rand2>Accum_Prob) 
                RyR = 1;
                Accum_Prob= Accum_Prob + dt*k21;
                if(rand2 > Accum_Prob)
                    RyR = 7;
                    Accum_Prob = Accum_Prob + dt*k23;
                    if(rand2 > Accum_Prob)
                        RyR = 8;
                    end
                end
            end
        else
            if(RyR == 3)
            RyR = 7;
			a1 = k34/(k43+k34);
			a2 = (1.0-a1)*k32;
			a3 = a1*k45;               
            Accum_Prob = 1.0 - dt*(a2+a3);
				if (rand2>Accum_Prob) 
                    RyR = 2;
                    Accum_Prob = Accum_Prob + dt*a2;
                    if(rand2> Accum_Prob)
                        RyR = 8;
                    end
                end
            else
                if(RyR == 4)
                    RyR = 7;         
                    a1 = k34/(k43+k34);
                    a2 = (1.0-a1)*k32;
                    a3 = a1*k45;               
                    Accum_Prob = 1.0 - dt*(a2+a3);
                        if (rand2>Accum_Prob) 
                            RyR = 2;
                            Accum_Prob = Accum_Prob + dt*a2;
                            if(rand2> Accum_Prob)
                                RyR = 8;
                            end
                        end
                 else
                    if(RyR == 5)
                        RyR = 8;		
                        a1 = k65/(k56+k65);
                        a2 = a1*k52;
                        a3 = a1*k54;         
                        Accum_Prob = 1.0 - dt*(a2 +a3);
                            if (rand2>Accum_Prob) 
                                RyR = 2;
                                Accum_Prob = Accum_Prob + dt*a2;
                                if(rand2 > Accum_Prob)
                                    RyR = 7;
                                end
                            end
                    else
                        if(RyR == 6)
                            RyR = 8;		
                            a1 = k65/(k56+k65);
                            a2 = a1*k52;
                            a3 = a1*k54;         
                            Accum_Prob = 1.0 - dt*(a2 +a3);
                                if (rand2>Accum_Prob) 
                                    RyR = 2;
                                    Accum_Prob = Accum_Prob + dt*a2;
                                    if(rand2 > Accum_Prob)
                                        RyR = 7;
                                    end
                                end
                        else
                            if(RyR == 7)
                                
                                a1 = k34/(k43+k34);
                                a2 = (1.0-a1)*k32;
                                a3 = a1*k45;               
                                Accum_Prob = 1.0 - dt*(a2+a3);
                                    if (rand2>Accum_Prob) 
                                        RyR = 2;
                                        Accum_Prob = Accum_Prob + dt*a2;
                                        if(rand2> Accum_Prob)
                                            RyR = 8;
                                        end
                                    end
                            else
                                if(RyR == 8)                                		
                                    a1 = k65/(k56+k65);
                                    a2 = a1*k52;
                                    a3 = a1*k54;         
                                    Accum_Prob = 1.0 - dt*(a2 +a3);
                                        if (rand2>Accum_Prob) 
                                            RyR = 2;
                                            Accum_Prob = Accum_Prob + dt*a2;
                                            if(rand2 > Accum_Prob)
                                                RyR = 7;
                                            end
                                        end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
        
    end
end

end


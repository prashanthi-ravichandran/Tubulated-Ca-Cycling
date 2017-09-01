function [Ltype_state, RyR_state, Ito2_state] = new_gate(tstep,FRUdep_states, FRU_state, Ltype_state,RyR_state,Ito2_state)

global NFRU_sim

onez = gpuArray.ones(NFRU_sim,1,'double');

V      = FRUdep_states(1).*onez;
tempdt = tstep.*onez;
CaSS_1 = FRU_state(:,2).*onez;
CaSS_2 = FRU_state(:,3).*onez;
CaSS_3 = FRU_state(:,4).*onez;
CaSS_4 = FRU_state(:,5).*onez;

LCC1 = Ltype_state(:,1,1).*onez;
LCC2 = Ltype_state(:,2,1).*onez;
LCC3 = Ltype_state(:,3,1).*onez;
LCC4 = Ltype_state(:,4,1).*onez;

Y1 = Ltype_state(:,1,2).*onez;
Y2 = Ltype_state(:,2,2).*onez;
Y3 = Ltype_state(:,3,2).*onez;
Y4 = Ltype_state(:,4,2).*onez;

Ito2_1 = Ito2_state(:,1).*onez;
Ito2_2 = Ito2_state(:,2).*onez;
Ito2_3 = Ito2_state(:,3).*onez;
Ito2_4 = Ito2_state(:,4).*onez;

RyR11 = RyR_state(:,1,1).*onez;
RyR12 = RyR_state(:,1,2).*onez;
RyR13 = RyR_state(:,1,3).*onez;
RyR14 = RyR_state(:,1,4).*onez;
RyR15 = RyR_state(:,1,5).*onez;

RyR21 = RyR_state(:,2,1).*onez;
RyR22 = RyR_state(:,2,2).*onez;
RyR23 = RyR_state(:,2,3).*onez;
RyR24 = RyR_state(:,2,4).*onez;
RyR25 = RyR_state(:,2,5).*onez;

RyR31 = RyR_state(:,3,1).*onez;
RyR32 = RyR_state(:,3,2).*onez;
RyR33 = RyR_state(:,3,3).*onez;
RyR34 = RyR_state(:,3,4).*onez;
RyR35 = RyR_state(:,3,5).*onez;

RyR41 = RyR_state(:,4,1).*onez;
RyR42 = RyR_state(:,4,2).*onez;
RyR43 = RyR_state(:,4,3).*onez;
RyR44 = RyR_state(:,4,4).*onez;
RyR45 = RyR_state(:,4,5).*onez;

rand1  = gpuArray.rand(NFRU_sim,1,'single');
rand2  = gpuArray.rand(NFRU_sim,1,'single');
rand3  = gpuArray.rand(NFRU_sim,1,'single');
rand4  = gpuArray.rand(NFRU_sim,1,'single');
rand5  = gpuArray.rand(NFRU_sim,1,'single');
rand6  = gpuArray.rand(NFRU_sim,1,'single');
rand7  = gpuArray.rand(NFRU_sim,1,'single');
rand8  = gpuArray.rand(NFRU_sim,1,'single');
rand9  = gpuArray.rand(NFRU_sim,1,'single');
rand10 = gpuArray.rand(NFRU_sim,1,'single');
rand11 = gpuArray.rand(NFRU_sim,1,'single');
rand12 = gpuArray.rand(NFRU_sim,1,'single');

rand13  = gpuArray.rand(NFRU_sim,1,'single');
rand14  = gpuArray.rand(NFRU_sim,1,'single');
rand15  = gpuArray.rand(NFRU_sim,1,'single');
rand16  = gpuArray.rand(NFRU_sim,1,'single');
rand17  = gpuArray.rand(NFRU_sim,1,'single');
rand18  = gpuArray.rand(NFRU_sim,1,'single');
rand19  = gpuArray.rand(NFRU_sim,1,'single');
rand20 = gpuArray.rand(NFRU_sim,1,'single');
rand21  = gpuArray.rand(NFRU_sim,1,'single');
rand22 = gpuArray.rand(NFRU_sim,1,'single');
rand23 = gpuArray.rand(NFRU_sim,1,'single');
rand24 = gpuArray.rand(NFRU_sim,1,'single');
rand25 = gpuArray.rand(NFRU_sim,1,'single');

rand26  = gpuArray.rand(NFRU_sim,1,'single');
rand27  = gpuArray.rand(NFRU_sim,1,'single');
rand28  = gpuArray.rand(NFRU_sim,1,'single');
rand29  = gpuArray.rand(NFRU_sim,1,'single');
rand30  = gpuArray.rand(NFRU_sim,1,'single');
rand31  = gpuArray.rand(NFRU_sim,1,'single');
rand32  = gpuArray.rand(NFRU_sim,1,'single');
rand33 = gpuArray.rand(NFRU_sim,1,'single');
rand34  = gpuArray.rand(NFRU_sim,1,'single');
rand35 = gpuArray.rand(NFRU_sim,1,'single');
rand36 = gpuArray.rand(NFRU_sim,1,'single');
rand37 = gpuArray.rand(NFRU_sim,1,'single');

rand38  = gpuArray.rand(NFRU_sim,1,'single');
rand39  = gpuArray.rand(NFRU_sim,1,'single');
rand40  = gpuArray.rand(NFRU_sim,1,'single');
rand41  = gpuArray.rand(NFRU_sim,1,'single');
rand42  = gpuArray.rand(NFRU_sim,1,'single');
rand43  = gpuArray.rand(NFRU_sim,1,'single');
rand44  = gpuArray.rand(NFRU_sim,1,'single');
rand45 = gpuArray.rand(NFRU_sim,1,'single');
rand46  = gpuArray.rand(NFRU_sim,1,'single');
rand47 = gpuArray.rand(NFRU_sim,1,'single');
rand48 = gpuArray.rand(NFRU_sim,1,'single');
rand49 = gpuArray.rand(NFRU_sim,1,'single');
rand50 = gpuArray.rand(NFRU_sim,1,'single');

rand51  = gpuArray.rand(NFRU_sim,1,'single');
rand52  = gpuArray.rand(NFRU_sim,1,'single');
rand53  = gpuArray.rand(NFRU_sim,1,'single');
rand54  = gpuArray.rand(NFRU_sim,1,'single');
rand55  = gpuArray.rand(NFRU_sim,1,'single');
rand56  = gpuArray.rand(NFRU_sim,1,'single');
rand57  = gpuArray.rand(NFRU_sim,1,'single');
rand58  = gpuArray.rand(NFRU_sim,1,'single');
rand59  = gpuArray.rand(NFRU_sim,1,'single');
rand60 = gpuArray.rand(NFRU_sim,1,'single');
rand61 = gpuArray.rand(NFRU_sim,1,'single');
rand62 = gpuArray.rand(NFRU_sim,1,'single');

rand63  = gpuArray.rand(NFRU_sim,1,'single');
rand64  = gpuArray.rand(NFRU_sim,1,'single');
rand65  = gpuArray.rand(NFRU_sim,1,'single');
rand66  = gpuArray.rand(NFRU_sim,1,'single');
rand67  = gpuArray.rand(NFRU_sim,1,'single');
rand68  = gpuArray.rand(NFRU_sim,1,'single');
rand69  = gpuArray.rand(NFRU_sim,1,'single');
rand70 = gpuArray.rand(NFRU_sim,1,'single');
rand71  = gpuArray.rand(NFRU_sim,1,'single');
rand72 = gpuArray.rand(NFRU_sim,1,'single');

[LCC1, Y1, Ito2_1] = arrayfun( @new_Ltype, tempdt,V,CaSS_1, LCC1, Y1, Ito2_1, rand1, rand2, rand3);
[LCC2, Y2, Ito2_2] = arrayfun( @new_Ltype, tempdt,V,CaSS_2, LCC2, Y2, Ito2_2, rand4, rand5, rand6);
[LCC3, Y3, Ito2_3] = arrayfun( @new_Ltype, tempdt,V,CaSS_3, LCC3, Y3, Ito2_3, rand7, rand8, rand9);
[LCC4, Y4, Ito2_4] = arrayfun( @new_Ltype, tempdt,V,CaSS_4, LCC4, Y4, Ito2_4, rand10, rand11, rand12);

[RyR11] = arrayfun( @switch_RyR, tempdt, CaSS_1, RyR11,rand13, rand14, rand15);
[RyR12] = arrayfun( @switch_RyR, tempdt, CaSS_1, RyR12,rand16, rand17, rand18);
[RyR13] = arrayfun( @switch_RyR, tempdt, CaSS_1, RyR13,rand19, rand20, rand21);
[RyR14] = arrayfun( @switch_RyR, tempdt, CaSS_1, RyR14, rand22, rand23, rand24);
[RyR15] = arrayfun( @switch_RyR, tempdt, CaSS_1, RyR15, rand25, rand26, rand27);

[RyR21] = arrayfun( @switch_RyR, tempdt, CaSS_2, RyR21,rand28, rand29, rand30);
[RyR22] = arrayfun( @switch_RyR, tempdt, CaSS_2, RyR22,rand31, rand32, rand33);
[RyR23] = arrayfun( @switch_RyR, tempdt, CaSS_2, RyR23,rand34, rand35, rand36);
[RyR24] = arrayfun( @switch_RyR, tempdt, CaSS_2, RyR24, rand37, rand38, rand39);
[RyR25] = arrayfun( @switch_RyR, tempdt, CaSS_2, RyR25, rand40, rand41, rand42);

[RyR31] = arrayfun( @switch_RyR, tempdt, CaSS_3, RyR31,rand43, rand44, rand45);
[RyR32] = arrayfun( @switch_RyR, tempdt, CaSS_3, RyR32,rand46, rand47, rand48);
[RyR33] = arrayfun( @switch_RyR, tempdt, CaSS_3, RyR33,rand49, rand50, rand51);
[RyR34] = arrayfun( @switch_RyR, tempdt, CaSS_3, RyR34, rand52, rand53, rand54);
[RyR35] = arrayfun( @switch_RyR, tempdt, CaSS_3, RyR35, rand55, rand56, rand57);

[RyR41] = arrayfun( @switch_RyR, tempdt, CaSS_4, RyR41,rand58, rand59, rand60);
[RyR42] = arrayfun( @switch_RyR, tempdt, CaSS_4, RyR42,rand61, rand62, rand63);
[RyR43] = arrayfun( @switch_RyR, tempdt, CaSS_4, RyR43,rand64, rand65, rand66);
[RyR44] = arrayfun( @switch_RyR, tempdt, CaSS_4, RyR44, rand67, rand68, rand69);
[RyR45] = arrayfun( @switch_RyR, tempdt, CaSS_4, RyR45, rand70, rand71, rand72);

Ltype_state(:,1,1) = gather(LCC1);
Ltype_state(:,2,1) = gather(LCC2);
Ltype_state(:,3,1) = gather(LCC3);
Ltype_state(:,4,1) = gather(LCC4);

Ltype_state(:,1,2) = gather(Y1);
Ltype_state(:,2,2) = gather(Y2);
Ltype_state(:,3,2) = gather(Y3);
Ltype_state(:,4,2) = gather(Y4);

Ito2_state(:,1) = gather(Ito2_1);
Ito2_state(:,2) = gather(Ito2_2);
Ito2_state(:,3) = gather(Ito2_3);
Ito2_state(:,4) = gather(Ito2_4);

RyR_state(:,1,1) = gather(RyR11);
RyR_state(:,1,2) = gather(RyR12);
RyR_state(:,1,3) = gather(RyR13);
RyR_state(:,1,4) = gather(RyR14);
RyR_state(:,1,5) = gather(RyR15);

RyR_state(:,2,1) = gather(RyR21);
RyR_state(:,2,2) = gather(RyR22);
RyR_state(:,2,3) = gather(RyR23);
RyR_state(:,2,4) = gather(RyR24);
RyR_state(:,2,5) = gather(RyR25);

RyR_state(:,3,1) = gather(RyR31);
RyR_state(:,3,2) = gather(RyR32);
RyR_state(:,3,3) = gather(RyR33);
RyR_state(:,3,4) = gather(RyR34);
RyR_state(:,3,5) = gather(RyR35);

RyR_state(:,4,1) = gather(RyR41);
RyR_state(:,4,2) = gather(RyR42);
RyR_state(:,4,3) = gather(RyR43);
RyR_state(:,4,4) = gather(RyR44);
RyR_state(:,4,5) = gather(RyR45);

end


#display Qhbl,Qhbe,Qhba,Qhbj,Qhbm,Qhbu;
#display Qrbl,Qrbe,Qrba,Qrbj,Qrbm,Qrbu;
#display Qhgl,Qhge,Qhga,Qhgj,Qhgm,Qhgu;
#display Qrgl,Qrge,Qrga,Qrgj,Qrgm,Qrgu;
#display Qhil,Qhie,Qhia,Qhij,Qhim,Qhiu;
#display Qril,Qrie,Qria,Qrij,Qrim,Qriu;
#display Qhjl,Qhje,Qhja,Qhjj,Qhjm,Qhju;
#display Qrjl,Qrje,Qrja,Qrjj,Qrjm,Qrju;
#display Qhml,Qhme,Qhma,Qhmj,Qhmm,Qhmu;
#display Qrml,Qrme,Qrma,Qrmj,Qrmm,Qrmu;
#display Qhul,Qhue,Qhua,Qhuj,Qhum,Qhuu;
#display Qrul,Qrue,Qrua,Qruj,Qrum,Qruu;



#variables
var Qhbl; #quantity highcal from plant brazil to region latin america
var Qhbe;
var Qhba;
var Qhbj;
var Qhbm;
var Qhbu;

var Qrbl; #quantity relax from brazil to latin america
var Qrbe;
var Qrba;
var Qrbj;
var Qrbm;
var Qrbu;

var Qhgl; #quantity highcal from germany to latin america
var Qhge;
var Qhga;
var Qhgj;
var Qhgm;
var Qhgu;

var Qrgl; #quantity relax from germany to latin america
var Qrge;
var Qrga;
var Qrgj;
var Qrgm;
var Qrgu;

var Qhil; #quantity highcal from india to latin america
var Qhie;
var Qhia;
var Qhij;
var Qhim;
var Qhiu;

var Qril; #quantity relax from india to latin america
var Qrie;
var Qria;
var Qrij;
var Qrim;
var Qriu;

var Qhjl; #quantity highcal from japan to latin america
var Qhje;
var Qhja;
var Qhjj;
var Qhjm;
var Qhju;

var Qrjl; #quantity relax from japan to latin america
var Qrje;
var Qrja;
var Qrjj;
var Qrjm;
var Qrju;

var Qhml; #quantity highcal from mexico to latin america
var Qhme;
var Qhma;
var Qhmj;
var Qhmm;
var Qhmu;

var Qrml; #quantity relax from mexico to latin america
var Qrme;
var Qrma;
var Qrmj;
var Qrmm;
var Qrmu;

var Qhul; #quantity highcal from us to latin america
var Qhue;
var Qhua;
var Qhuj;
var Qhum;
var Qhuu;

var Qrul; #quantity relax from us to latin america
var Qrue;
var Qrua;
var Qruj;
var Qrum;
var Qruu;

#parameters

#exchange rates

param real:= 0.9358025;
param euro:= 0.952862;
param rupee:= 1.0548794;
param yen:= 1.1045637;
param peso:= 1.0747187;
param usd:= 1;

#import
param import_l:=0.3;
param import_e:=0.03;
param import_a:=0.27;
param import_j:=0.06;
param import_m:=0.35;
param import_u:=0.4;

#brazil fixed, variable costs
param br_fc_all := 20000000;
param br_fc_hc:= 5000000;
param br_fc_r:= 5000000;
param br_vc_hc:= 8.7; #raw material+production cost for highcal($/kg)
param br_vc_r:= 11.2; #raw material+production cost for relax($/kg)

#brazil transport costs
param trans_br_l:= 0.2; #USD/kg
param trans_br_e:= 0.45;
param trans_br_a:=0.5;
param trans_br_j:=0.5;
param trans_br_m:=0.4;
param trans_br_u:=0.45;

#germany fixed, variable costs
param ger_fc_all := 45000000;
param ger_fc_hc:= 13000000;
param ger_fc_r:= 14000000;
param ger_vc_hc:= 10.9; #raw material+production cost for highcal($/kg)
param ger_vc_r:= 13.5; #raw material+production cost for relax($/kg)

#germany transport costs
param trans_ger_l:= 0.45; #USD/kg
param trans_ger_e:= 0.2;
param trans_ger_a:=0.35;
param trans_ger_j:=0.4;
param trans_ger_m:=0.3;
param trans_ger_u:=0.3;

#india fixed, variable costs
param ind_fc_all := 18000000;
param ind_fc_hc:= 4000000;
param ind_fc_r:= 4000000;
param ind_vc_hc:= 8.1; #raw material+production cost for highcal($/kg)
param ind_vc_r:= 10.5; #raw material+production cost for relax($/kg)

#india transport costs
param trans_ind_l:= 0.5; #USD/kg
param trans_ind_e:= 0.35;
param trans_ind_a:=0.2;
param trans_ind_j:=0.3;
param trans_ind_m:=0.5;
param trans_ind_u:=0.45;

# japan fixed, variable costs
param jap_fc_all := 17000000;
param jap_fc_hc:= 6000000;
param jap_fc_r:= 6000000;
param jap_vc_hc:= 11.4; #raw material+production cost for highcal($/kg)
param jap_vc_r:= 14.1; #raw material+production cost for relax($/kg)

# japan transport costs
param trans_jap_l:= 0.5; #USD/kg
param trans_jap_e:= 0.4;
param trans_jap_a:=0.3;
param trans_jap_j:=0.1;
param trans_jap_m:=0.45;
param trans_jap_u:=0.45;

# mexico fixed, variable costs
param mex_fc_all := 30000000;
param mex_fc_hc:= 6000000;
param mex_fc_r:= 6000000;
param mex_vc_hc:= 8.6; #raw material+production cost for highcal($/kg)
param mex_vc_r:= 11.1; #raw material+production cost for relax($/kg)

# mexico transport costs
param trans_mex_l:= 0.4; #USD/kg
param trans_mex_e:= 0.3;
param trans_mex_a:=0.5;
param trans_mex_j:=0.45;
param trans_mex_m:=0.20;
param trans_mex_u:=0.25;

# us fixed, variable costs
param us_fc_all := 21000000;
param us_fc_hc:= 5000000;
param us_fc_r:= 5000000;
param us_vc_hc:= 8.6; #raw material+production cost for highcal($/kg)
param us_vc_r:= 11.1; #raw material+production cost for relax($/kg)

# us transport costs
param trans_us_l:= 0.45; #USD/kg
param trans_us_e:= 0.3;
param trans_us_a:=0.45;
param trans_us_j:=0.45;
param trans_us_m:=0.25;
param trans_us_u:=0.20;

#additional switch variables

var B0 binary; #brazil factory fixed costs switch
var B1 binary; #brazil highcal fixed costs switch
var B2 binary; #brazil relax fixed costs switch
var G0 binary;
var G1 binary;
var G2 binary;
var I0 binary;
var I1 binary;
var I2 binary;
var J0 binary;
var J1 binary;
var J2 binary;
var M0 binary;
var M1 binary;
var M2 binary;
var U0 binary;
var U1 binary;
var U2 binary;

#objective function


minimize costs: 
	
	(0.8*B0*br_fc_all+0.2*br_fc_all+0.8*B1*br_fc_hc+0.2*br_fc_hc
		+B1*Qhbl*(trans_br_l+br_vc_hc)*(1)
		+B1*Qhbe*(trans_br_e+br_vc_hc)*(1+import_e)
		+B1*Qhba*(trans_br_a+br_vc_hc)*(1+import_a)
		+B1*Qhbj*(trans_br_j+br_vc_hc)*(1+import_j)
		+B1*Qhbm*(trans_br_m+br_vc_hc)*(1+import_m)
		+B1*Qhbu*(trans_br_u+br_vc_hc)*(1+import_u)
	
	+0.8*B2*br_fc_r+0.2*br_fc_r
		+B2*Qrbl*(trans_br_l+br_vc_r)*(1)
		+B2*Qrbe*(trans_br_e+br_vc_r)*(1+import_e)
		+B2*Qrba*(trans_br_a+br_vc_r)*(1+import_a)
		+B2*Qrbj*(trans_br_j+br_vc_r)*(1+import_j)
		+B2*Qrbm*(trans_br_m+br_vc_r)*(1+import_m)
		+B2*Qrbu*(trans_br_u+br_vc_r)*(1+import_u))*0.9358025

	+(0.8*G0*ger_fc_all+0.2*ger_fc_all+0.8*G1*ger_fc_hc+0.2*ger_fc_hc
		+G1*Qhgl*(trans_ger_l+ger_vc_hc)*(1+import_l)
		+G1*Qhge*(trans_ger_e+ger_vc_hc)*(1)
		+G1*Qhga*(trans_ger_a+ger_vc_hc)*(1+import_a)
		+G1*Qhgj*(trans_ger_j+ger_vc_hc)*(1+import_j)
		+G1*Qhgm*(trans_ger_m+ger_vc_hc)*(1+import_m)
		+G1*Qhgu*(trans_ger_u+ger_vc_hc)*(1+import_u))*0.952862
	
	+(0.8*G2*ger_fc_r+0.2*ger_fc_r
		+G2*Qrgl*(trans_ger_l+ger_vc_r)*(1+import_l)
		+G2*Qrge*(trans_ger_e+ger_vc_r)*(1)
		+G2*Qrga*(trans_ger_a+ger_vc_r)*(1+import_a)
		+G2*Qrgj*(trans_ger_j+ger_vc_r)*(1+import_j)
		+G2*Qrgm*(trans_ger_m+ger_vc_r)*(1+import_m)
		+G2*Qrgu*(trans_ger_u+ger_vc_r)*(1+import_u))*1.0548794

	+(0.8*I0*ind_fc_all+0.2*ind_fc_all
	+0.8*I1*ind_fc_hc+0.2*ind_fc_hc
		+I1*Qhil*(trans_ind_l+ind_vc_hc)*(1+import_l)
		+I1*Qhie*(trans_ind_e+ind_vc_hc)*(1+import_e)
		+I1*Qhia*(trans_ind_a+ind_vc_hc)*(1)
		+I1*Qhij*(trans_ind_j+ind_vc_hc)*(1+import_j)
		+I1*Qhim*(trans_ind_m+ind_vc_hc)*(1+import_m)
		+I1*Qhiu*(trans_ind_u+ind_vc_hc)*(1+import_u)
	
	+0.8*I2*ind_fc_r+0.2*ind_fc_r
		+I2*Qril*(trans_ind_l+ind_vc_r)*(1+import_l)
		+I2*Qrie*(trans_ind_e+ind_vc_r)*(1+import_e)
		+I2*Qria*(trans_ind_a+ind_vc_r)*(1)
		+I2*Qrij*(trans_ind_j+ind_vc_r)*(1+import_j)
		+I2*Qrim*(trans_ind_m+ind_vc_r)*(1+import_m)
		+I2*Qriu*(trans_ind_u+ind_vc_r)*(1+import_u))*1.0548794
		
	+(0.8*J0*jap_fc_all+0.2*jap_fc_all+0.8*J1*jap_fc_hc+0.2*jap_fc_hc
		+J1*Qhjl*(trans_jap_l+jap_vc_hc)*(1+import_l)
		+J1*Qhje*(trans_jap_e+jap_vc_hc)*(1+import_e)
		+J1*Qhja*(trans_jap_a+jap_vc_hc)*(1+import_a)
		+J1*Qhjj*(trans_jap_j+jap_vc_hc)*(1)
		+J1*Qhjm*(trans_jap_m+jap_vc_hc)*(1+import_m)
		+J1*Qhju*(trans_jap_u+jap_vc_hc)*(1+import_u)
	
	+0.8*J2*jap_fc_r+0.2*jap_fc_r
		+J2*Qrjl*(trans_jap_l+jap_vc_r)*(1+import_l)
		+J2*Qrje*(trans_jap_e+jap_vc_r)*(1+import_e)
		+J2*Qrja*(trans_jap_a+jap_vc_r)*(1+import_a)
		+J2*Qrjj*(trans_jap_j+jap_vc_r)*(1)
		+J2*Qrjm*(trans_jap_m+jap_vc_r)*(1+import_m)
		+J2*Qrju*(trans_jap_u+jap_vc_r)*(1+import_u))*1.0747187

	+(0.8*M0*mex_fc_all+0.2*mex_fc_all+0.8*M1*mex_fc_hc+0.2*mex_fc_hc
		+M1*Qhml*(trans_mex_l+mex_vc_hc)*(1+import_l)
		+M1*Qhme*(trans_mex_e+mex_vc_hc)*(1+import_e)
		+M1*Qhma*(trans_mex_a+mex_vc_hc)*(1+import_a)
		+M1*Qhmj*(trans_mex_j+mex_vc_hc)*(1+import_j)
		+M1*Qhmm*(trans_mex_m+mex_vc_hc)*(1)
		+M1*Qhmu*(trans_mex_u+mex_vc_hc)*(1+import_u)
	
	+0.8*M2*mex_fc_r+0.2*mex_fc_r
		+M2*Qrml*(trans_mex_l+mex_vc_r)*(1+import_l)
		+M2*Qrme*(trans_mex_e+mex_vc_r)*(1+import_e)
		+M2*Qrma*(trans_mex_a+mex_vc_r)*(1+import_a)
		+M2*Qrmj*(trans_mex_j+mex_vc_r)*(1+import_j)
		+M2*Qrmm*(trans_mex_m+mex_vc_r)*(1)
		+M2*Qrmu*(trans_mex_u+mex_vc_r)*(1+import_u))*1.0747187
		
	+0.8*U0*us_fc_all+0.2*us_fc_all+0.8*U1*us_fc_hc+0.2*us_fc_hc
		+U1*Qhul*(trans_us_l+us_vc_hc)*(1+import_l)
		+U1*Qhue*(trans_us_e+us_vc_hc)*(1+import_e)
		+U1*Qhua*(trans_us_a+us_vc_hc)*(1+import_a)
		+U1*Qhuj*(trans_us_j+us_vc_hc)*(1+import_j)
		+U1*Qhum*(trans_us_m+us_vc_hc)*(1+import_m)
		+U1*Qhuu*(trans_us_u+us_vc_hc)*(1)
	
	+0.8*U2*us_fc_r+0.2*us_fc_r
		+U2*Qrul*(trans_us_l+us_vc_r)*(1+import_l)
		+U2*Qrue*(trans_us_e+us_vc_r)*(1+import_e)
		+U2*Qrua*(trans_us_a+us_vc_r)*(1+import_a)
		+U2*Qruj*(trans_us_j+us_vc_r)*(1+import_j)
		+U2*Qrum*(trans_us_m+us_vc_r)*(1+import_m)
		+U2*Qruu*(trans_us_u+us_vc_r)*(1);



#contraints
#demands by region = sales made in 2009 = demand = supply
#assume that any factory can ship to any region
subject to l_h_demand: Qhbl+Qhgl+Qhil+Qhjl+Qhml+Qhul>=7000000;
subject to l_r_demand: Qrbl+Qrgl+Qril+Qrjl+Qrml+Qrul>=7000000;
subject to e_h_demand: Qhbe+Qhge+Qhie+Qhje+Qhme+Qhue>=15000000;
subject to e_r_demand: Qrbe+Qrge+Qrie+Qrje+Qrme+Qrue>=12000000;
subject to a_h_demand: Qhba+Qhga+Qhia+Qhja+Qhma+Qhua>=5000000;
subject to a_r_demand: Qrba+Qrga+Qria+Qrja+Qrma+Qrua>=3000000;
subject to j_h_demand: Qhbj+Qhgj+Qhij+Qhjj+Qhmj+Qhuj>=7000000;
subject to j_r_demand: Qrbj+Qrgj+Qrij+Qrjj+Qrmj+Qruj>=8000000;
subject to m_h_demand: Qhbm+Qhgm+Qhim+Qhjm+Qhmm+Qhum>=3000000;
subject to m_r_demand: Qrbm+Qrgm+Qrim+Qrjm+Qrmm+Qrum>=3000000;
subject to u_h_demand: Qhbu+Qhgu+Qhiu+Qhju+Qhmu+Qhuu>=18000000;
subject to u_r_demand: Qrbu+Qrgu+Qriu+Qrju+Qrmu+Qruu>=17000000;

#capacity limits
subject to br_capacity: Qhbl+ Qhbe+ Qhba+ Qhbj+ Qhbm+ Qhbu+ 
						Qrbl+ Qrbe+ Qrba+ Qrbj+ Qrbm+ Qrbu<=18000000;
subject to ger_capacity:Qhgl+ Qhge+ Qhga+ Qhgj+ Qhgm+ Qhgu+
						Qrgl+ Qrge+ Qrga+ Qrgj+ Qrgm+ Qrgu<=45000000;
subject to ind_capacity:Qhil+ Qhie+ Qhia+ Qhij+ Qhim+ Qhiu+ 
						Qril + Qrie+ Qria+ Qrij+ Qrim+ Qriu<=18000000;
subject to jap_capacity:Qhjl+ Qhje+ Qhja+ Qhjj+ Qhjm+ Qhju+ 
						Qrjl + Qrje+ Qrja+ Qrjj+ Qrjm+ Qrju<=10000000;
subject to mex_capacity:Qhml+ Qhme+ Qhma+ Qhmj+ Qhmm+ Qhmu+ 
						Qrml + Qrme+ Qrma+ Qrmj+ Qrmm+ Qrmu<=30000000;
subject to us_capacity: Qhul+ Qhue+ Qhua+ Qhuj+ Qhum+ Qhuu+ 
						Qrul + Qrue+ Qrua+ Qruj+ Qrum+ Qruu<=22000000;


#switch for plants
subject to brazil0: B0>=B1;
subject to brazil1: B0>=B2;
subject to germany0: G0>=G1;
subject to germany1: G0>=G2;
subject to india0: I0>=I1;
subject to india1: I0>=I2;
subject to japan0: J0>=J1;
subject to japan1: J0>=J2;
subject to mexico0: M0>=M1;
subject to mexico1: M0>=M2;
subject to us0: U0>=U1;
subject to us1: U0>=U2;

#non-negative quantities constraints

subject to nonneg1: Qhbl>=0;				
subject to nonneg2: Qhbe>=0;
subject to nonneg3: Qhba>=0;
subject to nonneg4: Qhbj>=0;
subject to nonneg5: Qhbm>=0;
subject to nonneg6: Qhbu>=0;

subject to nonneg7: Qrbl>=0;
subject to nonneg8: Qrbe>=0;
subject to nonneg9: Qrba>=0;
subject to nonneg10: Qrbj>=0;
subject to nonneg11: Qrbm>=0;
subject to nonneg12: Qrbu>=0;

subject to nonneg13: Qhgl>=0;				
subject to nonneg14: Qhge>=0;
subject to nonneg15: Qhga>=0;
subject to nonneg16: Qhgj>=0;
subject to nonneg17: Qhgm>=0;
subject to nonneg18: Qhgu>=0;

subject to nonneg19: Qrgl>=0;
subject to nonneg20: Qrge>=0;
subject to nonneg21: Qrga>=0;
subject to nonneg22: Qrgj>=0;
subject to nonneg23: Qrgm>=0;
subject to nonneg24: Qrgu>=0;

subject to nonneg25: Qhil>=0;				
subject to nonneg26: Qhie>=0;
subject to nonneg27: Qhia>=0;
subject to nonneg28: Qhij>=0;
subject to nonneg29: Qhim>=0;
subject to nonneg30: Qhiu>=0;

subject to nonneg31: Qril>=0;
subject to nonneg32: Qrie>=0;
subject to nonneg33: Qria>=0;
subject to nonneg34: Qrij>=0;
subject to nonneg35: Qrim>=0;
subject to nonneg36: Qriu>=0;

subject to nonneg37: Qhjl>=0;				
subject to nonneg38: Qhje>=0;
subject to nonneg39: Qhja>=0;
subject to nonneg40: Qhjj>=0;
subject to nonneg41: Qhjm>=0;
subject to nonneg42: Qhju>=0;

subject to nonneg43: Qrjl>=0;
subject to nonneg44: Qrje>=0;
subject to nonneg45: Qrja>=0;
subject to nonneg46: Qrjj>=0;
subject to nonneg47: Qrjm>=0;
subject to nonneg48: Qrju>=0;

subject to nonneg49: Qhml>=0;				
subject to nonneg50: Qhme>=0;
subject to nonneg51: Qhma>=0;
subject to nonneg52: Qhmj>=0;
subject to nonneg53: Qhmm>=0;
subject to nonneg54: Qhmu>=0;

subject to nonneg55: Qrml>=0;
subject to nonneg56: Qrme>=0;
subject to nonneg57: Qrma>=0;
subject to nonneg58: Qrmj>=0;
subject to nonneg59: Qrmm>=0;
subject to nonneg60: Qrmu>=0;

subject to nonneg61: Qhul>=0;				
subject to nonneg62: Qhue>=0;
subject to nonneg63: Qhua>=0;
subject to nonneg64: Qhuj>=0;
subject to nonneg65: Qhum>=0;
subject to nonneg66: Qhuu>=0;

subject to nonneg67: Qrul>=0;
subject to nonneg68: Qrue>=0;
subject to nonneg69: Qrua>=0;
subject to nonneg70: Qruj>=0;
subject to nonneg71: Qrum>=0;
subject to nonneg72: Qruu>=0;

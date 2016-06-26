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
param br_vc_hc:= 3.6+5.1; #raw material+production cost for highcal($/kg)
param br_vc_r:= 4.6+6.6; #raw material+production cost for relax($/kg)

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
param ger_vc_hc:= 3.9+7; #raw material+production cost for highcal($/kg)
param ger_vc_r:= 5+8.5; #raw material+production cost for relax($/kg)

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
param ind_vc_hc:= 3.6+4.5; #raw material+production cost for highcal($/kg)
param ind_vc_r:= 4.5+6; #raw material+production cost for relax($/kg)

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
param jap_vc_hc:= 3.9+7.5; #raw material+production cost for highcal($/kg)
param jap_vc_r:= 5.1+9; #raw material+production cost for relax($/kg)

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
param mex_vc_hc:= 3.6+5; #raw material+production cost for highcal($/kg)
param mex_vc_r:= 4.6+6.5; #raw material+production cost for relax($/kg)

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
param us_vc_hc:= 3.6+5.0; #raw material+production cost for highcal($/kg)
param us_vc_r:= 4.5+6.5; #raw material+production cost for relax($/kg)

# us transport costs
param trans_us_l:=0.45; #USD/kg
param trans_us_e:=0.3;
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

var AB binary; #additional capacity constant
var AG binary;
var AI binary;
var AJ binary;
var AM binary;
var AU binary;


subject to oneonly: AB+AG+AI+AJ+AM+AU<=1;

#objective function

minimize costs: 
	
	0.8*B0*br_fc_all+0.2*br_fc_all
	+0.8*B1*br_fc_hc+0.2*br_fc_hc
		+Qhbl*(trans_br_l+br_vc_hc)*(1)
		+Qhbe*(trans_br_e+br_vc_hc)*(1+import_e)
		+Qhba*(trans_br_a+br_vc_hc)*(1+import_a)
		+Qhbj*(trans_br_j+br_vc_hc)*(1+import_j)
		+Qhbm*(trans_br_m+br_vc_hc)*(1+import_m)
		+Qhbu*(trans_br_u+br_vc_hc)*(1+import_u)
	
	+0.8*B2*br_fc_r+0.2*br_fc_r
		+Qrbl*(trans_br_l+br_vc_r)*(1)
		+Qrbe*(trans_br_e+br_vc_r)*(1+import_e)
		+Qrba*(trans_br_a+br_vc_r)*(1+import_a)
		+Qrbj*(trans_br_j+br_vc_r)*(1+import_j)
		+Qrbm*(trans_br_m+br_vc_r)*(1+import_m)
		+Qrbu*(trans_br_u+br_vc_r)*(1+import_u)

	+0.8*G0*ger_fc_all+0.2*ger_fc_all
	+0.8*G1*ger_fc_hc+0.2*ger_fc_hc
		+Qhgl*(trans_ger_l+ger_vc_hc)*(1+import_l)
		+Qhge*(trans_ger_e+ger_vc_hc)*(1)
		+Qhga*(trans_ger_a+ger_vc_hc)*(1+import_a)
		+Qhgj*(trans_ger_j+ger_vc_hc)*(1+import_j)
		+Qhgm*(trans_ger_m+ger_vc_hc)*(1+import_m)
		+Qhgu*(trans_ger_u+ger_vc_hc)*(1+import_u)
	
	+0.8*G2*ger_fc_r+0.2*ger_fc_r
		+Qrgl*(trans_ger_l+ger_vc_r)*(1+import_l)
		+Qrge*(trans_ger_e+ger_vc_r)*(1)
		+Qrga*(trans_ger_a+ger_vc_r)*(1+import_a)
		+Qrgj*(trans_ger_j+ger_vc_r)*(1+import_j)
		+Qrgm*(trans_ger_m+ger_vc_r)*(1+import_m)
		+Qrgu*(trans_ger_u+ger_vc_r)*(1+import_u)

	+0.8*I0*ind_fc_all+0.2*ind_fc_all
	+0.8*I1*ind_fc_hc+0.2*ind_fc_hc
		+Qhil*(trans_ind_l+ind_vc_hc)*(1+import_l)
		+Qhie*(trans_ind_e+ind_vc_hc)*(1+import_e)
		+Qhia*(trans_ind_a+ind_vc_hc)*(1)
		+Qhij*(trans_ind_j+ind_vc_hc)*(1+import_j)
		+Qhim*(trans_ind_m+ind_vc_hc)*(1+import_m)
		+Qhiu*(trans_ind_u+ind_vc_hc)*(1+import_u)
	
	+0.8*I2*ind_fc_r+0.2*ind_fc_r
		+Qril*(trans_ind_l+ind_vc_r)*(1+import_l)
		+Qrie*(trans_ind_e+ind_vc_r)*(1+import_e)
		+Qria*(trans_ind_a+ind_vc_r)*(1)
		+Qrij*(trans_ind_j+ind_vc_r)*(1+import_j)
		+Qrim*(trans_ind_m+ind_vc_r)*(1+import_m)
		+Qriu*(trans_ind_u+ind_vc_r)*(1+import_u)
		
	+0.8*J0*jap_fc_all+0.2*jap_fc_all
	+0.8*J1*jap_fc_hc+0.2*jap_fc_hc
		+Qhjl*(trans_jap_l+jap_vc_hc)*(1+import_l)
		+Qhje*(trans_jap_e+jap_vc_hc)*(1+import_e)
		+Qhja*(trans_jap_a+jap_vc_hc)*(1+import_a)
		+Qhjj*(trans_jap_j+jap_vc_hc)*(1)
		+Qhjm*(trans_jap_m+jap_vc_hc)*(1+import_m)
		+Qhju*(trans_jap_u+jap_vc_hc)*(1+import_u)
	
	+0.8*J2*jap_fc_r+0.2*jap_fc_r
		+Qrjl*(trans_jap_l+jap_vc_r)*(1+import_l)
		+Qrje*(trans_jap_e+jap_vc_r)*(1+import_e)
		+Qrja*(trans_jap_a+jap_vc_r)*(1+import_a)
		+Qrjj*(trans_jap_j+jap_vc_r)*(1)
		+Qrjm*(trans_jap_m+jap_vc_r)*(1+import_m)
		+Qrju*(trans_jap_u+jap_vc_r)*(1+import_u)

	+0.8*M0*mex_fc_all+0.2*mex_fc_all
	+0.8*M1*mex_fc_hc+0.2*mex_fc_hc
		+Qhml*(trans_mex_l+mex_vc_hc)*(1+import_l)
		+Qhme*(trans_mex_e+mex_vc_hc)*(1+import_e)
		+Qhma*(trans_mex_a+mex_vc_hc)*(1+import_a)
		+Qhmj*(trans_mex_j+mex_vc_hc)*(1+import_j)
		+Qhmm*(trans_mex_m+mex_vc_hc)*(1)
		+Qhmu*(trans_mex_u+mex_vc_hc)*(1+import_u)
	
	+0.8*M2*mex_fc_r+0.2*mex_fc_r
		+Qrml*(trans_mex_l+mex_vc_r)*(1+import_l)
		+Qrme*(trans_mex_e+mex_vc_r)*(1+import_e)
		+Qrma*(trans_mex_a+mex_vc_r)*(1+import_a)
		+Qrmj*(trans_mex_j+mex_vc_r)*(1+import_j)
		+Qrmm*(trans_mex_m+mex_vc_r)*(1)
		+Qrmu*(trans_mex_u+mex_vc_r)*(1+import_u)
		
	+0.8*U0*us_fc_all+0.2*us_fc_all
	+0.8*U1*us_fc_hc+0.2*us_fc_hc
		+Qhul*(trans_us_l+us_vc_hc)*(1+import_l)
		+Qhue*(trans_us_e+us_vc_hc)*(1+import_e)
		+Qhua*(trans_us_a+us_vc_hc)*(1+import_a)
		+Qhuj*(trans_us_j+us_vc_hc)*(1+import_j)
		+Qhum*(trans_us_m+us_vc_hc)*(1+import_m)
		+Qhuu*(trans_us_u+us_vc_hc)*(1)
	
	+0.8*U2*us_fc_r+0.2*us_fc_r
		+Qrul*(trans_us_l+us_vc_r)*(1+import_l)
		+Qrue*(trans_us_e+us_vc_r)*(1+import_e)
		+Qrua*(trans_us_a+us_vc_r)*(1+import_a)
		+Qruj*(trans_us_j+us_vc_r)*(1+import_j)
		+Qrum*(trans_us_m+us_vc_r)*(1+import_m)
		+Qruu*(trans_us_u+us_vc_r)*(1)
		
	+ AB*3000000
	+ AG*3000000
	+ AI*3000000
	+ AJ*3000000
	+ AM*3000000
	+ AU*3000000;
	
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
						Qrbl+ Qrbe+ Qrba+ Qrbj+ Qrbm+ Qrbu<=18000000 + AB*1000000;
subject to ger_capacity:Qhgl+ Qhge+ Qhga+ Qhgj+ Qhgm+ Qhgu+
						Qrgl+ Qrge+ Qrga+ Qrgj+ Qrgm+ Qrgu<=45000000 + AG*1000000;
subject to ind_capacity:Qhil+ Qhie+ Qhia+ Qhij+ Qhim+ Qhiu+ 
						Qril + Qrie+ Qria+ Qrij+ Qrim+ Qriu<=18000000 + AI*1000000;
subject to jap_capacity:Qhjl+ Qhje+ Qhja+ Qhjj+ Qhjm+ Qhju+ 
						Qrjl + Qrje+ Qrja+ Qrjj+ Qrjm+ Qrju<=10000000 + AJ*1000000;
subject to mex_capacity:Qhml+ Qhme+ Qhma+ Qhmj+ Qhmm+ Qhmu+ 
						Qrml + Qrme+ Qrma+ Qrmj+ Qrmm+ Qrmu<=30000000 + AM*1000000;
subject to us_capacity: Qhul+ Qhue+ Qhua+ Qhuj+ Qhum+ Qhuu+ 
						Qrul + Qrue+ Qrua+ Qruj+ Qrum+ Qruu<=22000000 + AU*1000000;


#switch for plants
subject to brazil1: B0>=B1;
subject to brazil2: B0>=B2;
subject to germany1: G0>=G1;
subject to germany2: G0>=G2;
subject to india1: I0>=I1;
subject to india2: I0>=I2;
subject to japan1: J0>=J1;
subject to japan2: J0>=J2;
subject to mexico1: M0>=M1;
subject to mexico2: M0>=M2;
subject to us1: U0>=U1;
subject to us2: U0>=U2;

#switch for production
subject to brazil_prod1: 500000000*B1>=Qhbl+ Qhbe+ Qhba+ Qhbj+ Qhbm+ Qhbu;
subject to brazil_prod2: 500000000*B2>=Qrbl+ Qrbe+ Qrba+ Qrbj+ Qrbm+ Qrbu;
subject to germany_prod1: 500000000*G1>=Qhgl+ Qhge+ Qhga+ Qhgj+ Qhgm+ Qhgu;
subject to germany_prod2: 500000000*G2>=Qrgl+ Qrge+ Qrga+ Qrgj+ Qrgm+ Qrgu;
subject to india_prod1: 500000000*I1>=Qhil+ Qhie+ Qhia+ Qhij+ Qhim+ Qhiu;
subject to india_prod2: 500000000*I2>=Qril + Qrie+ Qria+ Qrij+ Qrim+ Qriu;
subject to japan_prod1: 500000000*J1>=Qhjl+ Qhje+ Qhja+ Qhjj+ Qhjm+ Qhju;
subject to japan_prod2: 500000000*J2>=Qrjl + Qrje+ Qrja+ Qrjj+ Qrjm+ Qrju;
subject to mexico_prod1: 500000000*M1>=Qhml+ Qhme+ Qhma+ Qhmj+ Qhmm+ Qhmu;
subject to mexico_prod2: 500000000*M2>=Qrml + Qrme+ Qrma+ Qrmj+ Qrmm+ Qrmu;
subject to us_prod1: 500000000*U1>=Qhul+ Qhue+ Qhua+ Qhuj+ Qhum+ Qhuu;
subject to us_prod2: 500000000*U2>=Qrul + Qrue+ Qrua+ Qruj+ Qrum+ Qruu;


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

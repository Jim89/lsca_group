#quantities

#set regions;
#param importduties {regions} > 0;
#set regions := latinamerica_i	europe_i	asia_i	japan_i	mexico_i	us_i;

#param importduties:=
#	 latinamerica_i 0.3
#	 europe_i 0.03
#	 asia_i 0.27
#	 japan_i 0.06
#	 mexico_i 0.35
#	 us_i 0.04;
	 
#set origin:= brazil_t germany_t india_t japan_t mexico_t us_t;
#set costs:= plant_fc highcal_fc relax_fc highcal_vc relax_vc;

#param transportcost:
#				plant_fc	highcal_fc	relax_fc	highcal_vc	relax_vc:=
#	brazil_t	20000000	5.0			5.0			8.7			11.2
#	germany_t	45000000	13.0		14.0		10.9		13.5
#	india_t		18000000	4.0			4.0			8.1			10.5
#	japan_t		17000000	6.0			6.0			11.4		14.1
#	mexico_t	30000000	6.0			6.0			8.6			11.1
#	us_t		21000000	5.0			5.0			8.6			11.0;

	
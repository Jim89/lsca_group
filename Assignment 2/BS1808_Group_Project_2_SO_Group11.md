# BS1808 Logistics and Supply Chain Analytics Group Assignment Two
Jone Leung, Somto Okoye, Valentin Poirelle, Jin Anne Lee, Jim Leach, Niccolo Valerio  
18 June 2016  

<br>
<br>
<p style="border:1.5px; border-style:solid; border-color:#000000; padding: 1em;"> This `HTML` report is best viewed using a modern web browser such as Mozilla Firefox or Google Chrome. It is also available on the [online repository](https://github.com/Jim89/lsca_group). Printing is possible but will not produce an optimal reading experience.</p>


```r
# Set default knitr options
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE, fig.align = "center",
                      scipen = 999)

# Load packages
library(dplyr)
library(tidyr)
library(ggplot2)
library(knitr)
library(purrr)
library(readxl)
```

# Introduction

## Project overview

The overarching goal of this project is to optimise inventory and redesign the supply chain network of BioPharma, a chemical company. We use a combination of optimisation, heuristics and decision trees to evaluate improvements in order to make recommendations for courses of actions so that the company can cut costs and stay competitive in the global market.

In 2009, all six of BioPharma's plants maintained its capabilities for producing both Highcal and Relax; these chemicals can be shipped to any other parts of the world with additional costs attached. Furthermore, BioPharma faces import duties for all foreign goods entering a country, independent from plant origin. 

Based on the information given in tables, it is observed that

* Plants with higher fixed costs are Germany and Mexico.
* Plants with higher variable costs are Germany and Japan.
* Mexico and German plants have greater capacities.
* Some regions such as the US imported Highcal and Germany imported Relax from other plants.
* In 2009, not all plants operated at full capacity, i.e. Japan and Germany. The plants in Mexico, US, Brazil and India  operated at full capacity. 
* Import tax into Europe, Japan and US is very low.

# Wiser on Hindsight: What could have been done in 2009? (No closing down)

## The Optimisation Problem

Under the above conditions, the following optimisation problem is constructed to identify a more efficient use of resources.

__Decision Variables__

* $Q_{i,j,k}$ is the quantity of chemical $i$ to produce from plant $j$ for region $k$,
* $F_{all,j}$ is the fixed cost independent of chemical produced for plant $j$,
* $F_{i,j}$ is the fixed cost associated to producing chemical $i$ in plant $j$,
* $V_{i,j}$ is the total variable costs (raw materials and production) of producing chemical $i$ in plant $j$,
* $T_{j,k}$ is the transportation costs for shipping from plant $j$ to region $k$, and
* $I_{j,k}$ is the import tax for importing from plant $j$ to region $k$, in decimal form.

__Objective Function__

The objective function for cost is as follows:
minimise 

$\sum_{k=1}^6\sum_{j=1}^6 \sum_{i=1}^2 F_{all,j} + F_{i,j} + Q_{i,j,k}.(V_{i,j}+T_{j,k})( 1 +I_{j,k})$

__Constraints__

* Non-negative quantities $Q_{i,j,k}$
* Maximum plant capacity for producing both chemicals
* Meeting sales and demand levels 

## Results

Biopharma should have utilised its resources in the following way:


```r
# Set scipen
options(scipen = 999)

# Get raw demand data
output <- read_excel("optim1.xlsx", sheet = "Sheet1") %>% 
            # Set column names as the first two are not present in the Excel
            set_names(c("region", 
                        "chem", 
                        "brazil", 
                        "germany", 
                        "india", 
                        "japan", 
                        "mex", 
                        "us")) %>%
            # Fill in missing values with the value from the previous row for the 
            # region names which are missing
            mutate(region = zoo::na.locf(region))

# Pretty print the output
kable(output,
      col.names = c("Sale Region", 
                    "Chemical", 
                    "Brazil", 
                    "Germany", 
                    "India", 
                    "Japan", 
                    "Mexico", 
                    "USA"),
      format.args = list(big.mark = ","),
      caption = "Table 1: Optimal Production Output in 2009")
```



Table: Table 1: Optimal Production Output in 2009

Sale Region     Chemical       Brazil      Germany       India       Japan       Mexico          USA
--------------  ---------  ----------  -----------  ----------  ----------  -----------  -----------
Latin America   Highcal     7,000,000            0           0           0            0            0
Latin America   Relax       7,000,000            0           0           0            0            0
Europe          Highcal             0   15,000,000           0           0            0            0
Europe          Relax               0    1,000,000           0           0   11,000,000            0
Asia            Highcal             0            0   5,000,000           0            0            0
Asia            Relax               0            0   3,000,000           0            0            0
Japan           Highcal     4,000,000            0   2,000,000   1,000,000            0            0
Japan           Relax               0            0   8,000,000           0            0            0
Mexico          Highcal             0            0           0           0    3,000,000            0
Mexico          Relax               0            0           0           0    3,000,000            0
US              Highcal             0            0           0           0   13,000,000    5,000,000
US              Relax               0            0           0           0            0   17,000,000

The total cost for this plan is USD 1,329,314,000. Germany and US plants are serving their own regions, as shown by high quantities of Relax in the USA column and Highcal in the Germany column. Brazil, Mexico and India are producing more evenly distributed quantities and serving at least two markets. Japan is producing a very small quantity of Highcal for it's own market.

The Japanese factory should have been idled if given the opportunity because it was only producing 1mil units of Highcal for the local supply. The production of 1million units can be shifted to the plant in India, which is already producing units of Highcal for the Japanese market. This allows BioPharma to save on fixed costs, even though it is not the optimal plan. If the Japanese factory were to be idled, only the general plant fixed costs will be incurred and the cost of this new plan will be USD1,325,340,000.

The results from the optimisation corroborates the serious consideration of shutting down the Japanese plant. 

# Looking ahead: Restructuring the Global Supply Network (closing down plants)

## Optimisation under options
In restructuring its global supply network structure, BioPharma has to consider exchange rate fluctuations and the option of shutting down factories simultaneously. The options available to the network design team are:

1. Keep global network with its current structure and capabilities.
2. Limit the capability of some plants to produce only one chemical, where a plant is limited to producing only one chemical 80% of the fixed costs associated with the chemical no longer produced is saved.
3. Close down some plants, where closing down a plant eliminates all variable costs and saves 80% of annual fixed costs.

Assuming that demand in 2010 is stable and will be the same as in 2009, the first line of the new objective function is as follows:

minimise $(0.8B_0+0.2).F_{all,Brazil}+$
$(0.8B_1+0.2).F_{Brazil,Highcal}+\sum_{k=1}^6 Q_{Highcal,Brazil,k}.(V_{Highcal,Brazil}+T_{Brazil,k}).(1 +I_{Brazil,k})$
$+(0.8B_2+0.2).F_{Brazil,Relax}+\sum_{k=1}^6 Q_{Relax,Brazil,k}.(V_{Relax,Brazil}+T_{Brazil,k}).( 1 +I_{Brazil,k})$
$+...$
where 

* $B_0$ is the switch for closing or opening the entire Brazil factory
* $B_1$ is the switch for controlling the fixed costs for Highcal 
* $B_2$ is the switch for controlling the fixed costs for Relax 
* $E_0, E_1, E_2$ are switches for Europe, etc.

under the additional conditions of

* $B_0 \geq B_1$, so that no Highcal is produced when the factory is shut
* $B_0 \geq B_2$, so that no Relax is produced when the factory is shut
* $MB_1 \geq \sum_{k=1}^6 Q_{Highcal,Brazil,k}$, so that no highcal is produced when the facilities are absent.
* $MB_2 \geq \sum_{k=1}^6 Q_{Relax,Brazil,k}$, so that no Relax is produced when the facilities are absent.

## Results


```r
# Get raw demand data
output2 <- read_excel("optim1.xlsx", sheet = "Sheet2") %>% 
            # Set column names as the first two are not present in the Excel
            set_names(c("region", 
                        "chem", 
                        "brazil", 
                        "germany", 
                        "india", 
                        "japan", 
                        "mex", 
                        "us")) %>%
            # Fill in missing values with the value from the previous row for the 
            # region names which are missing
            mutate(region = zoo::na.locf(region))

# Pretty print the output
kable(output2,
      col.names = c("Sale Region", 
                    "Chemical", 
                    "Brazil", 
                    "Germany", 
                    "India", 
                    "Japan", 
                    "Mexico", 
                    "USA"),
      format.args = list(big.mark = ","),
      caption = "Table 2: Optimal Production Output with new Supply Network Design for 2010")
```



Table: Table 2: Optimal Production Output with new Supply Network Design for 2010

Sale Region     Chemical       Brazil      Germany       India   Japan       Mexico          USA
--------------  ---------  ----------  -----------  ----------  ------  -----------  -----------
Latin America   Highcal     7,000,000            0           0       0            0            0
Latin America   Relax       7,000,000            0           0       0            0            0
Europe          Highcal             0   15,000,000           0       0            0            0
Europe          Relax               0            0           0       0    7,000,000    5,000,000
Asia            Highcal             0            0   5,000,000       0            0            0
Asia            Relax               0            0   3,000,000       0            0            0
Japan           Highcal     4,000,000    1,000,000   2,000,000       0            0            0
Japan           Relax               0            0   8,000,000       0            0            0
Mexico          Highcal             0            0           0       0    3,000,000            0
Mexico          Relax               0            0           0       0    3,000,000            0
US              Highcal             0    1,000,000           0       0   17,000,000            0
US              Relax               0            0           0       0            0   17,000,000

The new optimised cost after completely shuting down the Japanese plant, cutting Relax facilities in Germany, and Highcal facilities in US is: USD 1,293,383,000. This may possibly be attributed to the high fixed costs and low capacity of 10 million units incurred by the Japanese plant. Unless the high costs are justified by the plant being a technological leader or being able to bring other external benefits in the long term to BioPharma the Japanese plant can be shut and the production can be transferred to other plants. As a result, the Japanese market's demand for Highcal will be fulfilled by Brazil, Germany and India and the market demand for Relax by India. From Figure 6-18 of the question sheet, it is observed that Japan was already importing chemicals from other plants in 2009 - as its total demand of 15mil units of Highcal and Relax exceeds its capacity of 10mil units. Furthermore, the plant was only producing a meagre 2mil units with full operational costs. 

It is suggested that Germany continue to produce only Highcal in the next year, and an extra million kilograms for Japan and million for US. In addition, the USA will only produce Relax, and export that to Europe whilst replacing US made Relax product wiht Mexican Relax. Brazil, Mexico, India, and the US will operate at full capacity with minor changes in the quantities of the chemicals. 

## Exchange Rates

The costs of doing business from a plant can be significantly lower due to weakened exchange rates. BioPharma as an international business will be greatly affected by these fluctuations and can opt to redistribute production to different plants based on exchange rates. The following analysis is based on the assumption that BioPharma is a US company and is primarily interested in profits in US dollars as opposed to other currencies.

A decision tree is used to assess the risk of these fluctuations and to calculate the expected return of each plant. Assuming that the exchange rates in 2010 can fall or rise to any of the rates from 2004 to 2009 with equal probability, the following decision tree with expected costs is constructed: 

(insert picture of decision tree)

### Analysis

Exchange rates costs are expected to increase significantly at $30mil from Mexico and $12mil from India, and decrease $14mil from Brazil and $12mil from Germany. BioPharma faces a greater problem of rising costs from FX. In response, BioPharma can opt to shift Highcal production to Germany as it is not operating at full capacity. More specifically, Highcal exports to US can be managed by Germany. If necessary and if it becomes more cost effective due to weakening of exchange rates from Europe, Germany could open its Relax production capabilities to serve the European market for Relax. As for Brazil, it exports 1mil kg of Relax to Europe and 3mil kg of Highcal to Japan. Similarly, such productions can be shifted to other plants. 

This situation shows that the German plant's unused capactiy may not be as ineffective. The German plant gives BioPharma the flexibility to cope with unexpected economic environments, while maintaining its technological advancements.

Alternatively, these figures for the expected costs for each plant can be reintroduced into the optimisation problem in order to reestimate the supply chain network. BioPharma can also hedge against exchange rate risks through financial intermediaries.

#Scenario: Expansion Options

## The Optimisation Problem

In considering such options, this changes the optimisation by having: 

1. Additional binary variables of AB ($\textbf{A}$dditional capacity for $\textbf{B}$razil),  $AG$,  $AI$,  $AJ$,  $AM$ and  $AU$ to function as switches to allocate capacities for one factory. 
2. Constraint where additional capacity can only be added to one plant: $AB+AG+AI+AJ+AM+AU
<=1$

## Results


```r
# Get raw demand data
output3 <- read_excel("optim1.xlsx", sheet = "Sheet3") %>% 
            # Set column names as the first two are not present in the Excel
            set_names(c("region", 
                        "chem", 
                        "brazil", 
                        "germany", 
                        "india", 
                        "japan", 
                        "mex", 
                        "us")) %>%
            # Fill in missing values with the value from the previous row for the 
            # region names which are missing
            mutate(region = zoo::na.locf(region))

# Pretty print the output
kable(output3,
      col.names = c("Region", 
                    "Chemical", 
                    "Brazil", 
                    "Germany", 
                    "India", 
                    "Japan", 
                    "Mexico", 
                    "USA"),
      format.args = list(big.mark = ","),
      caption = "Table 3: Optimal Production Output with new Supply Network Design for 2010 with additional capacity")
```



Table: Table 3: Optimal Production Output with new Supply Network Design for 2010 with additional capacity

Region          Chemical       Brazil      Germany       India   Japan       Mexico          USA
--------------  ---------  ----------  -----------  ----------  ------  -----------  -----------
Latin America   Highcal     7,000,000            0           0       0            0            0
Latin America   Relax       7,000,000            0           0       0            0            0
Europe          Highcal             0   15,000,000           0       0            0            0
Europe          Relax       1,000,000            0           0       0   11,000,000            0
Asia            Highcal             0            0   5,000,000       0            0            0
Asia            Relax               0            0   3,000,000       0            0            0
Japan           Highcal     3,000,000    2,000,000   2,000,000       0            0            0
Japan           Relax               0            0   8,000,000       0            0            0
Mexico          Highcal             0            0           0       0    3,000,000            0
Mexico          Relax               0            0           0       0    3,000,000            0
US              Highcal             0            0           0       0   13,000,000    6,000,000
US              Relax               0            0           0       0            0   17,000,000


Seeing that BioPharma is considering expanding one of its plant's capacity by 1mil kilograms at a cost of $3 million a year, they should expand the US plant. With the new capacity, it will produce an extra 1mil kilograms of Highcal for the domestic market, where Mexico will supply 1mil kilogram less to the US market. The total cost for this plan is $1,334,260,000, which is $3million dollars less than the orginal plan of $1,337,340,000. Hence, BioPharma will experience the greatest economies of scale if the money were invested in the US plant. 

Furthermore, seeing that this move reduces Mexico's production load for 2010, BioPharma will be safer from the changing exchange rates. 

# Scenario: A reduction of duties

## Results

Under the assumption that all import tariffs are removed, the new costs for BioPharma will be at USD1,267,200,000, which is more than $50mil less than all the other scenarios above. This further emphasises that import tariffs heavily affects the costs of production and distribution of the chemicals to different regions. 


```r
# Get raw demand data
output4 <- read_excel("optim1.xlsx", sheet = "Sheet4") %>% 
            # Set column names as the first two are not present in the Excel
            set_names(c("region", 
                        "chem", 
                        "brazil", 
                        "germany", 
                        "india", 
                        "japan", 
                        "mex", 
                        "us")) %>%
            # Fill in missing values with the value from the previous row for the 
            # region names which are missing
            mutate(region = zoo::na.locf(region))

# Pretty print the output
kable(output4,
      col.names = c("Region", 
                    "Chemical", 
                    "Brazil", 
                    "Germany", 
                    "India", 
                    "Japan", 
                    "Mexico", 
                    "USA"),
      format.args = list(big.mark = ","),
      caption = "Table 4: Optimal Production Output for 2010 without import tariffs")
```



Table: Table 4: Optimal Production Output for 2010 without import tariffs

Region          Chemical       Brazil      Germany       India   Japan       Mexico          USA
--------------  ---------  ----------  -----------  ----------  ------  -----------  -----------
Latin America   Highcal     7,000,000            0           0       0            0            0
Latin America   Relax       7,000,000            0           0       0            0            0
Europe          Highcal             0   13,000,000           0       0    2,000,000            0
Europe          Relax               0            0   7,000,000       0            0    5,000,000
Asia            Highcal     1,000,000    4,000,000           0       0            0            0
Asia            Relax               0            0   3,000,000       0            0            0
Japan           Highcal             0            0           0       0    7,000,000            0
Japan           Relax               0            0   8,000,000       0            0            0
Mexico          Highcal     3,000,000            0           0       0    3,000,000            0
Mexico          Relax               0            0           0       0            0            0
US              Highcal             0            0           0       0   18,000,000            0
US              Relax               0            0           0       0            0   17,000,000

Without import tariffs, optimal production quantity will depend more heavily on actual costs of production and transportation. We continue to see Germany increasing its production on Highcal only. It is observed that all plants except Brazil specialising in producing one chemical only, and each plant producing for a region outside of its own. Moreover, each country's demand is supplied by fewer plants.

# Not 100% yield


# What other factors to be considered when making your recommendations?

# BS1808 Logistics and Supply Chain Analytics Group Assignment Two
Jone Leung, Somto Okoye, Valentin Poirelle, Jin Anne Lee, Jim Leach, Niccolo Valerio  
18 June 2016  

<br>
<br>
<p style="border:1.5px; border-style:solid; border-color:#000000; padding: 1em;"> This `HTML` report is best viewed using a modern web browser such as Mozilla Firefox or Google Chrome. It is also available on the [online repository](https://github.com/Jim89/lsca_group). Printing is possible but will not produce an optimal reading experience.</p>


```r
# Set default knitr options
knitr::opts_chunk$set(echo = FALSE, message = FALSE, warning = FALSE, fig.align = "center")

# Load packages
```

# Introduction

## Project overview

The overarching goal of this project is to optimise inventory and redesign supply chain network of BioPharma, a chemical company. We use a combination of optimisation, heuristics and decision trees to evaluate improvements in order to make recommendations for the company to cut costs and stay competitive in the global market.

# Wiser on Hindsight: What could have been done in 2009

Question 1: How should BioPharma have used its productive network in 2009? Should any of the plants have been idled? What is the annual cost of your proposal, including import duties?

In 2009, all six of BioPharma's plants are producing both Highcal and Relax; these chemicals can be shipped to any other parts of the world with additional costs attached. Furthermore, BioPharma faces import duties for all foreign goods entering a country, independent from plant origin. Under these conditions, the following optimisation problem is constructed to identify a more efficient use of resources.

## The Optimisation Problem

Decision Variables

* $Q_{i,j,k}$ is the quantity of chemical $i$ to produce from plant $j$ for region $k$
* $F_{all,j}$ is the fixed cost independent of chemical produced for plant $j$
* $F_{i,j}$ is the fixed cost associated to producing chemical $i$ in plant $j$
* $V_{i,j,k}$ is the total variable costs including transportation, import and raw materials associated with producing and shipping chemical $i$ from plant $j$ to region $k$

Objective Function



Constraints

* 

Results


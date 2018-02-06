** Load file**
use "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Combined_Choice_Sets.dta"

**create and tag surveys that need to be dropped**
generate byte drop_survey = 0
label variable drop_survey "Surveys that were incorrectly filled out, 1 = drop 0 = keep"
replace drop_survey = 1 if caseid == "1fd34b90-67d5-459d-8654-d3372aac2703" 
tabulate drop_survey 
drop if drop_survey ==1

**de-string choice**
destring choice, replace

**Check all choice_no and alternatives are correct, should be 327**
tabulate choice_no alt

<<<<<<< HEAD
**Run all variables**
destring choice, replace
clogit choice train_ind train_blend train_grp feedsupp_vgrp feedsupp_one feedsupp_grp tech_phone tech_comp recog_supvr recog_conf recog_cert time_5 time_10 time_15, group(obsid)

=======
** Generate constant terms***
generate asca = 1 if alt ==1 
replace asca=0 if asca==.
>>>>>>> DataCleaning

generate ascb = 1 if alt ==2 
replace ascb=0 if ascb==.

generate ascc = 1 if alt ==3 
replace ascc=0 if ascc==.

<<<<<<< HEAD
**Willingness to pay WTP calculations**
**STEP 1: Create time variable that sets time = 5,10,or 15 depending on the package**
generate int time = 0
label variable time "Willingness to pay amount of time, 5, 10, or 15 hours per week"
replace time = 5 if time_5 ==1
replace time =10 if time_10 ==10
replace time = 15 if time_15 == 15
**taking current situation out of the analysis because no way of showing it as a value, so code as missing**
replace time =. if alt ==3
**Create a table showing time, alt, and choice_no***
table time alt, by (choice_no) contents(freq)

=======
**Create time variable that sets time = 5,10,or 15 depending on the package**
generate int time = 0
label variable time "Willingness to pay amount of time, 5, 10, or 15 hours per week"
replace time = 5 if time_5 ==1
replace time =10 if time_10 ==1
replace time = 15 if time_15 == 1
>>>>>>> DataCleaning

**Create a table showing time, alt, and choice_no***
table time alt, by (choice_no) contents(freq)

**checking alternative specific constant terms**
clogit choice asca ascb train_ind train_blend train_grp feedsupp_vgrp feedsupp_one feedsupp_grp tech_phone tech_comp recog_supvr recog_conf recog_cert time, group(obsid)
test asca = ascb

**multivariate conditional regression analysis**
clogit choice ascc train_ind train_blend train_grp feedsupp_vgrp feedsupp_one feedsupp_grp tech_phone tech_comp recog_supvr recog_conf recog_cert time, group(obsid)

**How much time are participants willing to pay for an incentive (Willingness-to-pay analysis)**

wtp time train_ind train_blend train_grp feedsupp_vgrp feedsupp_grp feedsupp_one tech_phone tech_comp recog_supvr recog_conf recog_cert

**analysis of domiance: respondents that always state the hob with the higher attribute**



**Probability that an incentive will be chosen (Market share prediction)**

**Change in participants' situation fter having implemented the new incentive (Welfare analysis)**

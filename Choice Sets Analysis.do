** Load file**
use "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Combined_Choice_Sets.dta"

**create and tag surveys that need to be dropped**
generate byte drop_survey = 0
label variable drop_survey "Surveys that were incorrectly filled out, 1 = drop 0 = keep"
replace drop_survey = 1 if caseid == "1fd34b90-67d5-459d-8654-d3372aac2703" 
tabulate drop_survey 
drop if drop_survey ==1

**Check all choice_no and alternatives are correct, should be 327**
tabulate choice_no alt

**Run all variables**
clogit choice train_ind train_blend train_grp feedsupp_vgrp feedsupp_one feedsupp_grp tech_phone tech_comp recog_supvr recog_conf recog_cert time_5 time_10 time_15, group(obsid)


**Run all variables based on the characteristics of the individuals**



**Willingness to pay WTP calculations**
**STEP 1: Create time variable that 
generate int time = 0
label variable time "Willingness to pay amount of time, 5, 10, or 15 hours per week"
replace time = 5 if time_5 ==1
replace time =10 if time_10 ==10
replace time = 15 if time_15 == 15

**STEP 2: Calculate WTP variable**
**Make sure that you download wtp by searching for "wtp" and scrolling down to "wtp" and downloading it**
wtp time tech_phone


**Alternative for WTP calculations, the Krinsky method**

wtpcikr time_5
wtpcikr time_10
wtpcikr time_15


**How much time are participants willing to pay for an incentive (Willingness-to-pay analysis)**

**Probability that an incentive will be chosen (Market share prediction)**

**Change in participants' situation fter having implemented the new incentive (Welfare analysis)**

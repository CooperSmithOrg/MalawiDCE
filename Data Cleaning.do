
**append all choice sets together**
use "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_1.dta", clear
append using "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_2.dta", force
append using "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_3.dta", force
append using "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_4.dta", force
append using "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_5.dta", force
append using "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_6.dta", force
append using "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_7.dta", force
append using "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_8.dta", force
append using "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_9.dta", force
append using "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_10.dta", force
append using "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_11.dta", force
append using "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_12.dta", force
append using "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_13.dta", force
append using "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Choice_Set_14.dta", force

**clean data to ensure all data is correct type** 
destring train_ind train_blend train_grp feedsupp_vgrp feedsupp_one feedsupp_grp tech_phone tech_comp recog_supvr recog_conf recog_cert time_5 time_10 time_15, replace
destring choice_no, replace
recast int choice_no

destring alt, replace
recast int alt

**check to see all correct number of observations are in the data set **
tabulate choice_no alt

*label variables**
rename vgrp feedsupp_vgrp
label variable caseid "Individual ID for each survey participant"
label variable obsid "Obersvation ID for each choice set"
label variable choice "Alternative chosen"
label variable choice_no "Choice Set Number"
label variable alt "Alternative number: 1 = package 1, 2 = package 2, 3 = current situation"
label variable train_ind "Training: Independent Learning"
label variable train_blend "Training: Blended Learning"
label variable train_grp "Training: Group Learning"
label variable feedsupp_vgrp "Feedback & Support: Virtual Group"
label variable feedsupp_grp "Feedback & Support: Peer Group"
label variable feedsupp_one "Feedback & Support: One-on-One"
label variable tech_phone "Technology: Mobile Phone Application"
label variable tech_comp "Technology: Faciltiy Computer"
label variable recog_supvr "Recognition: Present to Supervisor"
label variable recog_conf "Recognition: Present at National Conference"
label variable recog_cert "Recognition: Certificate in Data Management"
label variable time_10 "Leisure Time: 10 hours/week"
label variable time_15 "Leisure Time: 15 hours/week"
label variable time_5 "Leisure Time: 5 hours/week"

** Save version of the file**
save "/Users/andreafletcher/Dropbox/Cooper Smith Team Folder/Projects/Kuunika/Kuunika - Project Activities/Discrete Choice Experiments (DCE)/DATA Exports for Analysis/Stata Data Files/Clean_Choice_Sets.dta"



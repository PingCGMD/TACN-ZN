#!/bin/bash
      

#        echo 17 | gmx clustsize -f dynamic_all3.xtc -s dynamic.tpr -mc maxclust.xvg -nc nclust.xvg -cut 0.6 -n system.ndx -pbc 

#       echo 17 17 | gmx trjconv -f dynamic_all3.xtc -s dynamic.tpr -n system.ndx -o traj_A.gro -tu us -b 6.5 -e 8.0 -pbc cluster  

#       echo 17 | gmx convert-tpr -s dynamic.tpr -n system.ndx -o traj_A.tpr

# 	echo 17 | gmx gyrate -f traj_A.gro -s traj_A.tpr -o gyrate.xvg -n system.ndx

        echo 17 | gmx gyrate -f traj_A.gro -s traj_A.tpr -o gyrate-a.xvg -n system.ndx -nmol 72

#        echo 7 |  gmx polystat -f dynamic.xtc -s dynamic.tpr -n ../system.ndx -tu us -b 2 -e 7

#        gmx sasa -f traj_A.gro -s traj_A.tpr -n system.ndx -o SAS_all.xvg -or RES_SAS_all.xvg -pbc -surface 'group 17' -output 'group 19'  -ndots 25 -probe 0.26 -oa

#         gmx distance -f traj_A.gro -s traj_A.tpr -n system.ndx -oall Ree_all.xvg -oav Ree_av.xvg -select 'group 20' -pbc -tu us -b 6.5 -e 8.0


	

#!/bin/bash
      

#       echo 23 | gmx clustsize -f dynamic.xtc -s dynamic.tpr -mc maxclust.xvg -nc nclust.xvg -cut 0.6 -n system.ndx -pbc 

#        echo 23 23 | gmx trjconv -f dynamic.xtc -s dynamic.tpr -n system.ndx -o traj_A.gro -tu us -b 4.0 -e 7.0 -pbc cluster  

#	echo 23 | gmx convert-tpr -s dynamic.tpr -n system.ndx -o traj_A.tpr

#	echo 23 | gmx gyrate -f traj_A.gro -s traj_A.tpr -o gyrate.xvg -n system.ndx 

        echo 23 | gmx gyrate -f traj_A.gro -s traj_A.tpr -o gyrate-a.xvg -n system.ndx -nmol 72

#        echo 7 |  gmx polystat -f dynamic.xtc -s dynamic.tpr -n ../system.ndx -tu us -b 2 -e 7

#         gmx sasa -f traj_A.gro -s traj_A.tpr -n system.ndx -o SAS_all.xvg -or RES_SAS_all.xvg -pbc -surface 'group 23' -output 'group 20' 'group 25'  -ndots 25 -probe 0.26 -oa

#	 gmx distance -f traj_A.gro -s traj_A.tpr -n system.ndx -oall Ree_all.xvg -oav Ree_av.xvg -select 'group 26' -pbc -tu us -b 4.0 -e 7.0


	

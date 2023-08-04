gmx mindist -f dynamic.xtc -s dynamic.tpr -n system.ndx -d 0.5 -on TACN_HPNPP_num.xvg -od TACN_HNPP_mindist.xvg -group -pbc

gmx clustsize -f dynamic.xtc -s dynamic.tpr -mc maxclust.xvg -nc nclust.xvg -cut 0.6 -n system.ndx


gmx clustsize -f dynamic.xtc -s dynamic.tpr -mc maxclust-TACN.xvg -nc nclust-TACN.xvg -cut 0.6 -n system.ndx

gmx trjconv -f dynamic.xtc -s dynamic.tpr -n system.ndx -o traj_A.gro -tu us -b 5.0 -e 7.0 -pbc cluster

gmx gyrate -f traj_A.gro -s traj_A.tpr -o gyrate.xvg -n system.ndx

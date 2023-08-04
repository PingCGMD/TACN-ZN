gmx editconf -f NPCF_intial.gro -o newbox.gro -center 7 7 7 -box 14 14 28

gmx solvate -cp newbox.gro -cs water.gro -o solv.gro -p system.top -radius 0.21

gmx grompp -f ions.mdp -c solv.gro -p system.top -o ions.tpr

gmx genion -s ions.tpr -o solv_ions.gro -p system.top -pname NA -nname CL -neutr
al -conc 0.15

gmx grompp -f minimization.mdp -c solv_ions.gro -p system.top -o em.tpr

gmx mdrun -v -deffnm em

gmx make_ndx -f em.gro -o system.ndx

gmx grompp -f equilibration.mdp -c em.gro -p system.top -r em.gro -o npt.tpr -n system.ndx

gmx mdrun -deffnm npt -v

gmx wham -it tpr-files.dat -if pullf-files.dat -o -hist -unit kCal -bins 200 -min 2 -max 8 -nBootstrap 50 -zprof0 0.0

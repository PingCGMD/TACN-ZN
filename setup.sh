gmx editconf -f TACNZN_ini.gro -bt cubic -d 1 -o TACNZN_inbox.gro

gmx insert-molecules -f TACNZN_inbox.gro -ci TACNZN_ini.gro -o system0.gro -nmol 71 -box 49 49 49

gmx editconf -f system0.gro -o system_temp.gro -d 1.0 -bt cubic -box 49.26 49.26 49.26

#minim in vacuum
gmx grompp -f minimization-vac.mdp -c system_temp.gro -p system.top  -o minimization-vac.tpr

gmx mdrun -deffnm minimization-vac -v

#add water
gmx solvate -cp minimization-vac.gro -cs water.gro -radius 0.21 -o system_W.gro

#add Ions
gmx grompp -f ions.mdp -c system_W.gro -p system.top -o ions.tpr

gmx genion -s ions.tpr  -p system.top  -neutral -conc 0.15 -pname NA -nname CL  -o system_WI.gro

#Minim
gmx grompp -f minimization.mdp -c system_WI.gro -p system.top  -o minimization.tpr
gmx mdrun -deffnm minimization -v

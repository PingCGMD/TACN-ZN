gmx editconf -f HPNPP.gro -bt cubic -d 1 -o HPNPP_inbox.gro

gmx insert-molecules -f HPNPP_inbox.gro -ci HPNPP.gro -o HPNPP72.gro -nmol 71 -box 28 28 28

gmx editconf -f HPNPP72.gro -o system_temp.gro -d 1.0 -bt cubic -box 28.8 28.8 28.8    

gmx grompp -f minimization-vac.mdp -c system_temp.gro -p system.top  -o HPNPP_minim.tpr

gmx mdrun -deffnm HPNPP_minim -v

#polyply gen_coords  -p system.top -o system_temp.gro -name TACNZN_HPNPP -box 28.8 28.8 28.8   

gmx insert-molecules -f HPNPP_minim.gro  -ci TACNZN_ini.gro -o system0.gro -nmol 72

#minim in vacuum
gmx grompp -f minimization-vac.mdp -c system0.gro -p system.top  -o minimization-vac.tpr

gmx mdrun -deffnm minimization-vac -v

#add water
gmx solvate -cp minimization-vac.gro -cs water.gro -radius 0.21 -o system_W.gro -p system.top

#add Ions
gmx grompp -f ions.mdp -c system_W.gro -p system.top -o ions.tpr

gmx genion -s ions.tpr  -p system.top  -neutral -conc 0.15 -pname NA -nname CL  -o system_WI.gro

#Minim
gmx grompp -f minimization.mdp -c system_WI.gro -p system.top  -o minimization.tpr
gmx mdrun -deffnm minimization -v

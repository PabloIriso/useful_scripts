
DIR="/home/pablo/Escritorio/MolecularDocking/VirtualScreening/Dockings"
shopt -s extglob

cd "$DIR" || exit
protein="$DIR/S1S2_02_c.pdbqt"

for ligand in !(S1S2_02_c.pdbqt); do
    echo $ligand
    mkdir -p "/home/pablo/Escritorio/MolecularDocking/Results/${ligand%3D*}"
    vina --receptor $protein --ligand $ligand --center_x 4.749 --center_y -11.371 --center_z -45.264 --size_x 54 --size_y 48 --size_z 42 --out vina_out_${ligand%3D*}.pdbqt --log log_${ligand%3D*}.txt --exhaustiveness 200
    mv $DIR/vina_out_${ligand%3D*}.pdbqt /home/pablo/Escritorio/MolecularDocking/Results/${ligand%3D*}
    mv $DIR/log_${ligand%3D*}.txt /home/pablo/Escritorio/MolecularDocking/Results/${ligand%3D*}
done;

    #echo mkdir -p "/home/pablo/Escritorio/MolecularDocking/Results/${ligand%3D*}"
    #echo mkdir -p "log${ligand%3D*}.txt"

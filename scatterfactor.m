function [scatterfactors] = scatterfactor(svec, crystaltype, atoms)
%This function calculates the scattering factor of individual atoms in hkl
%planes based on their respective Z,a, and b values. The output of this
%fucntion is a matrix organized row-wise for s-values (input argument) and
%column-wise by atom entered. 


%Return a cell array that holds the atom title, atomic number, and then 
%scattering parameters. The output is organizaed as;
% {'Abbreviation',Z,a1,b1,a2,b2,a3,b3,a4,b4}

if crystaltype == 1 || crystaltype == 2 || crystaltype ==  4 || crystaltype ==6 || crystaltype==7
    numatoms=1;
end

if crystaltype == 3 || crystaltype == 5
    numatoms=2;
end

scatterdata=importdata('Scatteringdata.xlsx');

for i=1:length(atoms)
    
    row=1;
    while strcmp(scatterdata.textdata(row),atoms(i))==0
        row=row+1;
    end

    atoms{i,2}=scatterdata.data(row,1);
    atoms{i,3}=scatterdata.data(row,2);
    atoms{i,4}=scatterdata.data(row,3);
    atoms{i,5}=scatterdata.data(row,4);
    atoms{i,6}=scatterdata.data(row,5);
    atoms{i,7}=scatterdata.data(row,6);
    atoms{i,8}=scatterdata.data(row,7);
    atoms{i,9}=scatterdata.data(row,8);
    atoms{i,10}=scatterdata.data(row,9);
end


%% 
%Calculate the scattering factor for each atom AND in each plane. Output
%vector will be in the form of rows organized by hkl reflection planes, and
%columns ordered by atoms scattering factor in that respective plane. Atoms
%are ordered by how they are entered. 
scatterfactors=[];

for plane=1:length(svec)

    atomfactors=[];
        for i=1:numatoms
    
            sctrfctr=scatterfactorcalc(atoms{i,2},svec(plane),atoms{i,3},atoms{i,4},atoms{i,5},...
                atoms{i,6},atoms{i,7},atoms{i,8},atoms{i,9},atoms{i,10});


            atomfactors=[atomfactors,sctrfctr];
        end
    scatterfactors=[scatterfactors;atomfactors];
end

end


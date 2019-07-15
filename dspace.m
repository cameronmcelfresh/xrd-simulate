function [ dspacing ] = dspace(hklvec,crystaltype, lattice_spacing)
%This function calculates the dspacing of an FCC or BCC crystal given
%the lattice parameter and hkl values. Input is given as 
%dspace(latticeparameter,h,k,l). Units in Angstroms

dspacing=zeros(1,6);

if crystaltype==7
    
    lattice_parametera=lattice_spacing(1); 
    lattice_parameterc=lattice_spacing(2);
    
     for i=1:6
        dspacing(i)=...
            ((4/3)*((hklvec{i}(1)^2 + hklvec{i}(1)*hklvec{i}(2) + hklvec{i}(2)^2)/lattice_parametera^2)+...
            hklvec{i}(3)^2/lattice_parameterc^2)^-0.5;
    end

else
    lattice_parameter=lattice_spacing;

    for i=1:6
        dspacing(i)=(lattice_parameter/(sqrt((hklvec{i}(1)^2)+(hklvec{i}(2)^2)+(hklvec{i}(3)^2))));
    end
end

end


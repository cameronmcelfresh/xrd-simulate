%% Theoretical Peak Intensity Calcuclator
% This program takes user input about a specific crystal structure and
% determines the peak positions and relative intensities. Based on theory
% that can be found in Structure of Materials: An Introduction to
% Crystallography, Diffraction, and Symmetry by Marc De Gaef and Michael E.
% McHenry
%% 

%Extract the necessary simulation parameters from the user
[crystaltype,hklvec,lambda,atoms,lattice_spacing] = dialogue();

%Calcualte the d spacing of individual crystal planes. 
dspacevec=dspace(hklvec,crystaltype,lattice_spacing);

%Calcualte the theta and s values at different hkl peaks. 
[thetavec,svec]=theta_s_calc(lambda,dspacevec);

%Calculate the scattering factor for each atom involved. 
scatterfactorvec=scatterfactor(svec, crystaltype, atoms);

%Calculate the strucutre factor for each plane. 
structurefactors=structurefactor(scatterfactorvec,crystaltype);

%Calculate absolute intensity
intensityvec=intensitycalc(structurefactors,crystaltype,thetavec);

%Compare Absolute and Relative Intensities 
compareintensity(intensityvec,hklvec,thetavec,crystaltype,atoms,lattice_spacing)

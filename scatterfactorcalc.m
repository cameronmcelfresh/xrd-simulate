function [scatteringfactor] = scatterfactorcalc(Z,s,a1,b1,a2,b2,a3,b3,a4,b4)
%This function calcualtes the scattering factor of an atom given the Z
%value (atomic number), s value, and corresponding a(i) and b(i) values.
%Input is given as scaterfactor(Z,s,a1,b1,a2,b2,a3,b3)

scatteringfactor=Z-41.78214*(s^2)*[a1*exp(-b1*s^2)+a2*exp(-b2*s^2)+...
    a3*exp(-b3*s^2)+a4*exp(-b4*s^2)];

end


function [ lorentzfactor ] = lorentz(theta)
%This function uses a theta value to calculate the lorentz polarization
%factor

lorentzfactor= (1+cosd(2*theta)^2)/((sind(theta)^2)*cosd(theta));

end


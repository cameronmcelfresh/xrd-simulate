function [ intensityvec ] = intensitycalc(structurevec,crystaltype,thetavec)
%This function calculates intensity based on strucuture factor, Lorentz
%polarization factor, and multiplicity. 

%Create multiplicity values
m=zeros(6,1);
switch crystaltype 
    case 1 %BCC
        m(1)=12;
        m(2)=6;
        m(3)=24;
        m(4)=12;
        m(5)=24;
        m(6)=8;
        
    case 2 %FCC 
        m(1)=8;
        m(2)=6;
        m(3)=12;
        m(4)=24;
        m(5)=8;
        m(6)=6;
        
    case 3 %Rock Salt    
        m(1)=8;
        m(2)=6;
        m(3)=12;
        m(4)=24;
        m(5)=8;
        m(6)=6;
    
    case 4 %Simple Cubic    
        m(1)=6;
        m(2)=12;
        m(3)=8;
        m(4)=6;
        m(5)=24;
        m(6)=24;
    
    case 5 %CsCl aka Diatomic BCC     
        m(1)=6;
        m(2)=12;
        m(3)=8;
        m(4)=6;
        m(5)=24;
        m(6)=24;
    
    case 6 %Diamond   
        m(1)=8;
        m(2)=12;
        m(3)=24;
        m(4)=6;
        m(5)=24;
        m(6)=24;
    
    case 7 %HCP
        m(1)=3;
        m(2)=4;
        m(3)=6;
        m(4)=5.5;
        m(5)=2.5;
        m(6)=5.25;
       
end

%Create Lorentz Polarization values
lf=zeros(6,1);

for i=1:6 
    lf(i)=lorentz(thetavec(i));
end

%Create final vector of intensities
intensityvec=zeros(6,1);
for i=1:6
    intensityvec(i)=(structurevec(i)^2)*m(i)*lf(i);     
end

end


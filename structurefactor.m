function [structurevec] = structurefactor(scattervec,crystaltype)
%This function calculates the structure factor given the scattering factors
%of the atoms present. 

structurevec=zeros(6,1);

switch crystaltype
    
    case 1 %BCC     
        structurevec(1)=2*sum(scattervec(1,:));
        structurevec(2)=2*sum(scattervec(2,:));
        structurevec(3)=2*sum(scattervec(3,:));
        structurevec(4)=2*sum(scattervec(4,:));
        structurevec(5)=2*sum(scattervec(5,:));
        structurevec(6)=2*sum(scattervec(6,:));
        
    case 2 %FCC
        structurevec(1)=4*sum(scattervec(1,:));
        structurevec(2)=4*sum(scattervec(2,:));
        structurevec(3)=4*sum(scattervec(3,:));
        structurevec(4)=4*sum(scattervec(4,:));
        structurevec(5)=4*sum(scattervec(5,:));
        structurevec(6)=4*sum(scattervec(6,:));    
        
    case 3 %Rock Salt
        structurevec(1)=4*(scattervec(1,1)-scattervec(1,2));
        structurevec(2)=4*(scattervec(2,1)+scattervec(2,2));
        structurevec(3)=4*(scattervec(3,1)+scattervec(3,2));
        structurevec(4)=4*(scattervec(4,1)-scattervec(4,2));
        structurevec(5)=4*(scattervec(5,1)+scattervec(5,2));
        structurevec(6)=4*(scattervec(6,1)-scattervec(6,2));

    case 4 %Simple Cubic    
        structurevec(1)=sum(scattervec(1,:));
        structurevec(2)=sum(scattervec(2,:));
        structurevec(3)=sum(scattervec(3,:));
        structurevec(4)=sum(scattervec(4,:));
        structurevec(5)=sum(scattervec(5,:));
        structurevec(6)=sum(scattervec(6,:));      

               
    case 5 %CsCl structure aka Diatomic BCC     
        structurevec(1)=(scattervec(1,1)-scattervec(1,2));
        structurevec(2)=(scattervec(2,1)+scattervec(2,2));
        structurevec(3)=(scattervec(3,1)+scattervec(3,2));
        structurevec(4)=(scattervec(4,1)-scattervec(4,2));
        structurevec(5)=(scattervec(5,1)+scattervec(5,2));
        structurevec(6)=(scattervec(6,1)-scattervec(6,2));

    case 6%Diamond 
        structurevec(1)=(32^0.5)*sum(scattervec(1,:));
        structurevec(2)=8*sum(scattervec(2,:));
        structurevec(3)=(32^0.5)*sum(scattervec(3,:));
        structurevec(4)=8*sum(scattervec(4,:));
        structurevec(5)=(32^0.5)*sum(scattervec(5,:));
        structurevec(6)=8*sum(scattervec(6,:));  
    
    case 7 %HCP   
        structurevec(1)=(scattervec(1,1));
        structurevec(2)=(scattervec(2,1));
        structurevec(3)=(3^0.5)*(scattervec(3,1));
        structurevec(4)=(scattervec(4,1));
        structurevec(5)=2*(scattervec(5,1));
        structurevec(6)=(3^0.5)*(scattervec(6,1));

end



function [ thetavec,svalvec ] = theta_s_calc(lambda,dspacing)
%This function recieves a lambda and d spacing and returns a theta of
%reflection and an s value. 
thetavec=zeros(1,6);
svalvec=zeros(1,6);

for i=1:6
    
    thetavec(i) = asind(lambda/(2*dspacing(i)));

    svalvec(i)=(1/(2*dspacing(i)));

end
end


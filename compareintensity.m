function compareintensity(intensityvec,hklvec,thetavec,crystaltype,atoms,lattice_spacing)
%This function recieves the intensity data and outputs a formatted result. 

relintensity=intensityvec/max(intensityvec);

switch crystaltype
    case 1
        type='BCC';
    case 2 
        type='FCC';
    case 3
        type='Rock Salt';
    case 4
        type='Simple Cubic';
    case 5
        type='CsCl/Diatomic BCC';        
    case 6
        type='Diamond';
    case 7
        type='Hexagonal Close Packed';
end

fprintf('\n')
fprintf('----------------------------------\n----------------------------------\n')
fprintf('Crystal Type: %s\n',type)
fprintf('Element(s): ')

for i=1:length(atoms)
   fprintf('%s ', atoms{i})
end

fprintf('\n')

if length(lattice_spacing)==1
    fprintf('Lattice Parameter: %3.3f A\n',lattice_spacing)
end

if length(lattice_spacing)==2
    fprintf('Lattice Parameter (a): %3.3f A\n',lattice_spacing(1))
    fprintf('Lattice Parameter (c): %3.3f A\n',lattice_spacing(2))
end

fprintf('2 Theta    (hkl)   Relative Intensity')

for i=1:6
    fprintf('\n  %-6.2f    %i%i%i     %0.2f',thetavec(i)*2,hklvec{i}(1),hklvec{i}(2),hklvec{i}(3))
    fprintf('%f ',relintensity(i))   
end

fprintf('\n---------------------------------- \n----------------------------------')
fprintf('\n')


%Plot the values with 2 Theta vs. Relativy Intensity
%Plot curvature/FWHM is arbitrarily set - can be removed or set to a straight line
figure
for i=1:6
    c=0.25;
    xval=linspace(thetavec(i)*2-5,thetavec(i)*2+5,100);
    yval=relintensity(i)*exp(-((xval-thetavec(i)*2).^2)/(2*c^2));    
    plot(xval,yval,'k')
    hold on   
end
xlabel('2\Theta')
ylabel('Relative Intensity')
axis([0 thetavec(end)*2+5 0 1.1])

%Add annotations
for i = 1:length(hklvec)
    ann_string = string(hklvec{i}(1)) + string(hklvec{i}(2)) + string(hklvec{i}(3));
    text(thetavec(i)*2, relintensity(i)+0.02, ann_string, 'HorizontalAlignment', 'center');
end


end


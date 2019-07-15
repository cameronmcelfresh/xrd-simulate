function [crystaltype,hklvec,lambda,atoms,lattice_spacing] = dialogue()
%   DIALOGUE Function to communicate with the user to gather values
%   The dialogue function will capture all of the required user input such
%   as crystal structure type, types of atoms present, and lattice
%   parameter(s)

%% Extract X-Ray Source data

%Define x-ray sources
xraytypes = {'Cu K alpha','Co K alpha', 'Mo K alpha', 'Cr K alpha', 'Fe K alpha'};
xray_index = listdlg('ListString', xraytypes, 'SelectionMode', 'single', ...
    'PromptString', 'Select a X-Ray Source',...
    'Name', 'X-Ray Souce');

switch xray_index %In Angstroms
    case 1
        lambda=1.54;
    case 2
        lambda=1.79;
    case 3
        lambda=0.71;
    case 4
        lambda=2.29;
    case 5
        lambda=1.94;
end

%% Extract crystal type data

%Define crystal types
crystaltypes={'BCC','FCC','Rock Salt','Simple Cubic',...
    'CsCl/BCC Diatomic  A(0,0,0) B(0,0.5,0)',...
    'Diamond','Hexagonal Close Packed'};

%Prompt user to select the crystal type
crystaltype = listdlg('ListString', crystaltypes, 'SelectionMode', 'single', ...
    'PromptString', 'Select a crystal Type',...
    'Name', 'Crystal Type');

switch crystaltype
    case 1 %BCC         
        hklvec={[1,1,0],[2,0,0],[2,1,1],[2,2,0],[3,1,0],[2,2,2]};                
    case 2 %FCC 
        hklvec={[1,1,1],[2,0,0],[2,2,0],[3,1,1],[2,2,2],[4,0,0]};   
    case 3 %Rock Salt aka Diatomic FCC       
        hklvec={[1,1,1],[2,0,0],[2,2,0],[3,1,1],[2,2,2],[4,0,0]};
    case 4 %Simple Cubic
        hklvec={[1,0,0],[1,1,0],[1,1,1],[2,0,0],[2,1,0],[2,1,1]};            
    case 5 %Diatomic BCC aka CsCl
        hklvec={[1,0,0],[1,1,0],[1,1,1],[2,0,0],[2,1,0],[2,1,1]};      
    case 6 %Diamond         
        hklvec={[1,1,1],[2,2,0],[3,1,1],[4,0,0],[3,3,1],[4,2,2]}; 
    case 7 %Hexagonal
        hklvec={[1,0,0],[0,0,2],[1,0,1],[1,0,2],[1,1,0],[1,0,3]};     
end        

%% Extract element name data

elementdata = importdata('Scatteringdata.xlsx');
elements = elementdata.textdata;

atoms =[];
if crystaltype == 1 || crystaltype == 2 || crystaltype ==  4 || crystaltype ==6 || crystaltype==7

    atom_index = listdlg('ListString', elements, 'SelectionMode', 'single',...
        'PromptString', 'Select atom type',...
        'Name', 'Elements');   
    atoms = (elements(atom_index));
end


if crystaltype == 3 || crystaltype == 5
    
    atom_index = [];
    
    [~,sizeVal] = size(atom_index);
    
    %Continue selection until 2 atom types are selected
    while sizeVal ~= 2
    
        atom_index = listdlg('ListString', elements, 'SelectionMode', 'multiple',...
            'PromptString', 'Select the two atom types',...
            'Name', 'Elements'); 
        
        [~,sizeVal] = size(atom_index);

    end
    
    atoms = [elements(atom_index(1)); elements(atom_index(2))];   
end

%% Retrieve the lattice spacing

lattice_spacing = [];

if crystaltype == 7
    a = nan;
    c = nan;
    
    while not(not(isnan(str2double(a))) && not(isnan(str2double(c))))
       
        inputs = {'Enter the ''a'' lattice parameter (Angstroms)','Enter the ''c'' lattice parameter (Angstroms)'};
        
        spacing_vals = inputdlg(inputs, 'Lattice Spacing',[1 45], {'0.00','0.00'});
        
        a = spacing_vals{1};
        c = spacing_vals{2};
        
    end
    
    lattice_spacing = [str2double(a);str2double(c)];
    
else
    a = nan;
    
    while isnan(str2double(a))
       a = inputdlg('Enter the lattice parameter (Angstroms)', 'Lattice Spacing',1,{'0.00'});
    end
    
    lattice_spacing = [str2double(a)];
    
end


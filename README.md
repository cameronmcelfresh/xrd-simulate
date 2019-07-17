# xrd-simulate
MATLAB Code to Simulate Basic XRD Patterns

## Getting Started
This collection of MATLAB scripts is designed to simulate XRD patterns using the basic theory x-ray interaction with atoms in a bulk material. The calculations are based off of information that can be found in Structure of Materials: An Introduction to Crystallography, Diffraction, and Symmetry by Marc De Gaef and Michael E. McHenry. 

If the user is unfamiliar with the basics mathematics behind XRD diffraction a brief math section is provided below. If the user is unfamiliar with crystallography the McHenry text or another basic text is strongly suggested. 

## Installing
The script **XRD_Intensity_Simulation.m** controls the entirity of the simulation. To begin the program simply run this script with the following functions and files in the same directory:
- dialogue.m
- dspace.m
- theta_s_calc.m
- scatterfactor.m
- scatterfactorcalc.m
- Scatteringdata.xlsx
- structurefactor.m
- intensitycalc.m
- lorentz.m
- compareintensity.m

## Simulating XRD Patterns
In its current form, this script is designed to simulate a substance's XRD pattern the user-defined parameters:
1. Type of X-Ray source (Cu, Co, Mo, Cr, Fe)
2. Crystal Structure (BCC, FCC, SC, CsCl, HCP, Diamond)
3. Elemental Components
4. Lattice Spacing

The curvature of the XRD peaks plotted are provided for visualization's sake and do not represent expected FWHM. Modifying the compareintesity.m code can easily configure the plotting characteristics. Likewise, mixtures of components can be achieved by using rule of mixtures for the atomic scattering factors of various components - though caution should be taken at the validity of the results.

#### Input
No parameters need to be pre-defined unless the user requires a rule of mixtures component. In this case, the user should edit Scatteringdata.xlsx and add the desired component to the end of the sheet.

To operate the program, use the following procedure:
1. Run XRD_Intensity_Simulation.m
2. Select X-Ray source
<img src="https://github.com/cameronmcelfresh/xrd-simulate/blob/master/xrd_1.JPG" width="100">

3. Select a crystal type
<img src="https://github.com/cameronmcelfresh/xrd-simulate/blob/master/xrd_2.JPG" width="100">

4. Select atom type
<img src="https://github.com/cameronmcelfresh/xrd-simulate/blob/master/xrd_3.JPG" width="100">

5. Enter the lattice parameter (angstroms)
<img src="https://github.com/cameronmcelfresh/xrd-simulate/blob/master/xrd_4.JPG" width="100">


#### Output
Following the input of the above information (Source: Cu K Alpha, Crystal: BCC, Atom: W, Lattice Parameter: 3.165), the program will output:

<img src="https://github.com/cameronmcelfresh/xrd-simulate/blob/master/xrd_out1.JPG" width="300">

<img src="https://github.com/cameronmcelfresh/xrd-simulate/blob/master/xrd_out2.JPG" width="200">

Basic results can be confirmed using crystallographic databases such as ICSD (https://www.fiz-karlsruhe.de/en/produkte-und-dienstleistungen/inorganic-crystal-structure-database-icsd)

An experimentally-generated XRD spectrum from analysis of a W specimen is shown below.

<img src="https://github.com/cameronmcelfresh/xrd-simulate/blob/master/xrd_compare.JPG" width="200">


## Just a little bit of background math

<img src="https://github.com/cameronmcelfresh/xrd-simulate/blob/master/xrd_readme1.JPG" width="750">

<img src="https://github.com/cameronmcelfresh/xrd-simulate/blob/master/xrd_readme2.JPG" width="750">
  

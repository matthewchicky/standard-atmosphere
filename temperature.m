function [ T ] = temperature( Z )
%% Function Description & Creation Info
%   This function calculates the atmospheric temperature in Kelvin given geometric height (altitude). 
%   Calculation is based on the U.S. Standard Atmosphere, specifically equation 23 on page 10.
%   It is valid in the geopotential height range of 0 km' to 11 km'.

%   U.S. Standard Atmosphere, 1976:
%   <https://ntrs.nasa.gov/archive/nasa/casi.ntrs.nasa.gov/19770009539.pdf>

%   Geopotential to Geometric Altitude Conversion:
%   <http://www.pdas.com/geopot.pdf>

%   Created by:     Matthew Chicky
%   Last Modified:  1/22/17, 18:56:38 EST

%% Variable Description
%   Z:      geometric height above mean sea level, in km
%   T0:     sea-level temperature, in K
%   L0:     molecular-scale temperature gradient for prescribed
%           atmospheric layer, in K/km'
%   H0:     reference geopotential height for prescribed atmospheric
%           layer, in km'
%   H:      geopotential height at given atmospheric pressure, in km'
%   r0:     effective radius of earth, in km
%   T:      local atmospheric temperature, in K

%% Variable Declaration
T0 = 288.15;            % K
L0 = -6.5;              % K/km'
H0 = 0;                 % km'
r0 = 6356.766;          % km

%% Compute Geopotential Height & Temperature
H = r0.*Z ./ (r0 + Z);                                            % km'
T = T0 + L0.*(H - H0);                                           % K

end

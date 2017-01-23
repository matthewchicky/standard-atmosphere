function [ Z ] = elevation( p )
%% Function Description & Creation Info
%   This function calculates the geometric height (altitude) in kilometers given local
%   atmospheric pressure, in Pascals. The formulation is based on the U.S. Standard 
%   Atmosphere, 1976. The function is limited to atmospheric pressures between 
%   101325.0 Pa and 22632.41 Pa, corresponding to a geopotential altitude
%   range of 0 km' to 11 km'.

%   U.S. Standard Atmosphere, 1976:
%   <https://ntrs.nasa.gov/archive/nasa/casi.ntrs.nasa.gov/19770009539.pdf>

%   Geopotential to Geometric Altitude Conversion:
%   <http://www.pdas.com/geopot.pdf>

%   Created by:     Matthew Chicky
%   Last Modified:  1/22/17, 18:52:17 EST

%% Variable Description
%   p:          local atmospheric pressure, in Pa
%   p0:         sea-level pressure, in Pa
%   T0:         sea-level temperature, in K
%   M0:         sea-level, mean molecular weight of air, in kg/kmol
%   g0_prime:   dimensional constant relating geopotential meter to
%               geometric height (elevation), in m^2/(s^2*m'), where m' is
%               the yardstick for one geopotential meter
%   R:          universal gas constant, in kJ/(kmol*K)
%   L0:         molecular-scale temperature gradient for prescribed
%               atmospheric layer, in K/km'
%   H0:         reference geopotential height for prescribed atmospheric
%               layer, in km'
%   H:          geopotential height at given atmospheric pressure, in km'
%   r0:         effective radius of earth, in km
%   Z:          geometric height above mean sea level, in km

%% Variable Declaration
p0 = 101325;            % Pa
T0 = 288.15;            % K
M0 = 28.9644;           % kg/kmol
g0_prime = 9.80655;     % m^2/(s^2*m')
R = 8.31432;            % kJ/(kmol*K)
L0 = -6.5;              % K/km'
H0 = 0;                 % km'
r0 = 6356.766;          % km

%% Compute Geopotential Height & Geometric Elevation
H = T0 / ( L0 * (p/p0)^(R*L0/(g0_prime*M0)) ) - T0/L0 + H0;     % km'
Z = r0*H / (r0 - H);                                            % km

end


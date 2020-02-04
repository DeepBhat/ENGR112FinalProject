function [color] = readColorProjectSmall(mycolor)
%Returns a string by detecting color values in RGB mode. This function
%contains personalized values for all colors, so it works under very
%specific conditions for the ADS project.

result = readColorRGB(mycolor); %RGB values are read, and stored in this array, in this order:
R = result(1);
G = result(2);
B = result(3);
intensity = readLightIntensity(mycolor,'reflected');

if ((R>=50 && R<=115) && (G>=45 && G<=115) && (B>=22 && B<=75)) %white color for this range
    color = "white";
elseif ((R>=30 && R<=50) && (G>=31 && G<=50) && (B>=13 && B<=38))
    color = "HDPE";
elseif ((R>=29 && R<=50) && (G>=2 && G<=15) && (B>=1 && B<=9)) %red color for this range
    color = "red";
elseif ((R>=18 && R<=30) && (G>=15 && G<=50) && (B>=5 && B<=20)) %green color for this range
    color = "green";
elseif ((R>=10 && R<=26) && (G>=6 && G<=18) && (B>=7 && B<=25)) %blue color for this range
    color = "blue";
%elseif ((R>=28 && R<=45) && (G>=20 && G<=40) && (B>=9 && B<=18)) %silver color for this range
 %   color = "silver";
elseif ((R>=40 && R<=70) && (G>=25 && G<=50) && (B>=5 && B<=25)) %yellow color for this range
    color = "yellow";
elseif ((R>=21 && R<=38) && (G>=10 && G<=18) && (B>9 && B<=19)) %We can also have another elseif condition here, where the xx and yy values are values of the base
    color = "base";
else
    color = "no marble";
end
if color~= "base"
    fprintf('\nSmall marble color: %s\nBased on %d,%d,%d\n',color,R,G,B);
end
end
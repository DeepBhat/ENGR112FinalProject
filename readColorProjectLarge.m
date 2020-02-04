function [color] = readColorProjectLarge(mycolor)
%Returns a string by detecting color values in RGB mode. This function
%contains personalized values for all colors, so it works under very
%specific conditions for the ADS project.

result = readColorRGB(mycolor); %RGB values are read, and stored in this array, in this order:
R = result(1);
G = result(2);
B = result(3);

if ((R>=80 && R<=200) && (G>=90 && G<=200) && (B>=90 && B<=160)) %white color for this range
    color = "white";
elseif ((R>=30) && (G>=2 && G<=16) && (B>=3 && B<=12)) %red color for this range
    color = "red";
elseif ((R>=8 && R<=28) && (G>=30 && G<=60) && (B>=11 && B<=29)) %green color for this range
    color = "green";
elseif ((R>=3 && R<=17) && (G>=5 && G<=27) && (B>=25 && B<=75)) %blue color for this range
    color = "blue";
elseif ((R>=65 && R<=120) && (G>=27 && G<=70) && (B>=5 && B<=17)) %yellow color for this range
    color = "yellow";
elseif ((R>=9 && R<=20) && (G>=13 && G<=22) && (B>=8 && B<= 14)) %We can also have another elseif condition here, where the xx and yy values are values of the base
    color = "base";
else
    color = "no marble";
end
if color~= "base"
    fprintf('\nLarge marble color: %s\nBased on %d,%d,%d\n',color,R,G,B);
end
end
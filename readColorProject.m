function [color] = readColorProject(mycolor)
%Returns a string by detecting color values in RGB mode. This function
%contains personalized values for all colors, so it works under very
%specific conditions for the ADS project.

result = readColorRGB(mycolor); %RGB values are read, and stored in this array, in this order:
R = result(1);
G = result(2);
B = result(3);

if ((R>=xx && R<=yy) && (G>=xx && G<=yy) && (B>=xx && B<=yy)) %white color for this range
    color = "white";
elseif ((R>=xx && R<=yy) && (G>=xx && G<=yy) && (B>=xx && B<=yy)) %red color for this range
    color = "red";
elseif ((R>=xx && R<=yy) && (G>=xx && G<=yy) && (B>=xx && B<=yy)) %green color for this range
    color = "green";
elseif ((R>=xx && R<=yy) && (G>=xx && G<=yy) && (B>=xx && B<=yy)) %blue color for this range
    color = "blue";
elseif ((R>=xx && R<=yy) && (G>=xx && G<=yy) && (B>=xx && B<=yy)) %silver color for this range
    color = "silver";
elseif ((R>=xx && R<=yy) && (G>=xx && G<=yy) && (B>=xx && B<=yy)) %yellow color for this range
    color = "yellow";
else %We can also have another elseif condition here, where the xx and yy values are values of the base
    color = "no marble";
end
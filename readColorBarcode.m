function [color] = readColorBarcode(mycolor)
%Uses color sensor values to give either a black or white reading.
%Applicable only to the Barcode Sensor of ADS Project.
colorRGB = readColorRGB(mycolor);
R = colorRGB(1);
G = colorRGB(2);
B = colorRGB(3);
if ((R>=101 && R<=500) && (G>=101 && G<=500) && (B>=65 && B<=500)) %white color for this range
    color = "white";
elseif ((R>=0 && R<=100) && (G>=0 && G<=100) && (B>=0 && B<=100)) %black color for this range
    color = "black";
elseif ((R>=85 && R<=100) && (G>=140 && G<=155) && (B>=30 && B<=45)) %base color for this range
    color = "base";
else
    color = "none";
end
end
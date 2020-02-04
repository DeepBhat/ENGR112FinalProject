function [] = identifierMain()
%FILE READING HERE -- BEST IDEA: During file writing, also write the code
%number, and this shit right here reads the code number only

%====================READ FILE========================
fileID = fopen('Barcode_Pellet_Identifier.txt','r');
A = fscanf(fileID,'%d %d %d');
%=======================================================



%=======================DETERMINING NUMBERS OF MARBLES========================
big_val1 = A(2);
small_val1 = A(3);

big_val2 = A(5); 
small_val2 = A(6);
%=============================================================================



%========================DETERMINING COLORS=====================
switch A(1)
    case 1
        color1 = "white";
    case 2
        color1 = "red";
    case 3
        color1 = "blue";
    case 4
        color1 = "HDPE";
    otherwise
        color1 = "Error";
end

switch A(4)
    case 1
        color2 = "white";
    case 2
        color2 = "red";
    case 3
        color2 = "blue";
    case 4 
        color2 = "HDPE";
    otherwise
        color2 = "Error";
end
%===================================================================

%-------------If HDPE, it's only small, because it is sorted from small motor-----------
if (color1 == "HDPE")
    small_val1 = small_val1 + big_val1;
    big_val1 = 0;
end
if (color2 == "HDPE")
    small_val2 = small_val2 + big_val2;
    big_val2 = 0;
end
%------------------------------------------------------------


%Motor Ports: Large marble motor=A, Small marble motor=B,Track motor=D
%Sensor Ports: Large color sensor=1, Small color sensor=2, touch = 4

%-------------------------Printing what is to be sorted-----------------
fprintf('\n\n%s large: %d; small: %d\n%s large: %d; small: %d\n',color1,big_val1,small_val1,color2,big_val2,small_val2);
%-----------------------------------------------------------------------

%==========================MARBLES SORT============================
pelletIdentifier(color1,big_val1,small_val1,color2,big_val2,small_val2);
%==================================================================

fprintf('PROGRAM ENDED');
fclose(fileID);
return

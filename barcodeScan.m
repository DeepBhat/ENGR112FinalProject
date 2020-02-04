function [material_type_code,material_type_string,t1,t2] = barcodeScan()




%==========================Creating objects for EV3=========================
myev3 = legoev3('USB');
mycolorsensor = colorSensor(myev3,3); %create a color sensor connection
mymotor = motor(myev3,'C'); %create a motor connection
%===========================================================================




mymotor.Speed = 20;





%=========================Initializations========================================
material_binary = [0,0,0]; %Initializing code array for material (3 digits long)
type_binary=[0,0,0,0,0]; %Initializing code array for number of pellets for each type(5 digits long)

material_i = 1; %Material type counter
type_i = 1; %Number of pellets of each type counter

n = realmin('double'); %The smallest positive number
%================================================================================



%=========================Motor running continuously=============================
% Run the motor until you encounter black color reading, which is the first
% black strip, and it is ignored.
while(1)
   start(mymotor);
   if (readColorBarcode(mycolorsensor)=="black")
       break;
    else
       pause(n);
    end
end
%======================================================================


%control will only reach here if the loop has ended
stop(mymotor);
pause(1);
resetRotation(mymotor);
%===================================Reading the strips=====================================        
%We know we have to read 8 strips, so the loop runs eight times
for i=1:8
    while(1)
        start(mymotor);
        if readRotation(mymotor)>=180/(pi*1.075) || (readColor(mycolorsensor) == "black" && i~=1)
            break
        else
            pause(realmin);
        end
    end
    resetRotation(mymotor);
    %stop(mymotor); %This statement might cause problems, consider deleting this and pause(1)
    color = readColorBarcode(mycolorsensor); %read the color
    if(color=="black")
        stop(mymotor);
        fprintf('\nblack\n');
        %pause(0.1);
        if(material_i <= 3) %decide if the code belongs to the material type or number of pellets, the first three readings belong to the material code 
            material_binary(material_i) = 1; %black corresponds to 1
            material_i = material_i+1; %increase the number of readings
        else
            type_binary(type_i) = 1;
            type_i = type_i+1;
        end
    elseif(color=="white")
        stop(mymotor);
        %pause(0.1);
        fprintf('\nwhite\n');
        if (material_i <= 3)
            material_i = material_i+1; %The arrays have been initialized with zeros 
        else
            type_i = type_i+1;
        end
    else
        pause(n);
    end
    %pause(1); %pause for a second before moving to take the next reading,DELETE THIS if you delete stop(motor)
end
%===============================================================================================



%==========================Creating Strings=============================

%Reverse the strings to get the desired readings
material_binary = fliplr(material_binary);
type_binary = fliplr(type_binary);

%Convert binary to decimal
material_type_code = binaryVectorToDecimal(material_binary);
no_of_pellets_code = binaryVectorToDecimal(type_binary);

[material_type_string,t1,t2] = barcodeDecoder(material_type_code,no_of_pellets_code);
fprintf('%s\nNumber of pellets of type 1: %d\nNumber of pellets of type 2: %d',material_type_string,t1,t2);
fprintf('\n\n\n');

%===================================================================

stop(mymotor);
delete(myev3);
end
    
function [] = pelletIdentifier(color1,big_val1,small_val1,color2,big_val2,small_val2)


myev3 = legoev3;
mymotor = motor(myev3,'A');
mycolor = colorSensor(myev3,'1');
mytouch = touchSensor(myev3,'4');



fileID = fopen('Barcode_Scanner.txt','r');
A = fscanf(fileID,'%s\t%s\t%s\t%s\r\n');
disp(A);


big_val1 = str2double(A(3)); %file read
small_val1 = str2double(A(4)); %file read
big_val2 = str2double(A(7)); %file read
small_val2 = str2double(A(8)); %file read
big1 = 0;
small1 = 0;
big2 = 0;
small2 = 0;

%===============================================
% Here we will have if statements to determine color sensor readings
switch str2double(A(1)) %or ambient reading
    case 1
        value1 = 'white';
    case 2
        value1 = 'red';
    case 3
        value1 = 'blue';
    case 4
        value1 = 'silver';
end
% ....
% switch(A(5))
% case 1: value2 = ...
%==============================================

while((readTouch(mytouch)~=1) && ((big1<big_val1)||(small1<smal_val1)||(big2<big_val2)||(small2<smal_val2)))
   pause(1);
   if(readColor=='value1')%&&ultrasonic says small&&small1<small_val1
       mymotor.Speed = -10;
       %small1++;
   elseif(readColor=='value2')%&&ultrasonic says small&&small2<small_val2
       mymotor.Speed = -10;
       %small2++
   elseif(readColor=='value1')%&&ultrasonic says big&&big1<big_val1
       mymotor.Speed = -10;
       %big1++
   elseif(readColor=='value2')%&&ultrasonic says big&&big2<big_val2
       mymotor.Speed = -10;
       %big2++
   else
       mymotor.Speed = 10;
   end
       
   start(mymotor);
   pause(0.25);
   stop(mymotor);
    
end

delete(myev3);
fclose(fileID);

end
myev3 = legoev3;
%mycolor = colorSensor(myev3,1);
mytouch = touchSensor(myev3,4);
%myultra = sonicSensor(myev3,3);
mymotor = motor(myev3,'A');
mymotor.Speed = -20;

while(readTouch(mytouch)~=1)
    start(mymotor);
%     s = readColor(mycolor);
%     disp(s)
%     i_reflected = readLightIntensity(mycolor,'reflected');
%     i_ambient = readLightIntensity(mycolor,'ambient');
%     dist = readDistance(myultra);
%     fprintf('\nReflected: %f\nAmbient: %f\nDistance: %f\n',i_reflected,i_ambient,dist);
    pause(realmin)
end

delete(myev3);
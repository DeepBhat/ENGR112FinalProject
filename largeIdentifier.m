function [] = largeIdentifier(color1,big_val1,color2,big_val2)

myev3 = legoev3;
mymotorBig = motor(myev3,'A');
mycolorBig = colorSensor(myev3,'1');
mytouch = touchSensor(myev3,'4');

big1 = 0;
big2 = 0;

while((readTouch(mytouch)~=1) && ((big1<big_val1)||(big2<big_val2)))
    if(readColor(mycolorBig)~='brown')
        if(readColor(mycolorBig)==color1)
            mymotorBig.Speed = 10;
            big1 = big1+1;
        elseif(readColor(mycolorBig)==color2)
            mymotorBig.Speed = 10;
            big2 = big2+1;
        else
            mymotorBig.Speed = -10;
        end
        start(mymotorBig);
        pause(0.25);
        stop(mymotorBig);
    end
end

delete(myev3);    
end
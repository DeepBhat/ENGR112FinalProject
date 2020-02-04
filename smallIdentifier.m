function [] = smallIdentifier(color1,small_val1,color2,small_val2)

myev3 = legoev3;
mymotorsmall = motor(myev3,'B');
mycolorsmall = colorSensor(myev3,'2');
mytouch = touchSensor(myev3,'4');

small1 = 0;
small2 = 0;

while((readTouch(mytouch)~=1) && ((small1<small_val1)||(small2<small_val2)))
    if(readColor(mycolorsmall)~='brown')
        if(readColor(mycolorsmall)==color1)
            mymotorsmall.Speed = 10;
            small1 = small1+1;
        elseif(readColor(mycolorsmall)==color2)
            mymotorsmall.Speed = 10;
            small2 = small2+1;
        else
            mymotorsmall.Speed = -10;
        end
        start(mymotorsmall);
        pause(0.25);
        stop(mymotorsmall);
    end
end

delete(myev3);    
end
function dispenserLadder()
ladder=legoev3('usb');
ladderMotor=motor(ladder,'A');
ladderMotor.Speed=-20;
ladderTouch = touchSensor(ladder);
flag = 1;
start(ladderMotor);
n = realmin('double');

while(1)
    if(readTouch(ladderTouch)==0)  
        pause(n);
    else
        if flag == 1
            stop(ladderMotor);
            flag = 0;
        else
            start(ladderMotor);
            flag = 1;
        end
    end
end 
delete(ladder);
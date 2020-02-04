function [] = pelletIdentifier(color1,big_val1,small_val1,color2,big_val2,small_val2)

%=============================LEGO inititialization====================
myev3 = legoev3('usb');
mymotorBig = motor(myev3,'A');
mymotorSmall = motor(myev3,'B');
mymotorTrack = motor(myev3,'D');
mycolorBig = colorSensor(myev3,1);
mycolorSmall = colorSensor(myev3,2);
mytouch = touchSensor(myev3,4);
%mymotorWaste = motor(myev3,'E');
%mymotorGate = motor(myev3,'F');
%=======================================================================


n = realmin('double'); %the smallest number in MATLAB


%=========================Error Sound==================================
%WarnWave = [sin(1:.6:400), sin(1:.7:400), sin(1:.4:400)];
%Audio = audioplayer(WarnWave, 22050);
%======================================================================

%==========================Turns===================================
goBig = 308;       %re-circulator
goBig2 = 309;      %dispension
%turnBig = 36;
%turnBig2 = 43;
goSmall = 318;     %dispension
goSmall2 = 314;     %re-circulator

goCirculate = 15;
goWaste = -15;
%===================================================================


%=====================Strings========================================
pelletColors = ["white","red","blue","HDPE"];
state = 1; %1 for re-circulation, 0 for waste
%==================================================================

%==========================Number of marbles sorted====================
big1 = 0;           %large marbles of color 1
small1 = 0;         %small marbles of color 1
big2 = 0;           %large marbles of color 2
small2 = 0;         %small marbles of color 2
count = 0;          %number of marbles identified
%======================================================================


%=============================Track motor (Pellet Dispenser)===============
mymotorTrack.Speed = -45;
%=========================================================================


%==========================Reading begins here===========================
while(1)
    if(readTouch(mytouch)~=1)
       resetRotation(mymotorBig);
       resetRotation(mymotorSmall);
       start(mymotorTrack);
       pause(0.1); %move the track motor
       stop(mymotorTrack);

       %=============Large marbles sorting====================
       if(big1<big_val1 || big2<big_val2)       %if we already have not sorted all the large marbles
           if(readColorProjectLarge(mycolorBig)~="base")   %if there is a marble under color sensor for reading
            pause(0.5);                     %pause to let the marble settle
            count = count+1;
            %if any(contains(pelletColors,readColorProjectLarge(mycolorBig)))
                if(strcmpi(readColorProjectLarge(mycolorBig),color1)==1 && big1<big_val1)   %if the color read is equal to 1st color
                    fprintf('\nDispensing..!\n%d %s large marbles remain.\n',(big_val1 - (big1+1)),color1);
                    pause(0.5);
                    big1 = big1 + 1;
                    mymotorBig.Speed = -20;         %this is the direction for the well
                    while(1)
                        start(mymotorBig);
                        if readRotation(mymotorBig)<= -goBig2
                            break
                        else
                            pause(n);
                        end
                    end
                    stop(mymotorBig);
                    pause(2);
                    resetRotation(mymotorBig);
                    flag = 1;

                elseif(strcmpi(readColorProjectLarge(mycolorBig),color2)==1 && big2<big_val2) %if the color read is equal to 2nd color
                    pause(0.5);
                    big2 = big2 + 1;
                    fprintf('\nDispensing..!\n%d %s large marbles remain.\n',(big_val2 - (big2+1)),color2);
                    mymotorBig.Speed = -20;
                    while(1)
                        start(mymotorBig);
                        if readRotation(mymotorBig)<= -goBig2
                            break
                        else
                            pause(realmin);
                        end
                    end
                    stop(mymotorBig);
                    pause(2);
                    resetRotation(mymotorBig);
                    flag = 1;
                else
                    %------------IMPORTANT FUTURE CODE, DONT DELETE--------------
                    %if state ~= 1
%                         while(1)
    %                         start(mymotorWaste);
    %                         if readRotation(mymotorWaste)>= goCirculate
    %                             break
    %                         else
    %                             pause(n);
    %                         end
%                         end
                        %resetRotation(mymotorWaste);
                        %state = 1;
                    %end
                    fprintf('\nRecirculating...!\n');
                    mymotorBig.Speed = 20;          %this is the direction for the re-circulator
                    while(1)
                        start(mymotorBig);
                        if readRotation(mymotorBig)>= goBig
                            break
                        else
                            pause(n);
                        end
                    end
                    resetRotation(mymotorBig);
                    stop(mymotorBig);
                    pause(2);
                end
            resetRotation(mymotorBig); 
        %else
                    %if state~=0
    %                   while(1)
    %                         start(mymotorWaste);
    %                         if readRotation(mymotorWaste)<= -goWaste
    %                             break
    %                         else
    %                             pause(n);
    %                         end
%                         end
                        %resetRotation(mymotorWaste);
                        %state = 0; 
                     %end
%                     fprintf('\nDisposing of...!\n');
%                     mymotorBig.Speed = 20;          %this is the direction for the re-circulator
%                     while(1)
%                         start(mymotorBig);
%                         if readRotation(mymotorBig)>= goBig
%                             break
%                         else
%                             pause(n);
%                         end
%                     end
%                     resetRotation(mymotorBig);
%                     stop(mymotorBig);
%                     pause(2);
            %end
           end
          
       else                         %we have already dispensed the required marbles
           if(readColorProjectLarge(mycolorBig)~="no marble") %so if there is a marble detected
             %if any(contains(pelletColors,readColorProjectLarge(mycolorBig)))
               %if state ~= 1
%                         while(1)
    %                         start(mymotorWaste);
    %                         if readRotation(mymotorWaste)>= goCirculate
    %                             break
    %                         else
    %                             pause(n);
    %                         end
%                         end
                        %resetRotation(mymotorWaste);
                        %state = 1;
                    %end
             %else
                    %if state~=0
    %                   while(1)
    %                         start(mymotorWaste);
    %                         if readRotation(mymotorWaste)<= -goWaste
    %                             break
    %                         else
    %                             pause(n);
    %                         end
%                         end
                        %resetRotation(mymotorWaste);
                        %state = 0; 
                     %end
                    
               pause(0.5);
               count = count+1;
               fprintf('\nLarge marbles dispensed, so recirculating...\n');
               mymotorBig.Speed = 20;      %throw it into the re-circulator
               while(1)
                    start(mymotorBig);
                    if readRotation(mymotorBig)>= goBig
                        break
                    else
                        pause(n);
                    end
               end
               stop(mymotorBig);
               resetRotation(mymotorBig);
           end
      end
       %========================================================




       %===========Small Marble Sorting========================
       %Same as the big one, only the big marble count is replaced by small
       %marble count, and the movement of gate is a symmetric 120 degrees, so
       %we do not need to rest the gate.
       if(small1<small_val1 || small2<small_val2)
           if(readColorProjectSmall(mycolorSmall)~="base")
               pause(0.5);
               count = count+1;
            %if any(contains(pelletColors,readColorProjectSmall(mycolorSmall)))
             if(strcmpi(readColorProjectSmall(mycolorSmall),color1)==1 && small1<small_val1)
                pause(0.5);
                small1 = small1 + 1;
                fprintf('\nDispensing..!\n%d %s small marbles remain.\n',(small_val1 - (small1+1)),color1);
                mymotorSmall.Speed = 20;
                while(1)
                    start(mymotorSmall);
                    if readRotation(mymotorSmall)>= goSmall
                        break
                    else
                        pause(realmin);
                    end
                end
                stop(mymotorSmall);
                resetRotation(mymotorSmall);
            elseif(strcmpi(readColorProjectSmall(mycolorSmall),color2)==1 && small2<small_val2)
                pause(0.5);
                small2 = small2 + 1;
                fprintf('\nDispensing..!\n%d %s small marbles remain.\n',(small_val2 - (small2+1)),color2);
                mymotorSmall.Speed = 20;
                while(1)
                    start(mymotorSmall);
                    if readRotation(mymotorSmall)>= goSmall
                        break
                    else
                        pause(realmin);
                    end
                end
                stop(mymotorSmall);
                resetRotation(mymotorSmall);
             else
                %if state ~= 1
%                         while(1)
    %                         start(mymotorWaste);
    %                         if readRotation(mymotorWaste)>= goCirculate
    %                             break
    %                         else
    %                             pause(n);
    %                         end
%                         end
                        %resetRotation(mymotorWaste);
                        %state = 1;
                    %end
                mymotorSmall.Speed = -20;
                fprintf('\nRecirculating...!\n');
                while(1)
                    start(mymotorSmall);
                    if readRotation(mymotorSmall)<= -goSmall2
                        break
                    else
                        pause(n);
                    end
                end
                stop(mymotorSmall);
                resetRotation(mymotorSmall);
            end
            pause(1);
          %else
                    %if state~=0
    %                   while(1)
    %                         start(mymotorWaste);
    %                         if readRotation(mymotorWaste)<= -goWaste
    %                             break
    %                         else
    %                             pause(n);
    %                         end
%                         end
                        %resetRotation(mymotorWaste);
                        %state = 0; 
                     %end
                %end
%                 mymotorSmall.Speed = -20;
%                 fprintf('\nDisposing of...!\n');
%                 while(1)
%                     start(mymotorSmall);
%                     if readRotation(mymotorSmall)<= -goSmall2
%                         break
%                     else
%                         pause(n);
%                     end
%                 end
%                 stop(mymotorSmall);
%                 resetRotation(mymotorSmall);
%             end
%             pause(1);
           end
      else
           if(readColorProjectSmall(mycolorSmall)~="base")
               pause(0.5);
               count = count+1;
               %if any(contains(pelletColors,readColorProjectSmall(mycolorSmall)))
               %if state ~= 1
%                         while(1)
    %                         start(mymotorWaste);
    %                         if readRotation(mymotorWaste)>= goCirculate
    %                             break
    %                         else
    %                             pause(n);
    %                         end
%                         end
                        %resetRotation(mymotorWaste);
                        %state = 1;
                    %end
                %else
                    %if state~=0
    %                   while(1)
    %                         start(mymotorWaste);
    %                         if readRotation(mymotorWaste)<= -goWaste
    %                             break
    %                         else
    %                             pause(n);
    %                         end
%                         end
                        %resetRotation(mymotorWaste);
                        %state = 0; 
                     %end
                %end
               fprintf('\nSmall marbles dispensed, so recirculating...\n');
               mymotorSmall.Speed = -20;
               while(1)
                    start(mymotorSmall);
                    if readRotation(mymotorSmall)<= -goSmall2
                        break
                    else
                        pause(n);
                    end
                end
                stop(mymotorSmall);
                resetRotation(mymotorSmall);
                
           end
       end
      %=====================================================

      %If all the 4 types of marbles are sorted,
       if(small1>=small_val1 && small2>=small_val2 && big1>=big_val1 && big2>=big_val2)
           fprintf('\nAll marbles dispensed!'\n);
           %mymotorGate.Speed = 20;
           %start(mymotorGate)
           %pause(0.5)
           %stop(mymotorGate)
           %mymotorGate.Speed = 20;
           %start(mymotorGate)
           %pause(0.5)
           %stop(mymotorGate)
           break;           %break out of the loop.
       end

       if count>=35
           playTone(myev3,550.0,0.75,50)
           pause(2)
           error('Insufficient Pellets to dispense');
       end
       
    else
        fprintf('\n\nDo you want to exit? Hold the touch sensor for 3 seconds to exit.\n');
        pause(3);
        if(readTouch(mytouch)==1)
            flag = 0;
            break;
        else
            while(readTouch(mytouch)~=1)
                pause(n);
            end
            flag = 1;
            continue;
        end
    end
end

stop(mymotorBig);
stop(mymotorSmall);
delete(myev3);
    
end
function printStraightCar(initral_x,initral_y,stick_long,stick_th,car_angle)
    xp=[initral_x initral_x+stick_long*sin(stick_th)]; % 桿子
    yp=[initral_y initral_y+stick_long*cos(stick_th)];
    plot(xp,yp,'Color',[1,0,0])
    hold on

    the=0:0.01:2*pi;% 桿子頂端球
    x=initral_x+stick_long*sin(stick_th)+(1/10)*stick_long*cos(the); 
    y=initral_y+stick_long*cos(stick_th)+(1/10)*stick_long*sin(the); 
    plot(x,y,'Color',[1,0,0])
    
    xb=[initral_x-(3/5)*stick_long*cos(car_angle)+(3/5)*stick_long*sin(car_angle) initral_x+(3/5)*stick_long*cos(car_angle)+(3/5)*stick_long*sin(car_angle) initral_x+(3/5)*stick_long*cos(car_angle) initral_x-(3/5)*stick_long*cos(car_angle) initral_x-(3/5)*stick_long*cos(car_angle)+(3/5)*stick_long*sin(car_angle)];% 車身方塊
    yb=[initral_y-(3/5)*stick_long*sin(car_angle)-(3/5)*stick_long*cos(car_angle) initral_y+(3/5)*stick_long*sin(car_angle)-(3/5)*stick_long*cos(car_angle) initral_y+(3/5)*stick_long*sin(car_angle) initral_y-(3/5)*stick_long*sin(car_angle) initral_y-(3/5)*stick_long*sin(car_angle)-(3/5)*stick_long*cos(car_angle)];
    plot(xb,yb,'Color',[0,0,1])

    plot(initral_x+(7/10)*stick_long*sin(car_angle)+((2/5)*stick_long*cos(car_angle))+(1/10)*stick_long*cos(the),initral_y+((2/5)*stick_long*sin(car_angle))-(7/10)*stick_long*cos(car_angle)+(1/10)*stick_long*sin(the),'Color',[0,0,1]) 
    plot(initral_x+(7/10)*stick_long*sin(car_angle)-((2/5)*stick_long*cos(car_angle))+(1/10)*stick_long*cos(the),initral_y-((2/5)*stick_long*sin(car_angle))-(7/10)*stick_long*cos(car_angle)+(1/10)*stick_long*sin(the),'Color',[0,0,1])
    fill(x,y,'b')
    fill(xb,yb,'g')
    fill(initral_x+(7/10)*stick_long*sin(car_angle)+((2/5)*stick_long*cos(car_angle))+(1/10)*stick_long*cos(the),initral_y+((2/5)*stick_long*sin(car_angle))-(7/10)*stick_long*cos(car_angle)+(1/10)*stick_long*sin(the),'r')
    fill(initral_x+(7/10)*stick_long*sin(car_angle)-((2/5)*stick_long*cos(car_angle))+(1/10)*stick_long*cos(the),initral_y-((2/5)*stick_long*sin(car_angle))-(7/10)*stick_long*cos(car_angle)+(1/10)*stick_long*sin(the),[1 0 0])
    axis([-2*stick_long 2*stick_long -2*stick_long 2*stick_long])
    axis('square')
    grid on;
    return
    
    
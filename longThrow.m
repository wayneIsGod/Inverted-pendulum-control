clear;clc;close all;
stick_long=5; width=0.1; speed=10; g=9.8;
car_angle=-pi/6; slope_long=(30)*stick_long; slope_bias=(3/10)*stick_long; div_angle=1.2;
ground_x=[-50*slope_long*cos(car_angle)+slope_bias*sin(car_angle),50*slope_long*cos(car_angle)+slope_bias*sin(car_angle)];
ground_y=[0,0];
slope_x=[-slope_long*cos(car_angle),0];
slope_y=[-slope_long*sin(car_angle),0];
[t,x]=ode23(@IP_long,[0 100],[-1 0 0 0 -1 0 stick_long 0 stick_long g car_angle]);
N=max(size(x));
x_pos=x(1,3); y_pos=x(1,7); angle=x(1,1); temp=x_pos;
record=1;
record_angle=0;
t=1;
for i=1:N
    plot(slope_x,slope_y,'Color',[0,1,1]); hold on;
    plot(ground_x,ground_y,'b'); hold on;
    if x_pos>slope_x(1)
        angle=x(i,1);
        x_pos=x(i,3);
        fi=x(i,5);
        y_pos=x(i,7);
        temp=x_pos/i;
    else 
        car_angle=car_angle/div_angle;
        angle=x(i,1);
        x_pos=x_pos+temp;
        y_pos=y_pos-g*0.01/2*(t^2);
        t=t+1;
    end
    printStraightCar(x_pos,y_pos,stick_long,angle,car_angle)
    axis([-50*stick_long 0*stick_long -1*stick_long 9*stick_long]); axis('equal');
    MA(:,i)=getframe; hold off;
    if y_pos<2*stick_long && x_pos<slope_x(1)
        temp=x_pos;
        record_angle=angle;
        break;
    end
end
car_angle=0; g=9.8;
[t,x]=ode23(@IP_long,[0 100],[-1 0 10 0 -1 0 (4/5)*stick_long 0 stick_long g car_angle]);
N=max(size(x));
for i=1:N
    if(abs(x(i,3)-temp)<0.02 && abs(x(i,1)-record_angle)<0.2)
        record=i;
    end
end
for i=record:N
    plot(slope_x,slope_y,'Color',[0,1,1]); hold on;
    plot(ground_x,ground_y,'b'); hold on;
    angle=x(i,1);
    x_pos=x(i,3);
    fi=x(i,5);
    y_pos=x(i,7);
    printStraightCar(x_pos,y_pos,stick_long,angle,car_angle); 
    axis([-50*stick_long 0*stick_long -1*stick_long 9*stick_long]); axis('equal');
    MA(:,i)=getframe; hold off;
end

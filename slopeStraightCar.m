clear;clc;close all;
stick_long=0.3; width=0.1; g=9.8; %car_angle=0; 
car_angle=pi/6; slope_long=40*stick_long; slope_bias=(4/5)*stick_long;
slope_x=[-slope_long*cos(car_angle)+slope_bias*sin(car_angle),slope_long*cos(car_angle)+slope_bias*sin(car_angle)];
slope_y=[-slope_long*sin(car_angle)-slope_bias*cos(car_angle),slope_long*sin(car_angle)-slope_bias*cos(car_angle)];

[t,x]=ode23(@IP,[0 10],[-1 0 0 0 -1 0 0 0 stick_long g car_angle]);
N=max(size(x));
for i=1:N
    plot(slope_x,slope_y); hold on;
    angle=x(i,1);
	x_pos=x(i,3);
    fi=x(i,5);
    y_pos=x(i,7);
    printStraightCar(x_pos,y_pos,stick_long,angle,car_angle);
    axis([-10*stick_long 2*stick_long -10*stick_long 2*stick_long]);axis('equal');
    MA(:,i)=getframe; hold off;
end


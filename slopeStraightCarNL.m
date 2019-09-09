clear;
stick_long=5; len=0.2; width=0.1; %car_angle=0; 
car_angle=pi/6;
[t,x]=ode23(@IP_NL,[0 10],[-1 0 0.1 0 0.1 0 stick_long car_angle]);
N=max(size(x));
for i=1:N
    angle=x(i,1);
	x_pos=x(i,3);
    fi=x(i,5);
    y_pos=x(i,7);
    printStraightCar(x_pos,y_pos,stick_long,angle,car_angle)
    axis([-10 10 -10 10]);axis('equal');
    MA(:,i)=getframe; hold off
end
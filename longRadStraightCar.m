clear;clc;close all;
stick_long=5; g=9.8;
car_angle=pi/3;
inter_line=(1/5)*stick_long;
[t,X]=ode23(@IP_long,[0 100],[-1 0 0 0 -1 0 0 0 stick_long g car_angle]);
    N=max(size(X));
    for i=1:N
        %% Draw a circle
        j=0:30; P=inter_line*sin(2*pi/30*j);Q=inter_line*cos(2*pi/30*j);
        plot(P,Q,'b'); hold on;
        %% Draw desired target angle position
        printStraightCar(inter_line*sin(X(i,1)),-inter_line*cos(X(i,5)),stick_long,X(i,1),car_angle);
        
        %% Draw motor angle position
        x=[0 inter_line*sin(X(i,1))];
        y=[0 -inter_line*cos(X(i,5))];
        j=0:30; 
        P=stick_long*cos(2*pi/30*j);Q=stick_long*sin(2*pi/30*j);
        plot(x,y,'Color',[1,0.6,0.1], 'LineWidth',2); 
        plot(P,Q,'b');
        axis([-(6/5)*stick_long (6/5)*stick_long -(6/5)*stick_long (6/5)*stick_long]);axis('equal');
        MV(:,i)=getframe;  hold off;
    end
    

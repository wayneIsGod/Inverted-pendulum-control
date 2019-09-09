function dx=IP(t,x)
    % state feedback design
    u = -[-95.4861 -22.3475 -7.0711 -12.5201 -95.4861 -22.3475 -7.0711 -12.5201 -1 -1 -1]*x;
    
    dx=zeros(11,1);
    dx(1)=x(2);
    dx(2)=(-(x(9)^2)*sin(x(1))*cos(x(1))*(x(1)^2)+2*x(9)*x(10)*sin(x(1))-x(9)*cos(x(1))*u)/(-(x(9)^2)*cos(x(1))^2+(8/3)*(x(9)^2));
    dx(3)=x(4);
    dx(4)=(-(x(9)^2)*x(10)*sin(x(1))*cos(x(1))+(4/3)*(x(9)^3)*sin(x(1))*(x(1)^2)+(4/3)*(x(9)^2)*u)/(-(x(9)^2)*(cos(x(1))^2)+(8/3)*(x(9)^2));
    dx(5)=x(6);
    dx(6)=(-(x(9)^2)*sin(x(5))*cos(x(5))*(x(5)^2)+2*x(9)*x(10)*sin(x(5))-x(9)*cos(x(5))*u)/(-(x(9)^2)*cos(x(5))^2+(8/3)*(x(9)^2));
    dx(7)=x(8);
    dx(8)=tan(x(11))*(-(x(9)^2)*x(10)*sin(x(5))*cos(x(5))+(4/3)*(x(9)^3)*sin(x(5))*(x(5)^2)+(4/3)*(x(9)^2)*u)/(-(x(9)^2)*(cos(x(5))^2)+(8/3)*(x(9)^2));
    
    
    
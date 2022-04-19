function [area,actual,et]=circleArea(r,points)
%Created by Jacob Beauchamp github: BeauchampJ
%Montecarlo is a function that computes the area of a square using a
%montecarlo simulation. This is an introduction to how randomness isn't
%really random!
%Inputs:
%   r: Radius of circle we are calculating
%   points: The number of points the user wants to randomly place drop to
%   calculate area
%
%Outputs:
%   area: The area calculated from the simulation
%   error: The absolute error between our estimate and our actual area
close all
d=r*2;%Doubles to get our diameter
x0=r;
y0=x0;
inside=0;%indexing variable for how many fall within the circle

hold on
C_pos = [0 0 d d]; %Sets up positioning for following commands
rectangle('Position',C_pos,'Curvature',[1 1]); %Makes a circle
axis equal
rectangle('Position',C_pos,'EdgeColor','b'); %Makes a square

for n=1:points
    x_point=rand(1)*d;
    y_point=rand(1)*d;
    if ((x_point-x0)^2)+((y_point-y0)^2) <= r^2 %If statement to see if points are inside of our circle
        inside=inside+1;
    end
    plot(x_point,y_point,'.');
end
hold off

area=4*((inside/(points))*(r^2));
actual=(pi)*(r^2);
et=abs((actual-area)/(actual));
end

 %% Sample Problem 10-3: Heat conduction in a square plate
% * Engineering Analysis Format (EAF)
% 
%the above * create a bullet item
% Emmanuel Rodriguez
% June 12, 2020, @Villa Camino, Oceanside, CA
% See Gilat p. 339 for sample problem.
% See Visio program design file > C:\Users\ejoaq\OneDrive\1 My_Notebook
% \2 Entrepreneurship and Work\1 Teaching\1 National University\
% 1 DEN417_MATLAB\In-Class demos\Week Two > 
% SP_10_3_3Dplot_Heat_conduction_plate_Program-Design_Rodriguez.visio
%%
% *Problem Statement*
%the above statement enclosed in asteriks creates a section heading
%%
% Three sides of a rectangular plate are kept at T = 0 degC and one side is
% kept at T1 = 80 degC.
%
figure;
    imshow('SP_10-3_fig.png'); % imshow displays the image
%%
% Determine and plot the temperature distribution T(x,y) in the plate.
% a = 5m , b = 4m
%
%when creating a new section with double percent symbol, make sure to...
%leave a space after the percent
%%
% _*Expected Outputs*_
%
% # Temperature distribution as a function of x and y coordinates.
%
%the above _* creates italics
%# creates numbered list
%%
% _*Conversion Factors & Constants*_
%-----------------------------------

%%
% *Knowns / Assumptions (Inputs)*
%%
% _*Knowns*_
T0=0;
T1=80; % \degC
a = 5; % m
b = 4; % m

%%
% _*Convert Units*_
%

%%
% _*Assumptions*_
%------------------

%%
% *Calculations*
%
% _*Governing Equations*_
%
% * For given boundary conditions (T0 and T1), T(x,y) can be expressed
% analytically by a Fourier series
figure;
imshow('SP_10-3_fig2.png');

%%
%
% _*Calculations*_

% Create an X,Y grid in the domain 0 <= x <= a and 0 <= x <= b. 
% Create segments for each dimension, by dividing by 0.25.
segdiv = .25;
na = a/segdiv;
nb = b/segdiv;
x = linspace(0,a,na); % generate linearly spaced vector for x dimension
y = linspace(0,b,nb);
[X,Y] = meshgrid(x,y); % meshgrid function returns 2D grid coordinates
% (output arguments) based on the coordinates contained in vectors x and y
k = 100; % first we'll try 5 iterations
% Calculate the temperature at each point of the mesh. Calcs are done point
% by point using a double-loop.
% At each point the temp is determined by adding k terms of the Fourier
% series.

for i = 1:nb % First loop, i, is the index of the grid's row.
    for j = 1:na % Second loop, j, is the index of the grid's column.
        T(i,j) = 0; % Initialize T. Set to 0.
        for n = 1:k % Third loop, is performing the Fourier series
            % calculation for the given coord and adding the
            % previous result
            ns = 2*n-1; % this is simply a variable
            T(i,j)= T(i,j)+sin(ns*pi*X(i,j)/a)*sinh(ns*pi*Y(i,j)/a)/...
                (sinh(ns*pi*b/a)*ns);
        end
        T(i,j) = T(i,j)*4*T1/pi; % Calc 'outside' Fourier transform
    end
end
figure;
surfc(X,Y,T) % surfc creates a surface and contour plot, see Gilat p. 330
colormap hot; % set colormap 
% other options: https://www.mathworks.com/help/matlab/ref/colormap.html#buc3wsn-1-map
c1 = colorbar;
pos = get(c1,'Position');
c1.Label.String = 'T, \circC';
c1.Label.Position = [pos(1)+1 pos(2)+85];
c1.Label.Rotation = 0;
title('Heat Conduction in Square Plate', 'fontsize',12);
xlabel('x, meters'); ylabel('y, meters'); zlabel('T, \circC');

figure;
meshc(X,Y,T) % meshc creates a mesh and contour plot
colormap hot;
c2 = colorbar;
c2.Label.String = 'T, \circC';
c2.Label.Position = [pos(1)+1 pos(2)+85];
c2.Label.Rotation = 0;
title('Heat Conduction in Square Plate', 'fontsize',12);
xlabel('x, meters'); ylabel('y, meters'); zlabel('T, \circC');

figure;
cl = 20; % number of contour levels (for increased resolution)
contour(X,Y,T, cl) % 2-D contour plot
colormap hot;
title('Heat Conduction in Square Plate', 'fontsize',12);
xlabel('x, meters'); ylabel('y, meters'); zlabel('T, \circC');
c3 = colorbar;
%ylabel(cb,'T, \circC','Rotation',90);
c3.Label.String = 'T, \circC';
pos = get(c3,'Position'); % returns the position of the cb label, with 
% the coordinates of the lower left corner, and the width and height of the
% label. The get function queries graphics object properties.
c3.Label.Position = [pos(1)+1 pos(2)+80]; % the Label.Position assigns the
% coordinates of the lower left corner of the label plus/minus some offset
% here the 80 is offsetting the label in y, and 1 is offsetting in x.
c3.Label.Rotation = 0; % Rotate the text
%https://www.mathworks.com/matlabcentral/answers/362971-display-colorbar-label-horizontally-and-specify-its-position?s_tid=mwa_osa_a
%%
% *Discussion and Presentation (Outputs)*
%
str = ['The 3D surface plot shows the temperature distribution'...
    ' across the rectangular plate where one side (Y = 4 meters)'...
    ' is kept at 80' char(176) 'C, and the other edges are kept at 0' char(176) 'C,'...
    ' note the edge effects along the y-axis on both sides of the plate.'];
    % '...' known as ellipsis continues the ...
    % current command on the next line.
    % str is a statements creating a string array containing the message
    % 'num2str' is a function that converts numbers to character array
    % ' a single apostrophe is start/termination character
    % \n starts a new line; since the command is appended to the end of...
    % the print out \n places the print after the print out.
    
disp(str) % displays the message in the string array, creating a single...
    % character array.
    % the process of creating a string array is called concatenation

% End
% Publish by entering ...
% 'publish('DEN417_Rodriguez_HW1.m','pdf')' in the command window
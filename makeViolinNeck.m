%makeViolinNeck.m
%Author: Nicole Regenauer
%setting up graphical display of violin neck
%used to simulate operation of path-finding function on real violin


function makeViolinNeck
%first, creating a new figure
figure

x = [0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3];
y =[0 1 2 3 4 5 6 7 0 1 2 3 4 5 6 7 0 1 2 3 4 5 6 7 0 1 2 3 4 5 6 7];
disp(size(x))
disp(size(y))

neck = plot(x,y, 'ks', 'MarkerSize', 40);
axis('ij');
grid('minor');
axis('equal');
axis([-0.5 3.5 -0.5 7.5]);

set (gca,'xticklabel',[],'yticklabel',[])

text(-1.5,-0.1,'Open','fontsize',10)
text(-1.5,0.9, 'Pos 1','fontsize',10)
text(-1.5,1.9, 'Pos 2', 'fontsize',10)
text(-1.5,2.9,'Pos 3', 'fontsize', 10)
text(-1.5, 3.9, 'Pos 4', 'fontsize', 10)
text(-1.5,4.9,'Pos 5', 'fontsize', 10)
text(-1.5, 5.9, 'Pos 6', 'fontsize', 10)
text(-1.5,7.1,'Pos 7', 'fontsize', 10)

text (-0.2, -1, 'G', 'fontsize',20)
text (0.8, -1, 'D', 'fontsize', 20)
text (1.8, -1, 'A', 'fontsize', 20)
text (2.8, -1, 'E', 'fontsize', 20)

hold('on');




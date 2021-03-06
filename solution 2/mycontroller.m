function [vx vz]=mycontroller(pos,goal,vmax)
% choose arbitarily linear velocity 
vx=0.1;
%linear coefficient
k = 5;
% distance between robot post and target
dst=norm([pos(1:2)-goal(1:2)]);
% angular difference between target and robots actual angle
ang=acheck(atan2(goal(2)-pos(2),goal(1)-pos(1)),pos(3));
% ye error according to robot frame
ye=dst*sin(ang);
% determine angular velocity with multiply coefficient k to ye
vz=k*ye;

if (vz>vmax)
    vz=vmax;
end
if (vz<-vmax)
    vz=-vmax;
end
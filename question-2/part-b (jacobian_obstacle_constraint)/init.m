clear all
close all
clc

load('kinematic_traj.mat');

sim('obstacle_pseudo_inverse_2018b',4); % Simulating the jacobian inverse function
scatter(ans.xe.Data(:,1),ans.xe.Data(:,2))%Plotting the function in 3 D
xlabel('x');
ylabel('y');
% zlabel('z');

figure('Name','joint variables plots');
labeljoint = ["theta_1","theta_2","d_3","theta_4"];
for i=1:4
    subplot(4,1,i);
    plot(t,ans.q.Data(:,i));
    xlabel('time');
    ylabel(labeljoint(i));
end 

figure('Name','error plots');
labelerror = ["e_x","e_y","e_{phi}"];
for i=1:3
    subplot(3,1,i);
    plot(t,ans.error.Data(:,i));
    xlabel('time');
    ylabel(labelerror(i));
end 

figure('Name','operational variables plots');
labeloperation = ["x","y","phi"];
for i=1:3
    subplot(3,1,i);
    plot(t,ans.xe.Data(:,i));
    xlabel('time');
    ylabel(labeloperation(i));
end 


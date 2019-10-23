scatter3(out.xe.Data(:,1),out.xe.Data(:,2),out.xe.Data(:,3))%Plotting the function in 3 D
xlabel('x');
ylabel('y');
zlabel('z');

figure('Name','joint variables plots');
labeljoint = ["theta_1","theta_2","d_3","theta_4"];
for i=1:4
    subplot(4,1,i);
    plot(t,out.q.Data(:,i));
    xlabel('time');
    ylabel(labeljoint(i));
end 

figure('Name','error plots');
labelerror = ["e_x","e_y","e_z"];
for i=1:3
    subplot(3,1,i);
    plot(t,out.error.Data(:,i));
    xlabel('time');
    ylabel(labelerror(i));
end 

figure('Name','operational variables plots');
labeloperation = ["x","y","z"];
for i=1:3
    subplot(3,1,i);
    plot(t,out.xe.Data(:,i));
    xlabel('time');
    ylabel(labeloperation(i));
end 


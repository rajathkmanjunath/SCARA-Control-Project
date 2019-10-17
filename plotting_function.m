% Plotting function
figure(1)
state_names = ["theta_1", "theta_2", "d_3", "theta_4"];
title("q");
for i=1:4
subplot(4,1,i);
plot(t, out.q.Data(:,i));
xlabel("time");
ylabel(state_names(i));
end

figure(2)
title("p");
definition_names = ["x","y","z","theta_x","theta_y","theta_z"];
for i=1:6
subplot(6,1,i);
plot(t, out.p.Data(:,i));
xlabel("time");
ylabel(definition_names(i));
end

figure(3)
title("error");
definition_names = ["x","y","z","theta_x","theta_y","theta_z"];
for i=1:6
subplot(6,1,i);
plot(t, out.error.Data(:,i));
xlabel("time");
ylabel(definition_names(i));
end

figure(4)
for i=1:3
    subplot(4,1,i);
    plot(t, pd(:,i));
    
end
subplot(4,1,4);
plot(t, theta_d(:));
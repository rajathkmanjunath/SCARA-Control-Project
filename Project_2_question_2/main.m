clc;
clear all;

as = [0.5,0.5,0,0];
ds = [0,0,0,0];
alphas = [0,0,0,0];
thetas = [pi/2,pi/2,0,pi/2];
revolute = [1,1,0,1];
k_ri = [1,1,50,20];
[link_position_jacobian, link_orientation_jacobian, motor_position_jacobian, motor_orientation_jacobian] = jacobian_calculation(4, alphas, thetas, as, ds, revolute, k_ri);

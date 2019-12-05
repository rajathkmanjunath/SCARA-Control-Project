function [link_position_jacobian, link_orientation_jacobian, motor_position_jacobian, motor_orientation_jacobian] = jacobian_calculation(num_joints, alphas, thetas, as, ds, revolute, kri)
    homogeneous_stack = eye(4);
    z = [0;0;1];
    p_prev = [0;0;0];
    
    for i=1:num_joints
        homogeneous_matrix = homogeneous_transform(thetas(i), alphas(i), as(i), ds(i));
%         intermediate_homogeneous(:,:,i) = homogeneous_matrix;
        homogeneous_stack(:,:,i+1) = homogeneous_stack(:,:,i)*homogeneous_matrix;
        z(:,i+1) = homogeneous_matrix(1:3,1:3)*z(:,i);
        p_prev(:,i+1) = p_prev(:,i)+homogeneous_stack(1:3,4, i);
        p_cent(:,i) = p_prev(:,i) + homogeneous_matrix(1:3,4);
        jac_lp(:,i) = calculate_link_position_jacobian(z(:,i), revolute(i),p_cent(:,i), p_prev(:,i));
        jac_lo(:,i) = calculate_link_orientation_jacobian(z(:,i), revolute(i));
        jac_mp(:,i) = calculate_motor_position_jacobian(z(:,i), revolute(i),p_cent(:,i), p_prev(:,i));
    end
        
    link_position_jacobian = zeros(num_joints, 3, num_joints);
    link_orientation_jacobian = zeros(num_joints, 3, num_joints);
    motor_position_jacobian = zeros(num_joints, 3, num_joints);
    motor_orientation_jacobian = zeros(num_joints, 3, num_joints);
    
    for i=1:num_joints
        link_position_jacobian(i,:,1:i) = jac_lp(:,1:i);
        link_orientation_jacobian(i,:,1:i) = jac_lo(:,1:i);
        motor_position_jacobian(i,:,1:i-1) = jac_mp(:,1:i-1);
        motor_orientation_jacobian(i,:,1:i) = calculate_motor_orientation_jacobian(z(:,i),jac_lo(:,1:i-1), kri(i));
    end
end
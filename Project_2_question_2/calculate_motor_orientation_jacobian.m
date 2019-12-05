function motor_orientation_jacobian = calculate_motor_orientation_jacobian(z_prev, j_link_prev, kri)

    motor_orientation_jacobian = [j_link_prev kri.*z_prev];
   
end
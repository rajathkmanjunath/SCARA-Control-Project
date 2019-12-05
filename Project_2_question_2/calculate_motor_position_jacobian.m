function motor_position_jacobian = calculate_motor_position_jacobian(z_prev, revolute, pmi, p_prev )
    if nargin < 4
        pmi = 0;
        p_prev = 0;
    end
    if revolute
        motor_position_jacobian = cross(z_prev, (pmi - p_prev));
    else
        motor_position_jacobian = z_prev;
    end
end
function link_orientation_jacobian = calculate_link_orientation_jacobian(z_prev, revolute)
    if revolute
        link_orientation_jacobian = z_prev;
    else
        link_orientation_jacobian = zeros(3,1);
    end
end
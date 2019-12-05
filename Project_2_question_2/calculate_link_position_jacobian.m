function link_position_jacobian = calculate_link_position_jacobian(z_prev, revolute, pli, p_prev)
    if nargin < 4
        pli = 0;
        p_prev = 0;
    end
    if revolute
        link_position_jacobian = cross(z_prev, (pli - p_prev));
    else
        link_position_jacobian = z_prev;
    end
end
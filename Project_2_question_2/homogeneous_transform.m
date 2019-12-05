function homogeneous_matrix = homogeneous_transform(theta, alpha, a, d)

    homogeneous_matrix = zeros(4,4);
    homogeneous_matrix(1,:) = [cos(theta)   -sin(theta)*cos(alpha)  sin(theta)*sin(alpha)   a*cos(theta)];
    homogeneous_matrix(2,:) = [sin(theta)   cos(theta)*cos(alpha)  -cos(theta)*sin(alpha)   a*sin(theta)];
    homogeneous_matrix(3,:) = [0    sin(alpha) cos(alpha)   d];
    homogeneous_matrix(4,:) = [0    0   0   1];

end
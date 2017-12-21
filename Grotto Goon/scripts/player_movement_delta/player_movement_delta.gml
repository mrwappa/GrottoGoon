var h_mov = k_right - k_left;

movement_add = h_mov * acceleration * delta;

movement_sub = min(restitution*delta,abs(x_speed)) * sign(x_speed) * (h_mov == 0);

x_speed = clamp(x_speed + movement_add - movement_sub, -movement_speed,movement_speed);
//y_speed = p_gravity + jump_value;

x += x_speed * delta;
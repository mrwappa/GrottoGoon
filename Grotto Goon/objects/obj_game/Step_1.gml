/// @description 
k_left = keyboard_check(ord("A"));
k_right= keyboard_check(ord("D"));
k_jump  = keyboard_check_pressed(vk_space);
hold_k_jump  = keyboard_check(vk_space);
release_k_jump = keyboard_check_released(vk_space);
k_crouch = keyboard_check(ord("S"));
k_dash = mouse_check_button_pressed(mb_right);
k_attack = mouse_check_button_pressed(mb_left);

//delta = 60/1000000*delta_time;

dtPrevious = dt;

// Store previous internal delta time
dtPrevious = dt;
// Update internal delta time
dt = delta_time/1000000;

// Prevent delta time from exhibiting sporadic behaviour
if (dt > 1/minFPS)
{
    if (dtRestored) 
    { 
        dt = 1/minFPS; 
    } 
    else 
    { 
        dt = dtPrevious;
        dtRestored = true;
    }
}
else
{
    dtRestored = false;
}

delta = dt*timeScale;
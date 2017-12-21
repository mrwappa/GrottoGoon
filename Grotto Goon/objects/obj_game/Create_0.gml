/// @descriptions
window_set_cursor(cr_none);
cursor_sprite = spr_cursor;

TOGGLE_PAUSE = 0;
paused_ = false;
pause_sprite_ = noone;

globalvar nmTest;
nmTest = 0;

//should remove this eventually
globalvar SlowMo;
SlowMo = 1;

globalvar k_left;
globalvar k_right;
globalvar k_jump;
globalvar hold_k_jump;
globalvar release_k_jump;
globalvar k_crouch;
globalvar k_dash;
globalvar k_attack;


globalvar delta;
delta = 1;//1

minFPS = 10;
globalvar timeScale;
timeScale = 1;

// Internal calculated delta time
dt = delta_time/1000000;
// Previous value of internal delta time
dtPrevious = dt;
// Whether or not internal delta time has been restored to previous value
dtRestored = false;
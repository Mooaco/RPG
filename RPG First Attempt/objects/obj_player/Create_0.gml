event_inherited();

// Set Default States (should be with rest of game starting code)
numFollowers = 0;

xMoveHistory = ds_list_create();
yMoveHistory = ds_list_create();

//xMoveHistory = array_create(histroySize, x);
//yMoveHistory = array_create(histroySize, y);

// Create first follower
if (numFollowers = 0) instance_create_layer(x,y,"Followers",obj_follower);

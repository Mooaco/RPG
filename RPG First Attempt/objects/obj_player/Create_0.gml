
// Set Default States (should be with rest of game starting code)
numFollowers = 0;
spd = 6;
moveRemaining = spd * CELL_SIZE;
actions = 0;
maxActions = 2;
endTurn = false;


histroySize = 100;
xMoveHistory = array_create(histroySize, x);
yMoveHistory = array_create(histroySize, y);

// Create first follower
if (numFollowers = 0) instance_create_layer(x,y,"Followers",obj_follower);

// Create unlocked camera
instance_create_depth(x,y,0,obj_unlocked_camera);
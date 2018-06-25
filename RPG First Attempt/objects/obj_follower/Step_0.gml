/// @desc Following the Player

// Number of frames to delay before following
#macro followerDelay 12

// Adding additional delay for each subsequent follower
delay = followerNumber * followerDelay

x = ds_list_find_value(obj_player.xMoveHistory, delay)
y = ds_list_find_value(obj_player.yMoveHistory, delay)
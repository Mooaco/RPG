/// @desc Following the Player

// Number of frames to delay before following
#macro followerDelay 12

// Adding additional delay for each subsequent follower
delay = followerNumber * followerDelay

x = obj_player.xMoveHistory[delay];
y = obj_player.yMoveHistory[delay];
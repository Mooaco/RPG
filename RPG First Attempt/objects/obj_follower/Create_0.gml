/// Spawning

//Move to the player
x = obj_player.x;
y = obj_player.y;

//Assign personal number
followerNumber = obj_player.numFollowers;

// Set the max followers
#macro MaxFollowers 2

//Increase the total
obj_player.numFollowers += 1;


if (obj_player.numFollowers <= MaxFollowers)
{
		instance_create_layer(obj_player.x,obj_player.y,"Followers",obj_follower);
}
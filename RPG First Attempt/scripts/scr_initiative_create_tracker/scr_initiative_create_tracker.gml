///@desc scr_initiative_create_tracker(OwnerID)
///@param OwnerID

var initTracker = instance_create_layer(global.ViewWidth - CELL_SIZE, global.ViewHeight / 2, "Text", obj_init_tracker);

initTracker.ownerID = argument0;
initTracker.name = ownerID.id;
initTracker.hp = ownerID.hp;

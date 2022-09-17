extends Spatial

func update_pos(player_Xpos):
<<<<<<< HEAD
    if player_Xpos > translation.x:
        translation.x += 50 # move ground ahead
=======
	if player_Xpos > translation.x - 50:
		translation.x += 50 # move ground ahead
>>>>>>> 94bf98fe0e58c8beec43143911edd518eaedeb5b

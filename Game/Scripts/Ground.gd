extends Spatial

func update_pos(player_Xpos):
<<<<<<< HEAD
    if player_Xpos > translation.x:
        translation.x += 50 # move ground ahead
=======
	if player_Xpos > translation.x - 50:
		translation.x += 50 # move ground ahead
>>>>>>> 788a366cbb8c47718fecdbaf07cb2ea09cc7dd0b

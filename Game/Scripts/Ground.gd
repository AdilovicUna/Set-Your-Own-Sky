extends Spatial

func update_pos(player_Xpos):
    if player_Xpos > translation.x - 50:
        translation.x += 50 # move ground ahead

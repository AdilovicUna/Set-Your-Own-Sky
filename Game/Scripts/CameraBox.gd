extends CSGBox

var r = 0.0

func increase_roughness():
    r += 0.03
    set_material_param()

func decrease_roughness():
    r -= 0.002
    set_material_param()

func set_material_param():
    var mat = SpatialMaterial.new()
    mat.albedo_color = Color(0,0,0,0)
    mat.metallic_specular = 0
    mat.refraction_enabled = true
    mat.roughness = r
    
    material_override = mat

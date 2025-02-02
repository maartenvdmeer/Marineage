shader_type spatial;

uniform vec4 water_color = vec4(0.0, 0.5, 1.0, 1.0);
uniform float wave_speed = 1.0;
uniform float wave_height = 0.1;
uniform float wave_frequency = 1.0;

void vertex() {
    // Called for every vertex the material is visible on.
    VERTEX.y += sin(VERTEX.x * wave_frequency + TIME * wave_speed) * wave_height;
}

void fragment() {
    // Called for every pixel the material is visible on.
    ALBEDO = water_color.rgb;
    ALPHA = water_color.a;
}

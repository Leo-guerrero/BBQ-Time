varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// passed in from GML
uniform float u_time;
uniform float u_hit_flash_timer;  

void main() {
	
	// gpu takes the color pixel(texel) from the texture 
	// and returns normalized color channels for the vec4
    vec4 base_col = texture2D(gm_BaseTexture, v_vTexcoord);

    // Pulse effect using time
    float pulse = abs(sin(u_time * 8.0)); // speed multiplier for flashing
	
    // Mix between normal color and red
    vec3 red_tint = mix(base_col.rgb, vec3(3.0, 0.0, 0.0), pulse);

    // Only apply when u_hit_flash is 1
    gl_FragColor = vec4(mix(base_col.rgb, red_tint, u_hit_flash_timer), base_col.a);
}

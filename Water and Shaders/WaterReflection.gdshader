shader_type canvas_item;

uniform vec4 waterColor: source_color;
uniform sampler2D noise: repeat_enable;
uniform vec2 distortionScale;
uniform float intesity: hint_range(-1.5, 1.5, 0.001);
uniform float speed;

uniform float waveAmpt;
uniform float waveSpeed;
uniform float wavePeriod;

void fragment() 
{
	float waves = UV.y + sin(UV.x * wavePeriod - TIME * waveSpeed) * cos(0.2 * UV.x * wavePeriod + TIME - waveSpeed)
	 * waveAmpt - waveAmpt;
	float distortion = texture(noise, UV + TIME * speed).x;
	distortion -= 0.5;
	vec4 pixelColor = texture(TEXTURE, UV - (distortionScale * distortion * intesity));
	COLOR.rgb = mix(pixelColor.rgb, waterColor.rgb, waterColor.a);
	//COLOR.rgb += vec3(smoothstep(1.0, 0.9, waves));
	//COLOR.a += smoothstep(1.0, 0.9, waves);
	
}

[gd_resource type="Shader" format=2]

[resource]
code = "shader_type spatial;
render_mode async_visible,blend_mix,depth_draw_opaque,cull_front,diffuse_toon,specular_toon,unshaded,shadows_disabled,ambient_light_disabled,ensure_correct_normals;
uniform vec2 scroll_speed = vec2(3.0, 5.0);
uniform float static_intensity : hint_range(0.0, 1.0, 0.05) = 0.25;
uniform float camera_distance = 1.0;
uniform vec4 color : hint_color = vec4(1.0);
uniform float tex_scale : hint_range(0.5, 10.0, 0.01) = 3.0;
uniform sampler2D albedo_tex : hint_albedo;

float rand(vec2 co){
	return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void fragment() {
	vec2 base_uv = vec2(SCREEN_UV.x - 0.5, -SCREEN_UV.y + 0.5) * (1.0 / tex_scale );
	base_uv.x *= VIEWPORT_SIZE.x / VIEWPORT_SIZE.y;
	
	vec4 tex = texture(albedo_tex, base_uv * (camera_distance + 0.5) + (scroll_speed * TIME * 0.1));
	
	tex.rgb = mix(vec3(0.0), tex.rgb, tex.a);
	
	float noise = pow(rand(UV * TIME * 0.1), 3) * static_intensity;
	vec3 cnoise = mix(color.rgb, vec3(1.0) - color.rgb, noise);
	
	vec3 final = mix(cnoise * tex.rgb, cnoise, noise * 0.5);
	
	ALBEDO = final;
}
"

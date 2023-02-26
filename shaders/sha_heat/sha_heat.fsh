//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;

const float speed = 0.002;
const float Xfrequency = 10.0;
const float Xsize = 0.01;

void main()
{
    float Horizontal_Wave = sin(time * speed + v_vTexcoord.y * Xfrequency) * (Xsize * v_vTexcoord.x);
	vec4 distort = v_vColour * texture2D( gm_BaseTexture, vec2( v_vTexcoord.x + Horizontal_Wave, v_vTexcoord.y));
	gl_FragColor = distort;
}

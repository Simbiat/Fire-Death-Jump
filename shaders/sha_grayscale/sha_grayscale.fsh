//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 lum = vec4(0.299, 0.587, 0.114, 1.0);
	vec4 tone = vec4(1.0, 1.0, 1.0, 1.0);
	vec4 colorMap = texture2D(gm_BaseTexture, v_vTexcoord);
    float bw = dot(colorMap.rgb, lum.rgb);
    gl_FragColor = vec4( bw * tone.rgb, colorMap.a);
}

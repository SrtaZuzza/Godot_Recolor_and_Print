shader_type canvas_item;
render_mode blend_mix, unshaded;

// EXACT QUANTITY OF HORIZONTAL FRAMES OF THE FULL IMAGE
uniform float h_frames = 1.0;
// EXACT QUANTITY OF VERTICAL FRAMES OF THE FULL IMAGE
uniform float v_frames = 2.0;

uniform sampler2D chosenPrint;
uniform bool hasPrint = false;

uniform vec4 replaceGreen : hint_color;
uniform vec4 replaceRed : hint_color;
uniform vec4 replaceBlue : hint_color;
uniform vec4 replaceYellow : hint_color;
uniform vec4 replaceMagenta : hint_color;
uniform vec4 replaceCyan : hint_color;
uniform vec4 replaceWhite : hint_color;
uniform vec4 replaceGrey : hint_color;
uniform vec4 replaceBlack : hint_color;

vec4 replace(vec4 targetColor, vec4 replacementColor, vec4 pattern) {
	if (hasPrint == true) {
		return replacementColor * targetColor * vec4(pattern.r, pattern.g, pattern.b, 1.0);
	} else {
		return replacementColor * targetColor;
	}
}

void fragment() {
	vec4 transfer = texture(chosenPrint, mod(vec2(UV.x * h_frames, UV.y * v_frames), vec2(1.0, 1.0)));
	vec4 texColor = texture(TEXTURE, UV);
	COLOR = texColor;
	
	if(texColor.a > 0.0) {
		// RED
		if(texColor.r - (texColor.g * 100.0 + texColor.b * 100.0) > 0.0) 
			COLOR = replace(vec4(texColor.r, texColor.r, texColor.r, 1.0), replaceRed, transfer);
		// GREEN
		else if(texColor.g - (texColor.r * 100.0 + texColor.b * 100.0) > 0.0)
			COLOR = replace(vec4(texColor.g, texColor.g, texColor.g, 1.0), replaceGreen, transfer);
		// BLUE
		else if(texColor.b - (texColor.r * 100.0 + texColor.g * 100.0) > 0.0)
			COLOR = replace(vec4(texColor.b, texColor.b, texColor.b, 1.0), replaceBlue, transfer);
		// MAGENTA
		else if((texColor.r + texColor.b) - (texColor.g * 100.0) > 0.0)
			COLOR = replace(vec4(texColor.r, texColor.b, texColor.b, 1.0), replaceMagenta, transfer);
		// YELLOW
		else if((texColor.r + texColor.g) - (texColor.b * 100.0) > 0.0)
			COLOR = replace(vec4(texColor.r, texColor.g, texColor.g, 1.0), replaceYellow, transfer);
		// CYAN
		else if((texColor.b + texColor.g) - (texColor.r * 100.0) > 0.0)
			COLOR = replace(vec4(texColor.b, texColor.g, texColor.b, 1.0), replaceCyan, transfer);
		// WHITE
		else if(texColor == vec4(1.0, 1.0, 1.0, 1.0))
			COLOR = replace(vec4(1.0, 1.0, 1.0, 1.0), replaceWhite, transfer);
		// GREY
		else if(distance(COLOR, vec4(0.5, 0.5, 0.5, 1.0)) < 0.005)
			COLOR = replace(vec4(1.0, 1.0, 1.0, 1.0), replaceGrey, transfer);
		// BLACK
		else if(distance(COLOR, vec4(0.0, 0.0, 0.0, 1.0)) < 0.005)
			COLOR = replace(vec4(1.0, 1.0, 1.0, 1.0), replaceBlack, transfer);
	}
}
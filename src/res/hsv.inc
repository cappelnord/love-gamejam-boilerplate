const number THREESIXTY_DEG = 1.0;
const number SIXTY_DEG = 0.166666667;

vec3 rgb2hsv(vec3 inc) {

    inc = clamp(inc, 0.0, 1.0);

	number r = inc.r;
	number g = inc.g;
	number b = inc.b;

	number maxv = max(r, max(g, b));
	number minv = min(r, min(g, b));
	
	number h = 0.0;
	number s = 0.0;
	number v = maxv;

	number maxmindif = (maxv-minv);

	if(maxv != 0.0) {
		s = maxmindif / maxv;
	}

	if(maxv == r) {
		h = ((g-b) / maxmindif);
	} else if (maxv == g) {
		h = 2.0 + ((b-r) / maxmindif);
	} else if (maxv == b) {
		h = 4.0 + ((r-g) / maxmindif);
	}

	h *= SIXTY_DEG;

	if(h < 0.0) {
		h += THREESIXTY_DEG;
	}

	return vec3(h, s, v);
}

vec3 hsv2rgb(vec3 inc) {

    inc = clamp(inc, 0.0, 1.0);

	vec3 outc;
	number h = inc.r;
	number s = inc.g;
	number v = inc.b;
	
	int hi = int((h * 6.0));
	number f = (h*6.0) - float(hi);

	number p = v * (1.0 - s);
	number q = v * (1.0 - s * f);
	number t = v * (1.0 - s * (1.0 - f));

	outc = vec3(v, t, p);

	if(hi == 1) outc = vec3(q, v, p);
	if(hi == 2) outc = vec3(p, v, t);
	if(hi == 3) outc = vec3(p, q, v);
	if(hi == 4) outc = vec3(t, p, v);
	if(hi == 5) outc = vec3(v, p, q);

	return outc;
}

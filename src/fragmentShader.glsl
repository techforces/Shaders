#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float plot(vec2 st, float pct){
    return  smoothstep( pct-0.02, pct, st.y) - smoothstep( pct, pct+0.02, st.y);
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;
    
    // Beautiful wave
    // float y = sin(u_time - st.x)/2.0 + 0.5;

    // Why author suggested multiplication by PI???
    // float y = sin(st.x * PI + u_time)/2.0 + 0.5;

    
    //float y = mod(st.x,0.5); // return x modulo of 0.5
    //float y = fract(st.x); // return only the fraction part of a number
    //float y = ceil(st.x);  // nearest integer that is greater than or equal to x
    //float y = floor(st.x); // nearest integer less than or equal to x
    //float y = sign(st.x);  // extract the sign of x
    //float y = abs(st.x);   // return the absolute value of x
    //float y = clamp(st.x,0.0,1.0); // constrain x to lie between 0.0 and 1.0
    //float y = min(0.0,st.x);   // return the lesser of x and 0.0
    //float y = max(0.0,st.x);   // return the greater of x and 0.0 

     float y = fract(sin(st.x + u_time));

    vec3 color = vec3(y);

    // Plot a line
    float pct = plot(st, y);
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

    gl_FragColor=vec4(color,1.0);
}
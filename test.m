s = tf('s');
G = (100*s+100)/((s^2)+s+1);
a = stepinfo(G)
fb = 1;
fb_sys = feedback (G,fb)


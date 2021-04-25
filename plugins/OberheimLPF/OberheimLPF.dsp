import("stdfaust.lib");

freq = vslider("freq",200.0,20.0,20000.0,1.0);
Q = vslider("Q",0.1,0.0,1.0,0.1);


process = _ : ve.oberheimHPF(centerfreq,Q) : _ 
with {
 centerfreq = tan(w(freq));
 w(f) = (2 * f) / ma.SR;
};

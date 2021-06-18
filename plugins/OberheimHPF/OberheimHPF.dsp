import("stdfaust.lib");

// freq = vslider("freq",200.0,20.0,20000.0,0.001);
normFreq = vslider("normFreq", 0.5, 0.0,1.0,0.0001);
Q = vslider("q",0.1,0.0,10.0,0.001);

process = _ : ve.oberheimHPF(normFreq,Q) : _ 
// with {
//  centerfreq = w(freq);
//  w(f) = 2 * ma.PI * f / ma.SR;
// }
;

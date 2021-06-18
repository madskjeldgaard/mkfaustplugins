import("stdfaust.lib");

normFreq = vslider("normFreq", 0.5, 0.0,1.0,0.0001);
Q = vslider("q",0.1,0.0,10.0,0.001);

process = _ : ve.korg35HPF(normFreq,Q) : _;


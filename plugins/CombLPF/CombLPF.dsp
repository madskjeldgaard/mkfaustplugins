import("stdfaust.lib");
import("../lib/mkdelay.dsp");

order = 4;

delay = vslider("delaytime",0.1,0.001,2.0,0.01) : *(ma.SR) : si.smoo;
// maxdelay = vslider("maxdelay",1.0,0.001,100.0,0.01) * ma.SR;
maxdelay = 1 * ma.SR;
fb = vslider("fb",0.1,0.001,2.0,0.01);
lpf = vslider("cutoff",500,20.0,20000.0,1);

numDelays = 9;
// process = _ <: par(delayNum, numDelays, delaySig(delayNum)) :> *(1.0/numDelays) : _ with{
// 	delaySig(i) = mkd.comblpf(order, maxdelay * (i+1), delay * (i+1+0.18241), fb, lpf);
// };

delayOffset=0.195282;

process = _ <: mkd.parallel_comb_lpf(numDelays, order, maxdelay, delay, delayOffset, fb, lpf) :> _ ;

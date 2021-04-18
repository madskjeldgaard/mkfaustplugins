declare name "CombLPFParallelSplayed";
declare author "Mads Kjeldgaard";
declare copyright "Mads Kjeldgaard";
declare version "1.00";
declare license "GPL";

import("stdfaust.lib");
import("../../lib/mkdelay.dsp");

// Static
order = 4;
numDelays = 4;
maxdelay = 1 * ma.SR;

// Controls
delay = vslider("delaytime",0.1,0.001,2.0,0.01) : *(ma.SR) : si.smoo;
fb = vslider("fb",0.1,0.001,2.0,0.01);
lpf = vslider("cutoff",500,20.0,20000.0,1);
spread = vslider("stereospread",0.5,0.0,1.0,0.00001) : si.smoo;
rotate = vslider("rotate",0.0,0.0,1.0,0.00001) : si.smoo;
delayOffset=vslider("delayoffset",0.5,0.0,1.0,0.00001) : si.smoo;

// Process
process = _ <: mkd.parallel_comb_lpf_splayed(numDelays, order, maxdelay, delay, delayOffset, fb, lpf, spread, rotate);

declare name "CombLPF";
declare author "Mads Kjeldgaard";
declare copyright "Mads Kjeldgaard";
declare version "1.00";
declare license "GPL";

import("stdfaust.lib");
import("../../lib/mkdelay.dsp");

order = 4;
maxdelay = 1 * ma.SR;

delay = vslider("delaytime",0.1,0.001,2.0,0.01) : *(ma.SR) : si.smoo;
fb = vslider("fb",0.1,0.001,2.0,0.01);
lpf = vslider("cutoff",500,20.0,20000.0,1);

process = _ : mkd.comblpf(order, maxdelay, delay, fb, lpf);

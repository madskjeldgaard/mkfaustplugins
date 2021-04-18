import("stdfaust.lib");
import("../lib/mkfilters.dsp");

mkd = environment {
	   comblpf(order, maxdelay, delay, fb, lpfcutoff) = (+ : de.fdelayltv(order, maxdelay, delay)) ~ (* (fb) : mkf.onepolelpf(lpfcutoff));
	   parallel_comb_lpf(numDelays, order, maxdelay, delay, delayOffset, fb, lpf) = 
		   par(delayNum, numDelays, delaySig(delayNum)) 
			   with{
				   delaySig(i) = comblpf(order, maxdelay * (i+1), delay * (i+1+delayOffset), fb, lpf);
			   };
};

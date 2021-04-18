// By Dario Sanfilippo: https://www.dariosanfilippo.com/blog/2020/faust_recursive_circuits/
import("stdfaust.lib");

lowpass(cf, x) = b0 * x : + ~ *(-a1)
    with {
        b0 = 1 + a1;
        a1 = exp(-w(cf)) * -1;
        w(f) = 2 * ma.PI * f / ma.SR;
    };

freq= vslider("freq",200,10,20000,1);
input = _;

process = lowpass(freq, input) : _;

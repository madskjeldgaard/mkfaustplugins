(
// s.record;
Ndef(\1, { 
	var sig = BowedString.ar(
		bow_position: SinOsc.ar(LFNoise2.ar(0.1).lag * 100), 
		bow_pressure: 0.8, //SinOsc.ar(0.025).range(0.21,0.9), 
		string_stiffness: LFNoise2.ar(1.1).range(0.1,0.9)
	);

	Limiter.ar(sig)

	// OberheimLPFVa.ar(
	// 	PinkNoise.ar(0.25), 
	// 	q:  0.85, 
	// 	freq: LFSaw.kr(0.1).range(0.0,1.0).poll
	// ).poll
	}
).play;

Ndef(\2, { 
	// PluckedString.ar(Impulse.ar(1))
	var imp = Impulse.ar(1);
	StrangeConstruct.ar(
		in1: imp, 
		damping: 0.2, 
		stiffness: TRand.ar(0.001,0.01, trig: imp)
	) * 0.125
}
).play;

Ndef(\3, { 
	var imp = Impulse.ar(1);
	PluckedString.ar(in1: SinOsc.ar(1), damping: 0.002, friction: 0.00001, stiffness:0.1) * 0.3
}
).play;

Ndef(\4, {
	var imp = Impulse.ar(1);
	TwoMassChain.ar(imp, k1: 0.0002, k2: 0.003, z1: 0.00005) * 0.10
}).play;


)

(
Ndef(\5, {
	var imp = WhiteNoise.ar(0.25);
	OberheimLPF.ar(imp, q:2.21, normfreq: LFSaw.kr(0.1).unipolar.poll)
}).play;

)
(
Ndef(\6, {
	var imp = WhiteNoise.ar(0.25);
	Korg35LPF.ar(imp, q:2.21, normfreq: LFSaw.kr(0.1).unipolar.poll)
}).play;

)

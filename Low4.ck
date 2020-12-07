MidiOut mout;
MidiMsg msg;
1 => int port;
if(!mout.open(port)){
    <<<"Error: MIDI port didn't open on port: ", port>>>;
    me.exit();
}

//Note length
BPM bpm;
bpm.tempo(170);
bpm.quarterNote => dur qn;
bpm.eighthNote => dur en;
bpm.sixteenthNote => dur sn;
sn+en => dur eps;
qn*2 => dur hn;


//Notes

//
[34,50,-1,-1,57,-1] @=> int L1[];
[46,53,-1,-1,62,-1] @=> int L2[];
[-1,-1,-1,46,65,46] @=> int L3[];

[36,52,48,48] @=> int L4[];
[48,55,-1,52] @=> int L5[];
[-1,62,-1,55] @=> int L6[];
[-1,-1,-1,62] @=> int L7[];

[34,50,-1,-1,50,-1] @=> int L8[];
[46,53,-1,-1,53,-1] @=> int L9[];
[-1,-1,-1,46,58,46] @=> int L10[];

[36,52,48,48,-1,48] @=> int L11[];
[48,55,-1,52,-1,-1] @=> int L12[];
[-1,62,-1,55,-1,-1] @=> int L13[];
[-1,-1,-1,62,-1,-1] @=> int L14[];


[eps,sn,sn,eps,qn,qn] @=> dur L1D[];
[eps,sn,eps,sn+qn*2] @=> dur L2D[];
[eps,sn,eps,sn,qn,qn] @=> dur L2_1D[];



Player p;


spork ~ p.play(mout,msg,L1,L1D);
spork ~ p.play(mout,msg,L2,L1D);
spork ~ p.play(mout,msg,L3,L1D);
2.875::second => now;
spork ~ p.play(mout,msg,L4,L2D);
spork ~ p.play(mout,msg,L5,L2D);
spork ~ p.play(mout,msg,L6,L2D);
spork ~ p.play(mout,msg,L7,L2D);
2.875::second => now;
spork ~ p.play(mout,msg,L8,L1D);
spork ~ p.play(mout,msg,L9,L1D);
spork ~ p.play(mout,msg,L10,L1D);
2.875::second => now;
spork ~ p.play(mout,msg,L11,L2_1D);
spork ~ p.play(mout,msg,L12,L2_1D);
spork ~ p.play(mout,msg,L13,L2_1D);
spork ~ p.play(mout,msg,L14,L2_1D);
2.875::second => now;
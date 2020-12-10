MidiOut mout;
MidiMsg msg;
1 => int port;
if(!mout.open(port)){
    <<<"Error: MIDI port didn't open on port: ", port>>>;
    me.exit();
}

//Note length
BPM bpm;
bpm.tempo(75);
bpm.quarterNote => dur qn;
bpm.eighthNote => dur en;
bpm.sixteenthNote => dur sn;
qn*2 => dur hn;


//Notes

[50,57,62,57,62,57,62,57,62,57,62,57, 
43,50,55,50,55,50,45,52,57,52,57,52] @=> int L1[];
[47,54,59,54,59,54,59,54,59,54,59,54,
48,55,61,55,61,55,61,55,61,55,61,55] @=> int L2[];
[47,54,59,54,59,54,45,52,57,52,57,52,
43,50,55,50,55,50,45,52,57,52,57,52] @=> int L3[];
[43,50,55,50,55,50,55,50,55,50,55,50,
46,53,59,54,59,54,48,55,61,55,61,55] @=> int L4[];



[sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn] @=> dur short[];
[sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,
sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn] @=> dur L1D[];
[sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,
sn,sn,sn,sn,sn,sn,qn*3] @=> dur L2D[];

Player p;


spork ~ p.play(mout,msg,L1,L1D);
4.8::second => now; //~58

spork ~ p.play(mout,msg,L2,L1D);
4.8::second => now; 
spork ~ p.play(mout,msg,L2,L1D);
4.8::second => now; //~1:09

spork ~ p.play(mout,msg,L1,L1D);
4.8::second => now; //~1:14

spork ~ p.play(mout,msg,L3,L1D);
4.8::second => now; //~1:19

spork ~ p.play(mout,msg,L2,L1D);
4.8::second => now; //~1:24

spork ~ p.play(mout,msg,L4,L1D);
4.8::second => now; //~1:29





























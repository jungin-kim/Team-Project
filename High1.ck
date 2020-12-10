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
[
74, 73, 74, 69, 66, 69, 74, 73, 74, 69, 66, 69, 
74, 73, 74, 69, 67, 69, 74, 73, 74, 67, 79, 67
] @=> int H1[];

[
sn, sn, sn, sn, sn, sn, sn, sn, sn, sn, sn, sn,
sn, sn, sn, sn, sn, sn, sn, sn, sn, sn, sn, sn
] @=> dur H1D[];

[
74, 73, 74, 69, 66, 69, 69, 74, 74, 69,
72,                 71, 69, 67,
65,     67,     69,     67,     62, 60,
60,             -1, 59, 60, 62
] @=> int H2[];

[
sn, sn, sn, sn, sn, sn, sn, sn, sn, sn*3,
qn*1.5,             sn, sn, qn,
en,     en,     en,     qn,     sn, sn,
qn,             sn, sn/2, sn/2, qn*1.5
] @=> dur H2D[];

Player p;

spork ~ p.play(mout,msg,H1,H1D);
4.8::second => now;
spork ~ p.play(mout,msg,H1,H1D);
4.8::second => now;
spork ~ p.play(mout,msg,H2,H2D);
9.6::second => now;
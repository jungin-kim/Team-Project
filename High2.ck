MidiOut mout;
MidiMsg msg;
1 => int port;
if(!mout.open(port)){
    <<<"Error: MIDI port didn't open on port: ", port>>>;
    me.exit();
}

//Note length
BPM bpm;
bpm.tempo(135);
bpm.quarterNote => dur qn;
bpm.eighthNote => dur en;
bpm.sixteenthNote => dur sn;
qn*2 => dur hn;


//Notes
[
74, 73, 74, 69, -1, 74, 73, 74, 69, -1,
74, 73, 74, 67, -1, 74, 73, 74, 67, -1, 68
] @=> int H1[];

[
86, 85, 86, 81, -1, 86, 85, 86, 81, -1,
86, 85, 86, 79, -1, 86, 85, 86, 79, -1, 80
] @=> int H2[];


[
en, sn, en, sn, qn*1.75, en, sn, en, sn, qn*1.75,
en, sn, en, sn, qn*1.75, en, sn, en, sn, en, hn
] @=> dur H1D[];

Player p;

spork ~ p.play(mout,msg,H1,H1D);
spork ~ p.play(mout,msg,H2,H1D);
5.75::second => now;
spork ~ p.play(mout,msg,H1,H1D);
spork ~ p.play(mout,msg,H2,H1D);
5.75::second => now;
MidiOut mout;
MidiMsg msg;
1 => int port;
if(!mout.open(port)){
    <<<"Error: MIDI port didn't open on port: ", port>>>;
    me.exit();
}

//Note length
BPM bpm;
bpm.tempo(128);
bpm.quarterNote => dur qn;
bpm.eighthNote => dur en;
bpm.sixteenthNote => dur sn;
qn*2 => dur hn;
hn*2 => dur wn;


//Notes
[
-1, 86, 86, 81, 81, 74, 81, 79, 78, 79, 74, 73, 74, -1, 69, -1,
74, -1, 76, -1, 77, -1, 76, 84, 79, -1, 76, -1, 72, -1,
74, -1, 76, -1, 77, -1, 76, -1, 79, 79
] @=> int H1[];

[
-1, 74, 74, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, 72, -1, 74, -1, 72, 72,
-1, -1, 72, -1, 74, -1, 72, -1, 72, -1, 72, -1, 67
] @=> int H2[];

[
en, en*1.5, qn, en, qn, qn, qn, en, sn, hn*1.125, en, sn, qn, en*1.5, en*1.375, en,
sn, en, sn, en, sn, en, qn*1.25, en*1.5, sn, sn*0.5, sn, sn*0.5, sn, qn,
sn, en, sn, en, sn, en, qn*1.25, en*1.75, en*1.5, hn
] @=> dur H1D[];

[
en, en*1.5, qn, en, qn, qn, qn, en, sn, hn*1.125, en, sn, qn, en*1.5, en*1.375, en,
sn, en, sn, en, sn, en, qn*1.25, hn*1.375,
sn, en, sn, en, sn, en, en, en, sn, en, sn, en*1.875, hn
] @=> dur H2D[];

Player p;

spork ~ p.play(mout,msg,H1,H1D);
spork ~ p.play(mout,msg,H2,H2D);
12::second => now;
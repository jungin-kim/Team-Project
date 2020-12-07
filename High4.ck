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
-1, 86, 86, 81, 81, 74, 81, 79, 78, 79, 74, 73, 74, -1, 69, 74,
-1, 69, 74, 76, 78, 79, 78, 77, 76, 74
] @=> int H1[];

[
-1, 74, 74, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1
] @=> int H2[];

[
en, en*1.5, qn, en, qn, qn, qn, en, sn, hn*1.125, en, sn, qn, en*1.5, en*1.25, hn,
en, sn, qn*1.25, qn*1.25, en*1.5, hn*1.25, sn, sn, sn, sn
] @=> dur H1D[];

Player p;

spork ~ p.play(mout,msg,H1,H1D);
spork ~ p.play(mout,msg,H2,H1D);
12::second => now;
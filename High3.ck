MidiOut mout;
MidiMsg msg;
1 => int port;
if(!mout.open(port)){
    <<<"Error: MIDI port didn't open on port: ", port>>>;
    me.exit();
}

//Note length
BPM bpm;
bpm.tempo(155);
bpm.quarterNote => dur qn;
bpm.eighthNote => dur en;
bpm.sixteenthNote => dur sn;
qn*2 => dur hn;
hn*2 => dur wn;


//Notes
[
-1, -1, -1, -1, -1, 76, -1, -1, 86, -1, -1, -1
] @=> int H1[];

[
-1, 77, 79, 81, 79, 79, 81, -1, 83, 83, 82, 81
] @=> int H2[];

[
-1, -1, -1, -1, -1, 84, -1, -1, 74, -1, -1, -1
] @=> int H3[];


[
qn, qn, qn, qn, qn, hn, en, sn/4, wn, sn, en, hn

] @=> dur H1D[];

Player p;

spork ~ p.play(mout,msg,H1,H1D);
spork ~ p.play(mout,msg,H2,H1D);
5.75::second => now;

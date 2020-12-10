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
-1, 86, 86,     -1, -1,     -1,     -1,
-1, -1, -1,         -1, -1, -1,     -1,
74,                 -1,     -1,     78,
79,         -1, -1, -1,
-1, 86, 86,     -1, -1,     -1,     -1,
-1, -1, -1,         -1, -1, -1,     -1,
-1,     -1,     69, -1,     -1,     -1,
-1,     -1,     -1, -1      -1,     79,
79,                                 -1, -1
] @=> int H1[];

[
-1, 81, 81,     81, 81,     74,     81,
79, 78, 79,         74, 73, 74,     -1,
69,                 74,     76,     74,
72,         78, -1, 74,
-1, 81, 81,     81, 81,     74,     81,
79, 78, 79,         74, 73, 74,     -1,
65,     67,     65, 67,     84,     67,
74,     76,     77, 76,     72,     72,
74,                                 78, 79
] @=> int H2[];

[
-1, 74, 74,     74, 74,     69,     74,
72, -1, 72,         67, -1, 67,     69,
62,                 69,     69,     69,
67,         72, 76, 67,
-1, 74, 74,     74, 74,     69,     74,
72, -1, 72,         67, -1, 67,     69,
58,     62,     62, 60,     72,     60,
70,     70,     70, 67,     67,     67,
69,                                 74, -1
] @=> int H3[];

[
en, sn, en,     sn, en,     en,     en,
sn, sn, qn,         sn, sn, en,     en,
qn*1.5,             en,     en,     en,
qn,         sn, sn, qn*1.5,
en, sn, en,     sn, en,     en,     en,
sn, sn, qn,         sn, sn, en,     en,
en,     en,     en, en,     en,     en,
en,     en,     en, en,     en,     en,
qn*2.5,                             sn, sn
] @=> dur H1D[];

Player p;

spork ~ p.play(mout,msg,H1,H1D);
spork ~ p.play(mout,msg,H2,H1D);
spork ~ p.play(mout,msg,H3,H1D);
21.6::second => now;
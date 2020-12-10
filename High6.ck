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
81, 82, 81, 82, 81,             86, 81,
84,             82, 81, 79,     76, 79,
78, 79, 78, 79, 86,     81,     74, 76,
77,     79,     81,     79,     74,     72,
74,                 81,
84,                 82,
81,                 74,
77,     79,     81,     79,     74,     72,
74, 73, 74, 69, 66, 69, 74
] @=> int H1[]; 

[
-1, -1, -1, -1, -1,             74, 74,
77,             -1, -1, -1,     -1, 76,
-1, -1, -1, -1, 74,     69,     -1, -1,
70,     70,     74,     72,     -1,     -1,
62,                 69,
72,                 70,
69,                 62,
70,     70,     74,     72,     -1,     -1,
-1, -1, -1, -1, -1, -1, 62
] @=> int H2[];

[
-1, -1, -1, -1, -1,             -1, -1,
74,             74, -1, 72,     72, 72,
-1, -1, -1, -1, -1,     -1,     -1, -1,
-1,     -1,     -1,     -1,     -1,     -1,
-1,                 -1,
-1,                 -1,
-1,                 -1,
-1,     -1,     70,     -1,     -1,     -1,
-1, -1, -1, -1, -1, -1, -1
] @=> int H3[];

[
sn, sn, sn, sn, qn*1.5,         sn, sn,
qn,             sn, sn, en,     en, en,
sn, sn, sn, sn, en,     qn,         sn, sn,
en,     en,     en,     en,     en*1.5, sn,
qn*1.5, qn*1.5, qn*1.5, qn*1.5, qn*1.5, qn*1.5,
en,     en,     en,     en,     en,     en,
sn, sn, sn, sn, sn, sn, qn*3.5
] @=> dur H1D[];

Player p;

spork ~ p.play(mout,msg,H1,H1D);
spork ~ p.play(mout,msg,H2,H1D);
spork ~ p.play(mout,msg,H3,H1D);
24::second => now;
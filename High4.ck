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
-1, -1, -1,          93,     91,     -1,     84,
86,         -1           -1,         -1,     -1,
-1, -1, -1,              -1,     -1,     -1
] @=> int H1[]; 

[
89, 88, 86,          86,     -1,     -1,     79,
81,         69,          81,         79,     78,
76, 74, 74,              -1,     74,     73
] @=> int H2[];

[
82, -1, 82,          82,     84,     86,     76,
74,         62,          69,         67,     66,
64, 67, 67,              -1,     69,     69
] @=> int H3[];

[
sn, sn, en*1.5,      sn,     en,     en,     en,
en*1.5,     en*1.5,      en*1.5,     en,     sn,
sn, sn, en*2,              en,     en,     en

] @=> dur H1D[];

Player p;

spork ~ p.play(mout,msg,H1,H1D);
spork ~ p.play(mout,msg,H2,H1D);
spork ~ p.play(mout,msg,H3,H1D);
7.2::second => now;
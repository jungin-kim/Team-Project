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
74,         74,     -1, 74,     74,     73,
74,         76,     78, 78, 76, 76, 74, 74, 73,
74,         -1,         81,         79,     78,
-1, -1, -1,             -1,     -1,     -1, 
81,             79, 78, 76, 74, 74,     74, 76, 
77, 76, 74,         81, 79,     84,     82
] @=> int H1[]; 

[
69,         69,     69, 69,     69,     66,
67,         71,     71, 73, -1, -1, -1, -1, -1,
69,         69,         69,         67,     66,
76, 74, 74,             -1,     78,     79,
74,             74, 74, -1, -1, -1,     -1, -1,
70, -1, 70,         70, 72,     79,     -1
] @=> int H2[];

[
62,         62,     62, 66,     66,     61,
62,         67,     67, 69, 69, 69, 69, 69, 69,
62,         62,         -1,         -1,     -1,
64, 67, 67,             -1,     66,     67,
69,             69, 69, 69, 69, 69,     69, 69, 
-1, -1, -1,         74, 76,     76,     76
] @=> int H3[];

[
en*1.5,     en,     sn,     en,     en,     en,
en*1.5,     en,     sn, sn, sn, sn, sn, sn, sn,
en*1.5,     en*1.5,     en*1.5,     en,     sn,
sn, sn, qn,             en,     en,     en,
qn,             sn, sn, sn, sn, en,     sn, sn, 
sn, sn, en*1.5,     sn, en,     en,     en
] @=> dur H1D[];

Player p;

spork ~ p.play(mout,msg,H1,H1D);
spork ~ p.play(mout,msg,H2,H1D);
spork ~ p.play(mout,msg,H3,H1D);
14.4::second => now;
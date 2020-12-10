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
-1, 86,     -1,     -1,     -1,
86,         -1,         93,         91,     90,
-1, -1, -1,             -1,     -1,     -1,
86,         86,     86,     86,     86,     85,
86,         88,     90, 90, 88, 88, 86, 86, 85,
86,         -1,         93,         91,     90,
88, 86, 86,             -1,     -1,     -1,
93,             91, 90, 88, -1, -1,     -1, -1
] @=> int H1[]; 

[
81, 81,     81,     81,     85,
81,         81,         81,         79,     78,
76, 79, 79,             -1,     81,     81,
81,         81,     81,     81,     81,     78,
79,         83,     83, 85, -1, -1, -1, -1, -1,
81,         81,         81,         79,     78,
76, 79, 79,             -1,     90,     91,
86,             86, 86, -1, 86, 86,     86, 88
] @=> int H2[];

[
74, 74,     74,     74,     76,
74,         74,         -1,         -1,     -1,
88, 86, 86,             -1,     86,     85,
74,         74,     74,     78,     78,     73,
74,         79,     79, 81, 81, 81, 81, 81, 81,
74,         74,         -1,         -1,     -1,
-1, -1, -1,             -1,     78,     79,
81,             81, 81, 81, 81, 81,     81, 81
] @=> int H3[];

[
sn, en,     qn,     en,     en,
en*1.5,     en*1.5,     en*1.5,     en,     sn,
sn, sn, en*2,               en,     en,     en,
en*1.5,     en,     sn,     en,     en,     en,
en*1.5,     en,     sn, sn, sn, sn, sn, sn, sn,
en*1.5, en*1.5,         en*1.5,     en,     sn,
sn, sn, en*2,               en,     en,     en,
qn,             sn, sn ,sn, sn, en,     sn, sn
] @=> dur H1D[];

Player p;

spork ~ p.play(mout,msg,H1,H1D);
spork ~ p.play(mout,msg,H2,H1D);
spork ~ p.play(mout,msg,H3,H1D);
20.4::second => now;
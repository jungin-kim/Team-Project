MidiOut mout;
MidiMsg msg;
1 => int port;
if(!mout.open(port)){
    <<<"Error: MIDI port didn't open on port: ", port>>>;
    me.exit();
}

//Note length
BPM bpm;
bpm.tempo(138);
bpm.quarterNote => dur qn;
bpm.eighthNote => dur en;
bpm.sixteenthNote => dur sn;
qn*2 => dur hn;


//Notes

[62,61,62,57, -1, 62,61,62,57, -1 ,
60,59,50,55, -1, 60,59,50,55, -1, 49] @=> int H1[];

[62,61,62,57, -1, 62,61,62,57, -1 ,
60,59,50,55, -1, 60,59,50,55, -1, 37] @=> int H2[];

[en, sn, en, sn, qn*1.75, en, sn, en, sn, qn*1.75,
en, sn, en, sn, qn*1.75, en, sn, en, sn, en, hn, qn*1.75] @=> dur H1D[];

Player p;


spork ~ p.play(mout,msg,H1,H1D);
spork ~ p.play(mout,msg,H2,H1D);

6::second => now;
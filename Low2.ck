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

[50,-1,50,50,50,  -1,-1,-1,-1,-1,
48,-1,48,48,48, -1,-1,-1,-1,-1,-1] @=> int H1[];
[-1,54,-1,54,54,  -1,-1,-1,-1,-1,
-1,52,-1,52,52, -1,-1,-1,-1,-1,-1] @=> int H2[];
[-1,57,-1,57,57,  -1,-1,-1,-1,-1,
-1,57,-1,57,57, -1,-1,-1,-1,-1,-1] @=> int H3[];
[-1,61,-1,61,61,  -1,-1,-1,-1,-1,
-1,62,-1,62,62, -1,-1,-1,-1,-1,-1] @=> int H4[];

[en, sn, en, sn, qn*1.75, en, sn, en, sn, qn*1.75,
en, sn, en, sn, qn*1.75, en, sn, en, sn, en, hn, qn*1.75] @=> dur H1D[];

Player p;


spork ~ p.play(mout,msg,H1,H1D);
spork ~ p.play(mout,msg,H2,H1D);
spork ~ p.play(mout,msg,H3,H1D);
spork ~ p.play(mout,msg,H4,H1D);
5.75::second => now;
spork ~ p.play(mout,msg,H1,H1D);
spork ~ p.play(mout,msg,H2,H1D);
spork ~ p.play(mout,msg,H3,H1D);
spork ~ p.play(mout,msg,H4,H1D);
5.75::second => now;
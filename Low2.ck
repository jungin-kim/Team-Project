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

[50,-1,-1,50,  -1,-1,-1,-1,
48,-1,-1,48, -1,-1,-1,-1,-1] @=> int H1[];
[-1,54,-1,54,  -1,-1,-1,-1,
-1,52,-1,52, -1,-1,-1,-1,-1] @=> int H2[];
[-1,57,-1,57,  -1,-1,-1,-1,
-1,57,-1,57, -1,-1,-1,-1,-1] @=> int H3[];
[-1,61,-1,61,  -1,-1,-1,-1,
-1,62,-1,62, -1,-1,-1,-1,-1] @=> int H4[];

[en, sn, en, hn, en, sn, en, hn,
en, sn, en, hn, en, sn, en, en, hn] @=> dur H1D[];

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
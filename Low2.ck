MidiOut mout;
MidiMsg msg;
1 => int port;
if(!mout.open(port)){
    <<<"Error: MIDI port didn't open on port: ", port>>>;
    me.exit();
}

//Note length
BPM bpm;
bpm.tempo(172.5);
bpm.quarterNote => dur qn;
bpm.eighthNote => dur en;
bpm.sixteenthNote => dur sn;
sn+en => dur eps;
qn*2 => dur hn;


//Notes

//
[50,-1,50,-1,-1,50,-1, -1,
48,-1,48,-1,-1,48,-1,  -1] @=> int H1[];
[-1,54,-1,-1,54,-1,54, -1,
-1,52,-1,-1,52,-1,52, -1] @=> int H2[];
[-1,57,-1,-1,57,-1,57, -1,
-1,57,-1,-1,57,-1,57, -1] @=> int H3[];
[-1,64,-1,-1,64,-1,64, -1,
-1,62,-1,-1,62,-1,62, -1] @=> int H4[];

[46,-1,46,-1,-1,46,-1,
48,-1,48,-1,-1,48,-1,
43,-1,43,-1,-1,43,-1,-1,45] @=> int H5[];
[-1,53,-1,-1,53,-1, 53,
-1,55,-1,-1,55,-1,55,
-1,50,-1,-1,50,-1,50,-1,50] @=> int H6[];
[-1,57,-1,-1,57,-1, 57,
-1,59,-1,-1,59,-1,59,
-1,55,-1,-1,55,-1,55,-1,54] @=> int H7[];
[-1,62,-1,-1,62,-1, 62,
-1,62,-1,-1,62,-1,62,
-1,59,-1,-1,59,-1,59,-1,57] @=> int H8[];

[50,-1,50,-1,50,
48,-1,48,-1,48] @=> int H1_1[];
[-1,54,-1,-1,54,
-1,52,-1,-1,52] @=> int H1_2[];
[-1,57,-1,-1,57,
-1,57,-1,-1,57] @=> int H1_3[];
[-1,64,-1,-1,64,
-1,62,-1,-1,62] @=> int H1_4[];

[50,-1,50,-1,50,
48,-1,48,-1,-1,48,-1,  -1, 48,49] @=> int H2_1[];
[-1,54,-1,-1,54,
-1,52,-1,-1,52,-1,52, -1, 36,37] @=> int H2_2[];
[-1,57,-1,-1,57,
-1,57,-1,-1,57,-1,57, -1, -1, -1] @=> int H2_3[];
[-1,64,-1,-1,64,
-1,62,-1,-1,62,-1,62, -1, -1, -1] @=> int H2_4[];


[eps, sn, eps, sn, qn, eps, sn, qn*4,
eps, sn, eps, sn, qn, eps, sn, qn*4] @=> dur H1D[];

[eps, sn, eps, sn, qn, eps, sn, 
eps, sn, eps, sn, qn, eps, sn, 
eps, sn, eps, sn, qn, eps, sn, qn, qn*3] @=> dur H2D[];

[eps, sn, eps, sn, qn*6,
eps, sn, eps, sn, qn*6] @=> dur H3D[];

[eps, sn, eps, sn, qn*6,
eps, sn, eps, sn, qn, eps, sn, qn*2, qn, qn] @=> dur H4D[];


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
spork ~ p.play(mout,msg,H5,H2D);
spork ~ p.play(mout,msg,H6,H2D);
spork ~ p.play(mout,msg,H7,H2D);
spork ~ p.play(mout,msg,H8,H2D);
5.75::second => now;
spork ~ p.play(mout,msg,H1_1,H3D);
spork ~ p.play(mout,msg,H1_2,H3D);
spork ~ p.play(mout,msg,H1_3,H3D);
spork ~ p.play(mout,msg,H1_4,H3D);
5.75::second => now;
spork ~ p.play(mout,msg,H2_1,H4D);
spork ~ p.play(mout,msg,H2_2,H4D);
spork ~ p.play(mout,msg,H2_3,H4D);
spork ~ p.play(mout,msg,H2_4,H4D);
5.75::second => now;
spork ~ p.play(mout,msg,H1_1,H3D);
spork ~ p.play(mout,msg,H1_2,H3D);
spork ~ p.play(mout,msg,H1_3,H3D);
spork ~ p.play(mout,msg,H1_4,H3D);
5.75::second => now;
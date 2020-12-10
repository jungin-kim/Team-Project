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
[62,50,54,57,62,57,54] @=> int har1[];
[66] @=> int har2[];
[69] @=> int har3[];

[46,50,53,59,54,50,48,52,55,60,55,52,
50,54,57,62,57,54,50,54,57,62,57,54] @=> int L1[];
[46,50,53,59,54,50,48,52,55,60,55,52,
50,50] @=> int L2[];

[en*3, sn,sn,sn,sn,sn,sn] @=> dur har1D[];
[sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,
sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn] @=> dur L1D[];
[sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,
en*3,en*7] @=> dur L2D[];

Player p;


spork ~ p.play(mout,msg,har1,har1D);
spork ~ p.play(mout,msg,har2,har1D);
spork ~ p.play(mout,msg,har3,har1D);
2.4::second => now; //~1:32

spork ~ p.play(mout,msg,L1,L1D);
4.8::second => now; 
spork ~ p.play(mout,msg,L1,L1D);
4.8::second => now; 
spork ~ p.play(mout,msg,L1,L1D);
4.8::second => now; //~1:47

spork ~ p.play(mout,msg,L2,L2D);
4.8::second => now; //end 



















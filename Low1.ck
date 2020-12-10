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

[50,57,62,57,62,57,62,57,62,57,62,57, 
48,55,60,55,60,55,43,50,55,50,55,50] @=> int L1[];
[46,53,59,54,59,54,48,55,60,55,60,55,
50,57,62,57,62,57,50] @=> int L2[];
[38,45,50,54,50,54,54,50,54,50,45,38,
48,55,60,64,60,55,43,50,55,59,55,50] @=> int L3[];
[46,53,59,62,59,54,48,55,60,64,60,55] @=> int L4[];
[38,45,50,54,50,54,54,50,54,50,45,38] @=> int L5[];

[sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn] @=> dur short[];
[sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,
sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn] @=> dur L1D[];
[sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,
sn,sn,sn,sn,sn,sn,qn*3] @=> dur L2D[];

Player p;


spork ~ p.play(mout,msg,L1,L1D);
4.8::second => now;
spork ~ p.play(mout,msg,L1,L1D);
4.8::second => now;
spork ~ p.play(mout,msg,L1,L1D);
4.8::second => now; //~17

spork ~ p.play(mout,msg,L2,L2D);
4.8::second => now; //~22

spork ~ p.play(mout,msg,L3,L1D);
4.8::second => now; 
spork ~ p.play(mout,msg,L3,L1D);
4.8::second => now; 
spork ~ p.play(mout,msg,L3,L1D);
4.8::second => now; //~38

spork ~ p.play(mout,msg,L4,short);
2.4::second => now;
spork ~ p.play(mout,msg,L4,short);
2.4::second => now; //~43

spork ~ p.play(mout,msg,L5,short);
2.4::second => now;
spork ~ p.play(mout,msg,L5,short);
2.4::second => now; //~48



 











public class Player {
    
    fun void MIDInote(MidiOut mout, MidiMsg msg, int onoff, int note, int velocity) {
    if(onoff == 0) 128 => msg.data1;
    else 144 => msg.data1;
    note => msg.data2;
    
    velocity => msg.data3;
    mout.send(msg);
    }
    
    fun void play(MidiOut mout,MidiMsg msg, int notes[], dur duration[]){
        for(0 => int i; i <= notes.cap()-1; i++)
            playNote(mout,msg, notes[i], duration[i]);
    }

    fun void playNote(MidiOut mout,MidiMsg msg, int note, dur duration){
        127 => int velocity;
        MIDInote(mout,msg,1,note,velocity);
        if(note != -1)
            30 => velocity;
        else 127 => velocity;
        duration => now;
        MIDInote(mout,msg,0,note,velocity);
        
    }
    
    fun float octave(float oct){
    oct * 12 => float octave; 
    return octave;
    }
    
}

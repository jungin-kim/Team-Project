public class BPM
{
           
    static dur quarterNote, eighthNote, sixteenthNote, thirtysecondNote;

    fun void tempo(float beat) {

        60.0/(beat) => float SPB;
        SPB :: second => quarterNote;
        quarterNote*0.5 => eighthNote;
        eighthNote*0.5 => sixteenthNote;
        quarterNote*0.5 => thirtysecondNote;
    }
}

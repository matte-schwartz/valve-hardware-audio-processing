declare name "Valve Speakers";
declare description "Speaker tuning for the Steam Deck speakers.";

valve = library("valve_dsp.lib");
import("reverbs.lib");

// to run an infinite reverb on this device, on comment the dattor_rev below:
process = _,_ : valve.speaker_tuning(IN_GAIN_DB, IN_COMP_STRENGTH, IN_COMP_THRESHOLD, IN_COMP_ATTACK, IN_COMP_RELEASE, IN_COMP_KNEE, IN_COMP_STEREO_LINK,
                                     lowPsych_f1_order, lowPsych_f2_freq, lowPsych_linGain,
                                     LP0, FP0, Q0, LP1, FP1, Q1, LP2, FP2, Q2, LP3, FP3, Q3, LP4, FP4, Q4, LP5, FP5, Q5, LP6, FP6, Q6, LP7, FP7, Q7, OUT_COMP_STRENGTH, OUT_COMP_THRESHOLD, OUT_COMP_ATTACK, OUT_COMP_RELEASE, OUT_COMP_KNEE, OUT_COMP_STEREO_LINK) : 

          _,_ //: dattorro_rev(0, 0.9, 0.7, 0.8, 0.99, 0.4, 0.6, 0.0)
with
{
    IN_GAIN_DB = 10.5f;
    IN_COMP_STRENGTH = 0.45; 
    IN_COMP_THRESHOLD = -40.0;
    IN_COMP_ATTACK = 0.001;
    IN_COMP_RELEASE = 0.1;
    IN_COMP_KNEE = 10.0;
    IN_COMP_STEREO_LINK = 1.0;
    lowPsych_f1_order = 2;
    lowPsych_f2_freq = 300.0;
    lowPsych_linGain = 1.0;

    LP0 = -9.5;//-2.0;
    FP0 = 7900.0;
    Q0 = 2.25;
    LP1 = 0.0;//-3.0;
    FP1 = 10300.0;
    Q1 = 3.0;
    LP2 = -2.0;//-3.0;
    FP2 = 2150.0;
    Q2 = 2.0;
    LP3 = -2.5;//-3.0;
    FP3 = 4800.0;
    Q3 = 2.5;
    LP4 = -2.5;//-3.0;
    FP4 = 890.0;
    Q4 = 3.5;
    LP5 = -1.5;//-10.0;
    FP5 = 550.0;
    Q5 = 2.0;
    LP6 = 5.0;//-4.0;
    FP6 = 16000.0;
    Q6 = 1.0;
    LP7 = 0.0;//-2.0;
    FP7 =  200.0;
    Q7 = 1.0;

    OUT_COMP_STRENGTH = 1.0;
    OUT_COMP_THRESHOLD = -1.0; 
    OUT_COMP_ATTACK = 0.0001;
    OUT_COMP_RELEASE = 0.1;
    OUT_COMP_KNEE = 0.0;
    OUT_COMP_STEREO_LINK = 1.0;


//    BANDSPLIT_CF = 20.0;
//    BANDSPLIT_LOW_G = 1.0;
//    BANDSPLIT_HIGH_DELAY = 0.0;
//    BANDSPLIT_HIGH_G = 1.0;

//    LOWCOMP_STRENGTH = 0.0;
//    LOWCOMP_THRESHOLD = 0.0;
//    LOWCOMP_ATTACK = 0.01;
//    LOWCOMP_RELEASE = 0.100;
//    LOWCOMP_KNEE = 6.0;
//    LOWCOMP_STEREOLINK = 1.0;
};

declare name "ValveBinaural";
declare description "Binaural Hardware Tuning for use with headphones or speakers close to the ears such as the Valve Index.";

valve = library("valve_dsp.lib");


// to run an infinite reverb on this device, on comment the dattor_rev below:
process = _,_ : valve.speaker_tuning(IN_GAIN_DB, IN_COMP_STRENGTH, IN_COMP_THRESHOLD, IN_COMP_ATTACK, IN_COMP_RELEASE, IN_COMP_KNEE, IN_COMP_STEREO_LINK,
                                     lowPsych_f1_order, lowPsych_f2_freq, lowPsych_linGain,
                                     LP0, FP0, Q0, LP1, FP1, Q1, LP2, FP2, Q2, LP3, FP3, Q3, LP4, FP4, Q4, LP5, FP5, Q5, LP6, FP6, Q6, LP7, FP7, Q7, OUT_COMP_STRENGTH, OUT_COMP_THRESHOLD, OUT_COMP_ATTACK, OUT_COMP_RELEASE, OUT_COMP_KNEE, OUT_COMP_STEREO_LINK) :

          _,_ //: dattorro_rev(0, 0.9, 0.7, 0.8, 0.99, 0.4, 0.6, 0.0)
with
{
    IN_GAIN_DB = 18.0f;
    IN_COMP_STRENGTH = 0.67;
    IN_COMP_THRESHOLD = -40.0;
    IN_COMP_ATTACK = 0.01;
    IN_COMP_RELEASE = 0.2;
    IN_COMP_KNEE = 10.0;
    IN_COMP_STEREO_LINK = 1.0;

    lowPsych_f1_order = 2;
    lowPsych_f2_freq = 300.0;
    lowPsych_linGain = 1.0;

    LP0 = -2.0;
    FP0 = 330.0;
    Q0 = 2.0;
    LP1 = -3.0;
    FP1 = 1500.0;
    Q1 = 1.40;
    LP2 = -3.0;
    FP2 = 8500.0;
    Q2 = 2.0;
    LP3 = -3.0;
    FP3 = 10000.0;
    Q3 = 2.0;
    LP4 = -3.0;
    FP4 = 4000.0;
    Q4 = 1.0;
    LP5 = -10.0;
    FP5 = 7000.0;
    Q5 = 1.0;
    LP6 = -4.0;
    FP6 = 700.0;
    Q6 = 2.0;
    LP7 = -2.0;
    FP7 =  200.0;
    Q7 = 1.0;

    OUT_COMP_STRENGTH = 1.0;
    OUT_COMP_THRESHOLD = -0.1;
    OUT_COMP_ATTACK = 0.00001;
    OUT_COMP_RELEASE = 0.1;
    OUT_COMP_KNEE = 0.01;
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

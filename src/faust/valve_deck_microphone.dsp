declare name "SteampalMicChain_HardCoded";
declare description "";

valve = library("valve_dsp.lib");

process = _, _ : 
          valve.mic_tuning(IN_GAIN_DB, LP0, FP0, Q0, LP1, FP1, Q1, COMP_STRENGTH, COMP_THRESHOLD, COMP_ATTACK, COMP_RELEASE, COMP_KNEE), 
          valve.mic_tuning(IN_GAIN_DB, LP0, FP0, Q0, LP1, FP1, Q1, COMP_STRENGTH, COMP_THRESHOLD, COMP_ATTACK, COMP_RELEASE, COMP_KNEE) : 
          _, _
with
{
    IN_GAIN_DB = 12.0f;
    
    LP0 = -3;
    FP0 = 8000;
    Q0 = 1.7;
    LP1 = -3;
    FP1 = 16000;
    Q1 = 1.7;

    COMP_STRENGTH = 0.75;
    COMP_THRESHOLD = -9;
    COMP_ATTACK = 0.05;
    COMP_RELEASE = 0.2;
    COMP_KNEE = 0.5;
};

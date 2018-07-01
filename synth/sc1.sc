(
    var sines = 4, speed = 4;
    thisThread.randSeed = 48;
    m = { LFNoise0.kr(speed) + Line.kr(-2,1,30) + Line.kr(0,-5,300) };
    f = { var v = exprand(100,1000); v.postln; v };

    {
        Mix.fill(sines,
        {
            Pan2.ar(
                SinOsc.ar(f.value, mul: max( 0, m.value )),
                rand2(1.0)
            )
        }) / sines;
    }.play;
)

// this one used for SC1.mp3, plus some filters in Logic.app
# rand2(1.0) values for pan
# -0.92831897735596
# 0.085644960403442
# 0.44383907318115
# 0.17154788970947
# -0.63125777244568
# -0.66512823104858
(
    var sines = 4, speed = 4, frequency;
    thisThread.randSeed = 51;
    m = { LFNoise0.kr(speed) + Line.kr(-1,1,30) + Line.kr(0,-5,300) + PinkNoise.ar(0.02) };
    frequency = { var v = exprand(100,1000); v.postln; v };

    {
        Mix.fill(sines,
        {
            Pan2.ar(
	        SinOsc.ar(frequency.value, mul: max( 0, m.value )),
                rand2(1.0)
            )
        }) / sines;
    }.play;
)

(
    var sines = 6, speed = 4, frequency, multiple, pan;
    var freqs = [ 701.78033691635, 819.26696483452, 173.69443080902, 351.68353464697, 416.25106374552, 260.88154839256 ];
    var pans = [ -0.92831897735596, 0.085644960403442, 0.44383907318115, 0.17154788970947, -0.63125777244568, -0.66512823104858 ];
    var between = { arg minv, maxv, val; min( maxv, max( minv, val ) ) }; 

    thisThread.randSeed = 54;

    // TODO how does one do a let-over-lambda pattern?
    i = 0;
    j = 0;
    frequency = { var f = freqs[i]; i=i+1; f };
    pan = { var p = pans[j]; j=j+1; p };

    m = { LFNoise0.kr(speed) + Line.kr(-1.0,1,30) + Line.kr(0.1,-5.0,250) + PinkNoise.ar(0.02) };
    multiple = { var ret = between.value(0, 0.90, m.value); ret };

    {
        Mix.fill(sines,
        {
            Pan2.ar(
                SinOsc.ar( frequency.value, rand2(pi), mul: multiple.value ),
                pan.value
            )
        }) / sines
    }.play
)

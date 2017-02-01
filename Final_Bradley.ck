// Setup MIDI input, set a port number
MidiIn min;

//set up a basic piano instrument
Rhodey piano1 => dac;
Rhodey piano2 => dac;
Rhodey piano3 => dac;

// MIDI Port
0 => int port;

// open the port, fail gracefully
if( !min.open(port))
{
    <<< "Error: MIDI port did not open on port: ", port >>>;
    me.exit();
}

// holder for received messages
MidiMsg msg;

// set up objects to hold sound files
SndBuf kick => dac;
SndBuf snare => dac;
SndBuf cymbal => dac;
SndBuf clap => dac;
SndBuf hihatt => dac;
SndBuf tom => dac;
SndBuf bass1 => dac;
SndBuf bass2 => dac;
SndBuf bass3 => dac;
SndBuf bass4 => dac;
SndBuf chord1 => dac;
SndBuf chord2 => dac;
SndBuf chord3 => dac;
SndBuf chord4 => dac;
SndBuf melody1 => dac;
SndBuf melody2 => dac;
SndBuf melody3 => dac;
SndBuf melody4 => dac;


//assigning the files to the sounds
me.dir() + "/audio/024_D&B_Kick.wav" => kick.read;
me.dir() + "/audio/006_D&B_Snare.wav" => snare.read;
me.dir() + "/audio/009_D&B_Crash.wav" => cymbal.read;
me.dir() + "/audio/013_D&B_Clap.wav" => clap.read;
me.dir() + "/audio/015_D&B_Hat.wav" => hihatt.read;
me.dir() + "/audio/K01-TomHi-03.wav" => tom.read;
me.dir() + "/audio/Bass1.wav" => bass1.read;
me.dir() + "/audio/Bass2.wav" => bass2.read;
me.dir() + "/audio/Bass3.wav" => bass3.read;
me.dir() + "/audio/Bass4.wav" => bass4.read;
me.dir() + "/audio/Chord1.wav" => chord1.read;
me.dir() + "/audio/Chord2.wav" => chord2.read;
me.dir() + "/audio/Chord3.wav" => chord3.read;
me.dir() + "/audio/Chord4.wav" => chord4.read;
me.dir() + "/audio/melody1.wav" => melody1.read;
me.dir() + "/audio/melody2.wav" => melody2.read;
me.dir() + "/audio/melody3.wav" => melody3.read;
me.dir() + "/audio/melody4.wav" => melody4.read;

//setting the start to be the end of the clip so they don't all play at the start
kick.samples() => kick.pos;
snare.samples() => snare.pos;
cymbal.samples() => cymbal.pos;
clap.samples() => clap.pos;
hihatt.samples() => hihatt.pos;
tom.samples() => tom.pos;
bass1.samples() => bass1.pos;
bass2.samples() => bass2.pos;
bass3.samples() => bass3.pos;
bass4.samples() => bass4.pos;
chord1.samples() => chord1.pos;
chord2.samples() => chord2.pos;
chord3.samples() => chord3.pos;
chord4.samples() => chord4.pos;
melody1.samples() => melody1.pos;
melody2.samples() => melody2.pos;
melody3.samples() => melody3.pos;
melody4.samples() => melody4.pos;

//setting volumes fo each sample
0.1 => cymbal.gain;
0.2 => kick.gain;
0.3 => snare.gain  => clap.gain => hihatt.gain => tom.gain;
0.4 => bass1.gain => bass2.gain => bass3.gain => bass4.gain => chord1.gain => chord2.gain => chord3.gain => chord4.gain;
0.6 => melody1.gain => melody2.gain => melody3.gain => melody4.gain;
//a loop that allows midi to keep playing samples
while(true)
{
    min => now;
    
    //when a button is pressed, do something
    while(min.recv(msg))
    {
        //depending on what button is pressed on the midi controller, play a different clip
        <<< msg.data1, msg.data2, msg.data3 >>>;
        if(msg.data3 == 127)
        {    
            if(msg.data2 == 112)
            {
                0 => kick.pos;
            }
            else if(msg.data2 == 80)
            {
                0 => snare.pos;
            }
            else if(msg.data2 == 82)
            {
                0 => hihatt.pos;
            }
            else if(msg.data2 == 64)
            {
                0 => clap.pos;
            }
            else if(msg.data2 == 65)
            {
                0 => cymbal.pos;
            }
            else if(msg.data2 == 96)
            {
                0 => tom.pos;
            }
            else if(msg.data2 == 52)
            {
                Std.mtof(48) => piano1.freq;
                .2 => piano1.gain;
                1 => piano1.noteOn;
                Std.mtof(55) => piano2.freq;
                .2 => piano2.gain;
                1 => piano2.noteOn;
                Std.mtof(63) => piano3.freq;
                .1 => piano3.gain;
                1 => piano3.noteOn;
            } 
            else if(msg.data2 == 53)
            {
                Std.mtof(46) => piano1.freq;
                .2 => piano1.gain;
                1 => piano1.noteOn;
                Std.mtof(53) => piano2.freq;
                .2 => piano2.gain;
                1 => piano2.noteOn;
                Std.mtof(62) => piano3.freq;
                .1 => piano3.gain;
                1 => piano3.noteOn;
            }
            else if(msg.data2 == 54)
            {
                Std.mtof(41) => piano1.freq;
                .2 => piano1.gain;
                1 => piano1.noteOn;
                Std.mtof(48) => piano2.freq;
                .2 => piano2.gain;
                1 => piano2.noteOn;
                Std.mtof(60) => piano3.freq;
                .1 => piano3.gain;
                1 => piano3.noteOn;
            }
            else if(msg.data2 == 55)
            {
                Std.mtof(44) => piano1.freq;
                .2 => piano1.gain;
                1 => piano1.noteOn;
                Std.mtof(51) => piano2.freq;
                .2 => piano2.gain;
                1 => piano2.noteOn;
                Std.mtof(60) => piano3.freq;
                .1 => piano3.gain;
                1 => piano3.noteOn;
            }
            else if(msg.data2 == 36) 
            {
                0 => bass1.pos;
            }
            else if(msg.data2 == 37) 
            {
                0 => bass2.pos;
            }
            else if(msg.data2 == 38) 
            {
                0 => bass3.pos;
            }
            else if(msg.data2 == 39) 
            {
                0 => bass4.pos;
            }
            else if(msg.data2 == 20) 
            {
                0 => chord1.pos;
            }
            else if(msg.data2 == 21) 
            {
                0 => chord2.pos;
            }
            else if(msg.data2 == 22) 
            {
                0 => chord3.pos;
            }
            else if(msg.data2 == 23) 
            {
                0 => chord4.pos;
            }
            else if(msg.data2 == 4)
            {
                0 => melody1.pos;
            }
            else if(msg.data2 == 5)
            {
                0 => melody2.pos;
            } 
            else if(msg.data2 == 6)
            {
                0 => melody3.pos;
            } 
            else if(msg.data2 == 7)
            {
                0 => melody4.pos;
            } 
        }      
    }
}
// importing minim library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// global connfigurationns - define important elements 
// configurations variables

String audioFileName = "song.mp3"; // Audio file imported into data folder

// Global variables - definitions
AudioPlayer song; 
FFT fft;
Minim minim;

void setup() {
  //size of canvas
  size(1024, 768, P3D);
  
  // Minim initialised to allow for track loading and playing using track loop
  // buffer size = amount of time given to computer to process a piece of audio
  // Sample rate describes how many audio samples the program can capture in a second
  minim = new Minim(this);
  song = minim.loadFile(audioFileName, 2048);
  
  song.loop();
  
  fft = new FFT( song.bufferSize(), song.sampleRate() );
  
}

void draw() {
  //background colours - 255 is white and stroke is 0
  {
  background(255);
  stroke(0);
  
  fft.forward(song.mix);
  
  //analyses different values in audio
  for (int i = 0; i <fft.specSize(); i++)
  {
    //fill includes red
    //width is 7 pixels, 512 is the middle of screen positioning, ending is the height
   fill(250,0,0);
   ellipse(i, 512, 4, fft.getBand(i) *10);
  }
  }
}
    
  

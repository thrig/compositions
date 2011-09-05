% LilyPond engraving system - http://www.lilypond.org/
%
% Fugue based on material from my invention no.1 plus study of
%
% http://www.amazon.com/Study-Fugue-Alfred-Mann/dp/0486254399
%
% and some time spent doing Counterpointer exercises:
%
% http://www.ars-nova.com/cp/
%
% MIDI playback assumes "Campbells Harpsichord tuned" SoundFont being used.

\version "2.14.0"

% http://www.mail-archive.com/lilypond-user@gnu.org/msg38823.html
\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

\header {
  title = "Fugue No.1"
  subtitle = "https://github.com/thrig/compositions/tree/master/fugue1"
  subsubtitle = "2011-09-04"
  composer = "Jeremy Mates"
  copyright = "© 2011 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
}

firstBitUpper = {
<< { \relative d'' {
  s2 |
  s2 |
  s2 |
  s2 |

  e4 a,( |
  b4 g) |
  d'4( c |
  b4 c |

  d4) f,( |
  g4 a |
  g4) c8( b |
  a8 b cis d |

  e8 d cis e |
  d8 e) a,( g |
  b8 cis b g |
  a4.) g8 |

  c4. b8( |
  a8 b c b |
  a4.) g8 |
  a2 |

} } \\ { \relative d' {

  g2\rest |  % otherwise rest placed in wacky position
  g2\rest |
  a4 d,( |
  e4 f |

  g4 f |
  e2)( |
  f2 |
  g2 |

  a2) |
  d,2( |
  e2 |
  fis4 e |

  g4 a) |
  d,4 e |
  d4 e~ |
  e4 d~ |

  d8 e f4~ |
  f4 e8( d |
  c8 d e4) |
  f2 |
} } >>
}

firstBitLower = \relative d' {
  d4 g,( |
  a4 b |
  c4 b |
  a2) |

  c4( d |
  c8 b a g |
  a4) d,( |
  e4 f |

  g4 a |
  g4 f |
  e4 f8 g) |
  d4 a'( |

  g2 |
  a2 |
  b2 |
  c2) |

  f,2( |
  g2 |
  a2) |
  d,2 |
}

secondBitUpper = {
<< { \relative a'' {
  a2 |
  d,2 |
  e2 |
  f2 |

  g2 |
  f2 |
  e2 |
  c2 |

  bes2 |
  a4( d |
  e2) |
  d4( e |

  f2) |
  e2 |
  a,2 |
  b2 |

  c2 |
  b2 |
  cis2 |
  d2 |

} } \\ { \relative d' {

  s2 |
  s2 |
  r4 g |
  d'4( c |

  bes4 a |
  bes4 c) |
  g4( e |
  f4) d( |

  dis4 e |
  f4 g) |
  g4 d( |
  f4 e |

  d4) a'4( |
  g4 f8 e |
  d8 e f4 |
  g4 f |

  e4) a( |
  g4 f |
  e2) |
  a4 f( |
} } >>
}

secondBitLower = \relative d' {
  r2 |
  r2 |
  r2 |
  r2 |

  r4 d |
  g,4( a |
  bes4 c |
  bes4 a |

  g2) |
  d'4 bes( |
  c4 bes |
  a4 g |

  a4) f |
  g4 e |
  f4 d( |
  e4 f |

  g2) |
  e2 |
  a4( g |
  f2) |
}

thirdBitUpper = {
  \key fis \minor

<< { \relative d'' {
  e2 |
  e2 |
  d2 |
  cis2-> |

  s2 |
  s2 |
  s2 |
  fis4\rest fis |

  cis4( d |
  e4 d |
  cis4) b8 a |
  b4 cis8 d |

  a8( b cis d |
  cis4) fis( |
  e4 d |
  e4 fis) |

  b,4( c |
  cis!4) d8 e |
  cis4 cis( |
  d4 e) |

} } \\ { \relative d' {
  g4 a |
  b4 cis |
  b4 a8 gis |
  fis8 gis a b) |

  cis2 |
  fis,2( |
  gis2 |
  a2 |

  b2 |
  a2 |
  gis2) |
  fis4 e |

  fis2 |
  fis8( gis a b |
  a4 b |
  a4) fis |

  gis8( fis e d) |
  a'8 gis fis4 |
  gis4 b4( |
  a4 gis! |

} } >>
}

thirdBitLower = \relative d' {
  \key fis \minor

  c2 |
  gis4( fis |
  e2) |
  fis2 |

  r2 |
  r2 |
  r2 |
  r2 |

  r2 |
  r4 fis4 |
  b,4( cis |
  d4 e |

  d4.) gis8( |
  a8 gis fis e |
  d8 e fis gis |
  fis8 e d cis |

  d4 e |
  fis4) d( |
  e4 fis) |
  d2 |
}

fourthBitUpper = {
  \key e \minor

<< { \relative d'' {
  b2( |
  c4 e4) |
  a,4( b |
  c4 d |

  c4 b~) |
  b4 c |
  d4 g,4( |
  a4 b |

  c4) e,( |
  f4) c'( |
  b c |
  d c |

  a4 g) |
  b4 r4 |
  s2 |
  s2 |

  s2 |
  e4 e |
  a,2( |
  b2 |

  c2 | 
  d2 | 
  c2 | 
  b2) |

} } \\ { \relative d' {
  g!4 fis |
  e2) |
  s2 |
  s2 |

  s2 |
  r4 e |
  a,4( b |
  c4 d |

  c4 b |
  a4) e'( |
  d4 c |
  b4 c |

  d4.) e8 |
  d4 e( |
  fis4 g |
  a4 g |

  fis4.) a8 |
  g8 fis e4 |
  e4 d |
  d4 c |

  c4 b |
  b4 d( |
  e4 fis |
  g4 a) |

} } >>
}

fourthBitLower = \relative d {
  \key e \minor

  e2 |
  a2 |
  r2 |
  r4 a |

  d,4( e |
  f4 g |
  f4 e~) |
  e4 d |

  a'4( g |
  f4 g) |
  d4( e |
  d4) g |

  fis4 d |
  g2 |
  r2 |
  d'4 g,( |

  a4 b |
  c4 b |
  c4) fis,( |
  g4 a) |

  e4( fis |
  g2) |
  a2 |
  e2 |
}

fifthBitUpper = {
<< { \relative d'' {
  s2 |
  s2 |
  b4( c |
  d2~)  |

  d4 e |
  a,4( b |
  c4) g( |
  a4 b |

  c4 b |
  a2) |
  c2 |
  e2 |

  g2 |
  fis2 |
  s2 |
  a,4( b |

  c d |
  e d8 cis) |
  fis2( |
  e4 d |

  cis4 b |
  cis2 |
  d4 e) |
  a,4 b |

} } \\ { \relative d' {
  d4( e  |
  f4 g~) |
  g4 e   |
  fis2~ |

  fis4 c |
  d2( |
  e2 |
  fis2 |

  g2 |
  fis2) |
  e4( fis |
  g4 a |

  b4 a8 g |
  a4) d,( |
  e4 f)~ |
  f4 g( |

  a4 b) |
  e,2( |
  fis2 |
  g2 |

  a2 |
  g2 |
  fis2)~ |
  fis2 |

} } >>
}

fifthBitLower = \relative d' {
  r2 |
  r2 |
  r2 |
  r4 b( |

  a4 g |
  fis4 e) | 
  a4 b | 
  d,2( | 

  e2 | 
  fis4 g | 
  a2) | 
  g4( fis | 

  e2) |
  d2 |
  a'2 |
  f2 |

  d2 |
  cis2 |
  d4 a'( |
  g4 b |

  a4 g |
  e4 g |
  a2) |
  d2 |
}

sixthBitUpper = {
  \key a \minor

<< { \relative d'' {
  c4 d( |
  c4 b) |
  f'2( |
  e2 |

  d4) g |
  c,4( b8 c |
  d8 e f e |
  d4 e4 |

  c4) g( |
  a4 b |
  a4) r |
  s2 |

  s2 |
  s2 |
  s2 |
  e'4 a,( |

  b4 g) |
  d'4( c |
  b4 c |
  d4) f,( |

  g4 a |
  g4) c8( b |
  a8 b cis d |
  e8 d cis e |

  d8 e) a,( g |
  b8 cis b g |
  a4.) g8 |
  c4. b8( |

  a8 b c b |
  a4. g8 |
  a2)

  \bar "|."

} } \\ { \relative d' {
  e2( |
  f4 g |
  a) d, |
  a'( g |

  f4 g) |
  e4 a( |
  g4 f |
  g4 a) |

  d,8( c b c |
  d8 e f e |
  d8 c b c |
  d4) r |

  g2\rest |
  a4 d,( |
  e4 f |
  g4 f |

  e2)( |
  f2 |
  g2 |
  a2) |

  d,2( |
  e2 |
  fis4 e |
  g4 a) |

  d,4 e |
  d4 e~ |
  e4 d~ |
  d8 e f4~ |

  f4 e8( d |
  c8 d e4 |
  f2)
  \bar "|."

} } >>
}

sixthBitLower = \relative d' {
  \key a \minor

  c2 |
  a4( g |
  f2 |
  e4 d) |

  f4( e) |
  g4( a |
  b4) d,( |
  e8 f g a |

  f4 g |
  f4 e) |
  a2 |
  r4 g( |

  a4 b |
  c4 b |
  a2) |
  c4( d |

  c8 b a g |
  a4) d,4( |
  e4 f |
  g4 a |

  g4 f |
  e4 f8 g) |
  d4 a'( |
  g2 |

  a2 |
  b2 |
  c2) |
  f,2( |

  g2 |
  a2 |
  d,2)
  \bar "|."
}

upper = {
  \clef treble
  \time 2/4
  \tempo "Allegro" 4=126

  \firstBitUpper
  \secondBitUpper
  \thirdBitUpper
  \fourthBitUpper
  \fifthBitUpper
  \sixthBitUpper
}

lower = {
  \clef bass

  \firstBitLower
  \secondBitLower
  \thirdBitLower
  \fourthBitLower
  \fifthBitLower
  \sixthBitLower
}

theMusic = {
  \new PianoStaff <<
    \set PianoStaff.midiInstrument = #"glockenspiel"
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
}

\book {
  \paper {
   % #(set-paper-size "arch a")
  }
\score {
  \theMusic
  \layout { }
}
\score {
  \unfoldRepeats \articulate {
    % otherwise synth only gets one voice
    \set Score.midiChannelMapping = #'instrument
    \theMusic
  }
  \midi { }
}
  \markuplines { \paragraph {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105.
} }
}

% LilyPond engraving system - http://www.lilypond.org/
%
% MIDI playback assumes "Campbells Harpsichord tuned" SoundFont being used!
%
% http://soundcloud.com/thrig

\version "2.16.0"

% http://www.mail-archive.com/lilypond-user@gnu.org/msg38823.html
\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

\header {
  title = "Something like an Invention in D Minor"
  composer = "Jeremy Mates"
  subsubtitle = "2011-05-27"
  copyright = "© 2011 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
}

firstBitUpper = \relative c'' { \repeat volta 2 {
  d8-.[ c-. bes-. a-. g-. f-.  |
  e8.] r16  \acciaccatura b'16 c8-. bes-. a-. g-. |
  a8-. g-. f8. r16  e8-. f-.  |
  g8-. a-. bes-. c-. a8. r16  |

  a'8-.[ d,-. e-. f-. g-. f-.  |
  e8.] r16  \acciaccatura e16 f8-. e-. d-. cis-. |
  d8-. e-. d8. r16 g,8-. fis-. |
  g8-. a-. bes-. <a c>-. <d d,>8. r16 |

  d8 e d c b a |
  g8 d' c bes a g |
  f8 c' bes aes g f |
  e8[ bes' aes g f ees | 

  f8.] r16  d8 c e f |
  g8 f e d fis g |
  a8[ g f e d c |
  bes8.] r16 c8 e f d |
} }

firstBitLower = \relative c { \repeat volta 2 {
  d4-. <f a>-. <g bes>-.   |
  e4-. <g bes>-. <bes c>-. |
  a8-. b-. c-. d-. c4-.    |
  bes4-. a-. g8-. f-.      |

  e4-. <g bes>-. <a c>-.   |
  g4-. <bes d>-. <a cis>-. |
  bes8-. a-. f-. g-. a4-.  |
  c4-. d8-. e-. <fis fis,>8 f, |

  d4-. <f a>-. <g b>-. |
  e4-. <g bes>-. <bes c>-. |
  a4 f-. d |
  c4 ees-. c |

  d8 e f a a bes] |
  c8 bes a a b c |
  d8 e, f g a bes |
  a8 g a g a f |
} }

secondBitUpper = \relative c' { \repeat volta 2 {
  <f d'>4-. c'8-. c-. c-. c-. |
  c8-. c-. d-. d-. f-. f-. |
  e8-.[ e-. e-. e-. e-. e-. |
  d8.] r16 \acciaccatura b16 c8-. c-. c-. c-. |

  d-. d-. f-. f-. e8-. e8-. |
  e8-. e-. e-. e-. a8. r16 |
  g8-. bes-. bes-. bes-. bes-. bes-. |
  a8-. g-. f-. a-. a-. a-. |

  a8-. a8-. g-. f-. e-. e-. |
  b8-. c-. d-. a-. b-. e-. |
  d2.-> |
  c2.-> |

  bes2.-> |
  a2.-> |
  g2.-> |
  <d d'>2.-> |
} }

secondBitLower = \relative c { \repeat volta 2 {
  <d a'>4 f4-. a4-. |
  <g d'>4-. bes4-. d4-. |
  <a c>4-. e4 c'8-. bes-. |
  % TODO would be nice to position . not under the low d... (above looks wacky)
  << { a8_\staccato[ g_\staccato] } \\ { d4 } >> f4-. e-. |

  d4-. c8-. d-. e-. f-. |
  g4-. g-. f8-. e-.  |
  d4   g   bes    |
  f4   d-. e-.  |

  f4-. g-. a-.   |
  b8-. a-. g-. f-. e-. c-. |
  d4 <f a>-. <g bes>-.   |
  e4-. <g bes>-. <a c>-. |

  g4 <bes d>-. <a c>-. |
  f4 <d' f>-. <bes d>-. |
  a4 <cis e>-. <d f>-. |
  fis4-. a,-. d,-. |
} }

upper = {
  \clef treble
  \key d \minor
  \time 3/4
  \tempo "Allegro" 4=128

  \firstBitUpper
  \secondBitUpper
}

lower = {
  \clef bass
  \key d \minor
  \time 3/4
 
  \firstBitLower
  \secondBitLower
}

theMusic = {
  \new PianoStaff <<
    \set PianoStaff.instrumentName = #"Harpsichord"
    \set PianoStaff.midiInstrument = #"honky-tonk"
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
}

\book {
\score {
  \theMusic
  \layout {
    % as otherwise long instrument name clipped by margin
    indent = 2.3\cm
  }
}
\score {
  \unfoldRepeats \articulate {
    \theMusic
  }
  \midi { }
}
  \markuplist { \paragraph {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105.
} }
}

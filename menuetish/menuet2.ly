% LilyPond engraving system - http://www.lilypond.org/

\version "2.16.0"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

\header {
  title = "Menuet in E Minor"
  composer = "Jeremy Mates"
  subsubtitle = "2011-05-28"
  copyright = "© 2011 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
}

firstBitUpper = \relative c'' { \repeat volta 2 {
  e4\mf\( c8 b c d |
  e4\) g,8\( fis d4\) |
  e2\( fis4 |
  e2\) a4 |

  e4\( fis8 g e4 |
  fis2\)\mp\startTrillSpan a4\stopTrillSpan |
  c,8\mf\( e fis e g a\) |
  g2 d4\mp |

  e2\( g4 |
  a4 g8 a g e |
  fis2\)\turn g4\( |
  e4 fis8 e d4\) |

  b2\(\p c4 |
  d4 c8 d e4 |
  fis2 g4 |
  e2.\) |
} }

firstBitLower = \relative c { \repeat volta 2 {
  e2\mf\( d4 |
  c2\) a'8\( g16 fis |
  e4 c\) c'8\( b |
  a4 b c8 b16 a |

  g2\) a4 |
  b8\( fis b, c d b |
  c2\) e4 |
  d4 a8 b c d |

  <e b'>2.\mp |
  d'2 e,4\( |
  d4 e8 d c4 |
  <b e>2.\) |

  g'2\(\p fis4 |
  g4 a e |
  d2\) r4 |
  r4 e4\mp b' |
} }

secondBitUpper = \relative c'' { \repeat volta 2 {
  fis8\(\f e cis d e4\)\( |
  d8 cis fis a, b d |
  cis2\)\startTrillSpan b8\(\stopTrillSpan cis |
  d8 cis b fis e d\) |

  e4\p g-. a-. |
  fis4 g-. e-. |
  e2.\mp |
  fis2. |

  g8\(\mf a b e, e' d |
  c2\)\mordent a4-. |
  fis8\( g a d, d' c |
  b2\)\mordent d4-. |

  e4\(\mp fis8 g fis16 g a8\) |
  b4 d,-. c-. |
  b4\( c8 d c16 d fis8 |
  e2.\) |
} }

secondBitLower = \relative c' { \repeat volta 2 {
  cis2\f b8\( a |
  g4 d e8 fis |
  g8 a b cis d4 |
  fis,2.\) |

  e2.\p |
  d2. |
  e4\mp g-. a-. |
  d,4 fis-. a-. |

  b2\mf d,4\( |
  e8 fis g c, c' b |
  a2\) c,4\( |
  d8 e fis b, b' a |

  g2\)\mp e4\( |
  b'2 fis4 |
  e2 g4 |
  b4\) g-. e-. |
} }

upper = {
  \clef treble
  \key e \minor
  \time 3/4
  \tempo "Moderato" 4=108

  \firstBitUpper
  \secondBitUpper
}

lower = {
  \clef bass
  \key e \minor
  \time 3/4
 
  \firstBitLower
  \secondBitLower
}

theMusic = {
  \new PianoStaff <<
    \set PianoStaff.instrumentName = #"Harpsichord"
    \set PianoStaff.midiInstrument = #"harpsichord"
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

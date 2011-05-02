% LilyPond engraving system - http://www.lilypond.org/

\version "2.12.3"

% http://www.mail-archive.com/lilypond-user@gnu.org/msg38823.html
%\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

theFluteThemeOne = \relative c'' {
  \key e \minor

  b2\mf r4 |
  R2. |
  r8 e( c4) r4 |
  r4 a8( b c b |

  e d b\< c d4 |
  e2.->) |
  d2->\! e8( fis |
  g2.) |
}
theOboeThemeOne = \relative c' {
  \key e \minor

  e2(\mf g4 |
  a g8 a g e |
  fis2) g4( |
  e fis8 e d4 |

  b2) c4(\< |
  d c8 d e4\! |
  fis2 e4 |
  g2.) |
}
theBassoonThemeOne = \relative c {
  \key e \minor

  e2.\mf |
  d'2 e,4( |
  d e8 d c4 |
  b2.) |

  g'2( fis4\< |
  g a e\! |
  d2->) a'4( |
  b2.) |
}

theFluteThemeTwo = \relative c'' {
  \key bes \major

  r2\mp a4( |
  bes8 d g4) r |
  R2. |
  f,8( g a4 f) |

  r2 g8( c |
  bes4) r8 d( ees c |
  a4 g) r8 a8( |
  bes c d a g)\< bes |
  
  d4-. d-.\! \times 2/3 { c8( bes ees) } |
  d4-. d-. \times 2/3 { c8( ees g,) } |
  a4-. a-. g8( bes |
  c4.) bes8( a4 |
  
  g2) bes4( |
  d2 f4 |
  e2 d4 |
  cis2) b4( |
}
theOboeThemeTwo = \relative c'' {
  \key bes \major

  d4-.\mp d-. c8( ees) |
  d4-. d-. \times 2/3 { c8( bes d) } |
  a4-. a-. g8( bes) |
  a4-. a-. \times 2/3 { bes8( a c) } |

  f,4( bes c |
  g a2) |
  a4-. r a-. |
  g4-. r bes( |

  a2.) |
  g4( f a4) |
  c4.( bes8 a bes |
  a4 g f |
  
  ees4) bes'( d8 c |
  bes2) d,4 |
  a'2.~ |
  a4 r gis( |
}
theBassoonThemeTwo = \relative c' {
  \key bes \major

  bes2\mp( a4 |
  g2) a4( |
  f2 g4) |
  a2( bes4 |

  f2.) |
  bes2.  |
  f4 bes-. c-. |
  d, g-. bes-. |

  f2( c4 |
  bes2) c4( |
  ees c d |
  c d f |
  
  bes d, bes |
  f'2.) |
  c'( |
  a2 gis4 |
}

theFluteThemeThree = \relative c'' {
  \key fis \minor

  cis4. d8 e4 |
  d8 cis fis a, b d |
  cis2->) b8(\< cis |
  d cis b a gis4)\!  |
  
  fis4 gis cis8( d |
  e4 fis d |
  b2) a8( b |
  cis4 d e |
  
  fis4 a,8 gis b4 |
  cis d b |
  a gis2) |
  R2. |

  R2. |
  R2. |
  cis8(\< d e2)\! |
  fis4-. fis-. e8( d) |

  cis4-. cis-. b8( a) |
  d4-. d-. r4 |
  gis,-. gis-. r4 |
  a2( b4 |
}
theOboeThemeThree = \relative c'' {
  \key fis \minor

  a4 gis a |
  b2) gis4( |
  fis4 a8 fis gis4 |
  a2->) d,8( e |

  fis4 gis a4 |
  gis2->) fis4( |
  d e fis |
  e d8 cis b4 |
  
  cis4.) e8( fis4 |
  e8 d b cis d fis |
  a4.) r8 gis4-.\< | 
  gis4-. a8( b) cis4-. |

  cis-.\! d8( e) fis4-. |
  fis-. e8( d) cis4-. |
  cis-. b8( a gis8 a |
  gis8 fis e d cis b |

  cis2->) cis'4( |
  b8 a gis fis gis a |
  b cis d e cis4) |
  b8( a gis fis e d |
}
theBassoonThemeThree = \relative c {
  \key fis \minor

  fis2) b8( a |
  gis4 d e8\< fis |
  gis a b cis d4\! |
  fis,2->) gis4 |

  a2 cis4~ |
  cis4 fis,2 |
  gis2 a4~ |
  a4 fis2 |

  cis2 gis'4~ |
  gis4 d2 |
  fis2 cis4~ |
  cis4 fis2 |
  
  a2 cis,4~ |
  cis4 e2 |
  fis2 e4~ |
  e4 cis2( |

  e2 fis4 |
  gis fis e |
  gis2 e4 |
  cis2 d4 |
}

theFluteCoda = \relative c'' {
  \key e \minor

  g4\mf) c8( b c d |
  e4) g8( fis16 e d4) |
  r8 c16( d e8 c b4 |
  a8 e d b c d |

  e fis d r b' c16 d |
  e2) fis4( |
  g d8 c b4 |
  d4) g( e8 c |

  b4 d c8 b |
  a8 g) r e( d e |
  fis8\< c' fis g fis d\! |
  \tempo 4=120 c2->)\f fis,8 e |
  
  c2 g'4 |
  a2 d,4 |
  b'2.~ |
  b4 r2
  \bar "||"
}
theOboeCoda = \relative c' {
  \key e \minor

  b4)\mf g'8( fis8 d4~ |
  d8 b e fis b4~ |
  b8 fis g fis16 d e4~ |
  e8 d2) r8 |

  r4 fis8( g d4 |
  e2) a8( b |
  c e, fis e g a) |
  g2.\startTrillSpan |
  
  g4\stopTrillSpan fis4. d8( |
  e4 g8 a b4 |
  a8\< g fis g c, b\! |
  \tempo 4=120 g'2->)\f a4 |
  
  a2 g4 |
  fis2 d4 |
  g2.~ |
  g4 r2
  \bar "||"
}
theBassoonCoda = \relative c {
  \key e \minor

  e2) d4 |
  c2 a'8( g16 fis |
  e4 c) c'8( b |
  a4 b c8 b16 a |

  g8 fis) r c( a' g |
  b fis b, c d b |
  c2->) e4( |
  d b a |
  
  g2) b4( |
  c4 e8 a, b c |
  d8\< c d e fis g\! |
  \tempo 4=120 e2.->)\f |
  
  fis |
  d |
  e~ |
  e4 bes,2->\ff^"☺" 
  \bar "||"
}

theFlute = \new Voice {
  \set Staff.instrumentName = #"Flute"
  \set Staff.midiInstrument = #"flute"
  \clef treble
  \time 3/4

  \tempo 4=120

  \theFluteThemeOne
  \tempo 4=125
  \theFluteThemeTwo
  \tempo 4=130
  \theFluteThemeThree
  \theFluteCoda
}

theOboe = \new Voice {
  \set Staff.instrumentName = #"Oboe"
  \set Staff.midiInstrument = #"oboe"
  \clef treble
  \time 3/4

  \tempo 4=120

  \theOboeThemeOne
  \tempo 4=125
  \theOboeThemeTwo
  \tempo 4=130
  \theOboeThemeThree
  \theOboeCoda
}

theBassoon = \new Voice {
  \set Staff.instrumentName = #"Bassoon"
  \set Staff.midiInstrument = #"bassoon"
  \clef bass
  \time 3/4

  \tempo 4=120

  \theBassoonThemeOne
  \tempo 4=125
  \theBassoonThemeTwo
  \tempo 4=130
  \theBassoonThemeThree
  \theBassoonCoda
}

\book {
  \paper {
    between-system-space = 1.5\cm
    between-system-padding = #1
    ragged-bottom=##f
    ragged-last-bottom=##f

    oddHeaderMarkup = \markup \fill-line {
      "" \fromproperty #'page:page-number-string }
    evenHeaderMarkup = \markup \fill-line {
      "" \fromproperty #'page:page-number-string }
  }
\bookpart {
  \header {
    title = "Trio No.1"
    subtitle = "* Gatto meow < tertl3> BARK < holstein> moo ;) < thrig> oh hey, a trio"
    subsubtitle = "2010-11-27"
    composer = "Jeremy Mates"
    copyright = "© 2010 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  }
  \score {
    \new StaffGroup <<
      \set StaffGroup.printKeyCancellation = ##f
      \new Staff << \theFlute >>
      \new Staff << \theOboe >>
      \new Staff << \theBassoon >>
    >>
    \layout { }
  }
  \score {
    \unfoldRepeats \articulate {
    \new StaffGroup <<
      \new Staff << \theFlute >>
      \new Staff << \theOboe >>
      \new Staff << \theBassoon >>
    >>
    }
    \midi { }
  }
  \markuplines { \paragraph { \tiny	 {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
} } }
}
\bookpart {
  \header {
    title = "Trio No.1 — Flute"
    subtitle = "* Gatto meow"
  }
  \score {
    \new StaffGroup <<
      \set StaffGroup.printKeyCancellation = ##f
      \new Staff << \theFlute >>
    >>
  }
}
\bookpart {
  \header {
    title = "Trio No.1 — Oboe"
    subtitle = "< tertl3> BARK"
  }
  \score {
    \new StaffGroup <<
      \set StaffGroup.printKeyCancellation = ##f
      \new Staff << \theOboe >>
    >>
  }
}
\bookpart {
  \header {
    title = "Trio No.1 — Bassoon"
    subtitle = "< holstein> moo ;)"
  }
  \score {
    \new StaffGroup <<
      \set StaffGroup.printKeyCancellation = ##f
      \new Staff << \theBassoon >>
    >>
  }
}
}


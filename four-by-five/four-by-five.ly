% LilyPond engraving system - http://www.lilypond.org/
%
% Started as canon practice, evolved from there.

\version "2.16.0"
\include "articulate.ly"

\header {
  title       = "Four by Five - DRAFT"
  composer    = "Jeremy Mates"
  subsubtitle = "2012-??-??"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

keytempoetc = {
  \time 3/4
  \tempo "Sprightly" 4=164
  \key a \minor
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     SOPRANO     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sopranoone = \relative e'' {
  R2.\mf
  R2.
  R2.
  e8 e e g e4 |

  \repeat volta 2 {
    d2 d8 c
    d4 c a
    c4 g r
    R2. |

    g'4 e8 d e4
    g4 a8 a r4
    d,4 r2
    g4 r e |

    e8 d e4 r
    d2.
    a4 c4 d
    r4 g4 r4 |

    r8 e d e g r
    e8 d r2
    r4 r8 e8 d c
    a4 r4 r8 e'8 |

    e4 r2
    r8 e r2
    r4 e8 e r4
    r2 e4 |

    R2.
    e4 r2
    r2 e4
    e8 e e g e4 |
  }
}

sopranotwo = \relative e'' {
  f!2.\mp^\markup{ \concat { \bold{Sakura} " [10,2,4,5,9] 2112" \bold {3} "1" }  }
  f2.
  e2.
  e2. |

  R2.
  R2.
  r4. f8(\mf f f
  e8 f a4 a8 a |

  a8 a f2)
  R2.
  r4. g8( g g
  ees8 g a4 a8 a |

  a8 a g2)
  R2.
  r4. aes8( aes aes
  g8 aes g4 g8 g |

  g8 g ees2)
  R2.
  r4. g8( g g
  ees8 g a4 a8 a |

  a8 a g2)
  R2.
  R2.
  f2.\mp |

  r2 f4
  R2.
  r4 e2
  R2.

  e2.
  r4 f2
  f2 r8 a
  R2.
  r4 f2
  r2 f4
  r2 f4
  f2 f4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      ALTO       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

altoone = \relative d'' {
  R2.\mf
  R2.
  d8 d d e d4
  c2 c8 a

  \repeat volta 2 {
    c4 a g
    a4 e r
    R2.
    e'4 d8 c d4 |

    e4 g8 g r4
    c,4 r2
    e4 r d
    d8 c d4 r |

    c2.
    g4 a4 c
    r4 e4 r4
    r8 d c d e r |

    d8 c r2
    r4 r8 d8 c a
    g4 r4 r8 d'8
    d4 r2 |

    r8 d r2
    r4 d8 d r4
    r2 d4
    R2. |

    d4 r2
    r2 d4
    d8 d d e d4
    c2 c8 a |
  }
}

altotwo = \relative d'' {
  d2.\mp
  d2.
  d2.
  d2. |

  r4. e8(\mf e e
  d8 e f4 f8 f
  f8 f e2)
  R2. |

  r4. bes8( bes bes
  a8 bes d4 d8 d
  d8 d bes2)
  R2. |

  r4. d8( d d
  bes8 d ees4 ees8 ees
  ees8 ees d2)
  R2. |

  r4. bes8( bes bes
  a8 bes d4 d8 d
  d8 d bes2)
  R2. |

  r4. d8( d d
  bes8 d e4 e8 e
  e8 e d2)
  d2.\mp |

  r2 d4
  R2.
  r4 d2
  R2.

  d2.
  r4 e2
  d2 r8 d
  R2.
  r4 d2
  r2 d4
  r2 d4
  d2 d4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      TENOR      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tenorone = \relative c' {
  R2.\mf
  c8 c c d c4
  a2 a8 g
  a4 g e |

  \repeat volta 2 {
    g4 d r
    R2.
    d'4 c8 a c4
    d4 e8 e r4 |

    a,4 r2
    d4 r c
    c8 a c4 r
    a2. |

    e4 g4 a
    r4 d4 r4
    r8 c a c d r
    c8 a r2 |

    r4 r8 c8 a g
    e4 r4 r8 c'8
    c4 r2
    r8 c r2 |

    r4 c8 c r4
    r2 c4
    R2.
    c4 r2 |

    r2 c4
    c8 c c d c4
    a2 a8 g
    a4 g e |
  }
}

tenortwo = \relative a {
  R2.
  r4. a4.\mp
  R2.
  r4. bes8(\mf bes bes |

  a8 bes d4 d8 d
  d8 d bes2)
  R2.
 \clef treble
  r4. d8( d d |

  bes8 d e4 e8 e
  e8 e d2)
  R2.
  r4. ees8( ees ees |

  d8 ees g4 g8 g
  g8 g ees2)
  R2.
  r4. d8( d d |

  c8 d ees4 ees8 ees
  ees8 ees d2)
  R2.
  r4. e8( e e |

  d8 e f4 f8 f
  f8 f d2)
  R2.
  R2. |

  R2.
  R2.
  R2.
  R2. |

  R2.
  r4 d2\mp
  d2 r8 d
  R2.
  r4 d2
  r2 e4
  r2 f4
  e2 d4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      BASS       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bassone = \relative a {
  a8\mf a a
   c_\markup{ \concat { \bold { "Canonic Pentatonic Minor " } "(mostly)" } }
   a4
  g2 g8 f!
  g4 e d
  e4 c r |

  \repeat volta 2 {
    R2.
    c'4 a8 g a4
    c4 d8 d r4
    g,4 r2 |

    c4 r a
    a8 g a4 r
    g2.
    d4 e4 g |

    r4 c4 r4
    r8 a g a c r
    a8 g r2
    r4 r8 a8 g e |

    d4 r4 r8 a'8
    a4 r2
    r8 a r2
    r4 a8 a r4 |

    r2 a4
    R2.
    a4 r2
    r2 a4 |

    a8 a a c a4
    g2 g8 f!
    g4 e d
    e4 c r |
  }
}

basstwo = \relative d' {
  d2.\mp
  d2.
  d2.
  d2. |

  R2.
  r4. a8(\mf a a
  f8 a bes4 bes8 bes
  bes8 bes a2) |

  R2.
  r4. a8( a a
  f8 a bes4 bes8 bes
  bes8 bes a2) |

  R2.
  r4. g8( g g
  ees8 g aes4 aes8 aes
  aes aes bes2) |

  R2.
  r4. a8( a a
  g8 a bes4 bes8 bes
  bes8 bes a2) |

  R2.
  r4. a8( a a
  g8 a bes4 bes8 bes
  bes8 d e e e f |

  e8 e d d bes4)
  r4 a2
  r4 d2\mp
  R2.

  d2.
  r4 a2
  a2 r8 a
  R2.
  r4 bes2
  r2 bes4
  r2 a4
  a2 a4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     voices      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

soprano = {
  \set Staff.midiInstrument = #"marimba"

  \keytempoetc
  \clef treble

  \sopranoone
  \break
  \sopranotwo

  \bar "|."
}

alto = {
  \set Staff.midiInstrument = #"marimba"

  \keytempoetc
  \clef treble

  \altoone
  \break
  \altotwo

  \bar "|."
}

tenor = {
  \set Staff.midiInstrument = #"marimba"

  \keytempoetc
  \clef alto

  \tenorone
  \break
  \tenortwo

  \bar "|."
}

bass = {
  \set Staff.midiInstrument = #"marimba"

  \keytempoetc
  \clef bass

  \bassone
  \break
  \basstwo

  \bar "|."
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     misc.     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

theblackdots = {
  <<
    \new StaffGroup <<
%     \override Score.BarNumber #'break-visibility = #'#(#t #t #t)
%     \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)

      \new Staff = "soprano" \soprano
      \new Staff = "alto" \alto
      \new Staff = "tenor" \tenor
      \new Staff = "bass" \bass
    >>
  >>
}

themusic = {
  <<
    \new PianoStaff <<
      \set Score.midiChannelMapping = #'instrument

      \new Staff = "soprano" \soprano
      \new Staff = "alto" \alto
      \new Staff = "tenor" \tenor
      \new Staff = "bass" \bass
    >>
  >>
}

\score {
  \theblackdots
  \layout { }
}
\score {
  \unfoldRepeats \articulate { \themusic }
  \midi {
    \context {
      \Score midiMinimumVolume = #0.3 midiMaximumVolume = #0.9
    }
  }
}

\markup { \wordwrap {
Marimba or instruments with low sustain times should be used; longer notes are used to eliminate rest clutter, not indicate that the note should actually be held that long. Dynamics left to the whim of the performer(s), though the changes likely should favor subtle changes over dramatic contrasts.
} }


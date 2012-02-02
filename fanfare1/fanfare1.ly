% LilyPond engraving system - http://www.lilypond.org/
%
% This work is licensed under the Creative Commons Attribution 3.0 United
% States License. To view a copy of this license, visit
% http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
% Creative Commons, 171 Second Street, Suite 300, San Francisco,
% California, 94105.

\version "2.13.0"

\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

\header {
  title       = "Clarke, Markov, Mouret, & I"
  composer    = "Jeremy Mates"
  subsubtitle = "2012-02-02"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

solo = {
  fis4. e16 fis
  g4. fis8 e4 a,
  d4 fis e d
  e4 a,-. fis-. a-. |

  d2 e4. a,8
  fis'4. e8 d cis b cis
  a4 d e a,
}

parta = \relative d'' {
  fis2^"B" g4. fis16 e
  fis4. e8 d e d e
  a,4 d cis e
  d a-. fis-. d-. |

  fis'2 e4. d16 e
  fis4. gis8 a4 b
  a4 g fis e8 d
  e1-> |
}

partb = \relative a' {
  a4^"C" fis a d
  d8 cis d e fis g fis g
  e4. fis8 g4 fis8 e
  d8 cis d4 e2 |

  a,4 fis a d
  d8 cis d cis e d cis d
  a4. d8 e4 d8 cis
  b4 a d2 |
}

partc = \relative d'' {
  fis2^"D" a2
  b4 g8 a g a g fis
  e4 e8 d cis d e4
  fis4 fis8 g e d cis d |

  e2 a2
  g4 a8 g fis e d cis
  b8 d e fis e fis e d
  d1-> |
}

trumpet = {
  \key d \major
  \clef treble
  \tempo 4=120

  \relative d'' { d2\mf^"A" \solo d1-> }
  \relative d'' { d2^"A" \solo d1-> }
  \parta
  \relative d'' { d2^"A" \solo d1-> }
  \partb
  \relative d'' { d2^"A" \solo d1-> }
  \partc
  \relative d'' { d2^"A" \solo d1-> }
  \relative d'' { d2\f^"A" \solo d1 }

  \bar "|."
}

\book {
  \score {
    \new Staff <<
      \set Staff.instrumentName = #"Trumpet in D"
      \set Staff.midiInstrument = #"trumpet"

      \override Score.SystemStartBar #'collapse-height = #1

      \transpose d c { \relative d'' { \trumpet } }
    >>
    \layout { indent = 2.6\cm }
    \midi { }
  }
}

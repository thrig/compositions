% LilyPond engraving system - http://www.lilypond.org/

\version "2.16.0"
\include "articulate.ly"
\header {
  title       = "Variation on BWV 789"
  subsubtitle = "2013-05-13"
  composer    = "Jeremy Mates"
  copyright   = \markup { \teeny { "© 2013 Jeremy Mates - Creative Commons Attribution 3.0 United States License" } }
  tagline     = #f
}

blackspots = \relative f'' {
  \accidentalStyle "piano"        % PORTABILITY comment out if lilypond < 2.16

  fis16 g a8 c,16 b a8  d16 e fis8 b,16 a b8
  e,8 fis g c,          b' a g a
  b8 cis d g,           f' e d e 
  f8 d e c              d bes c f, 

  ees'8 d c d        ees c d bes 
  c8 a bes ees,      d' c bes c 
  d8 bes c a         bes g a fis 
  g8 d b' a          b d, g fis 

  g8 e cis' b        cis e, a gis 
  a8 fis d' cis      d fis, b a 
  b8 g e' d          e g, cis b 
  cis8 a fis' e      fis a, d cis 

  d8 b cis d         e fis g cis, 
  a'8 g f e          f d e c 
  b8 a b e,          d' cis b cis
  e8 d cis d         f e d cis

  d2                        cis16 d e8 g,16 fis e8
  a16 b cis8 fis,16 e fis8  b, cis d g,
  fis'8 e d e               fis gis a d,
  c'8 b a b                 c a b g

  a8 f g c,          bes' a g a
  bes8 g a f         g e f bes,
  a'8 g f g          a f g e
  f8 d e cis         d a fis' e

  fis8 a, d cis      d b g' fis
  g8 b, e d          e cis a' gis
  a8 cis, fis e      fis d b' a
  b8 d, g fis        g e cis' b

  cis8 e, a gis      a fis gis a
  b8 cis d gis,      e' d c b
  c8 a b g           fis e fis g
  a8 d, b' a         g a16 b cis d e8

  fis16 g a8 c,16 b a8  d16 e fis8 b,16 a b8 
  e,8 fis g c,          b' a g a
  b8 cis d g,           f' e d e 
  f8 d e c              d bes c f, 

  ees'8 d c d        ees c d bes 
  c8 a bes ees,      d' c bes c 
  d8 bes c a         bes g a fis 
  g8 d b' a          b d, g fis 

  g8 e cis' b        cis e, a gis 
  a8 fis d' cis      d fis, b a 
  b8 g e' d          e g, cis b 
  cis8 a fis' e      fis a, d cis 

  d8 b cis d         e fis g cis, 
  a'8 g f e          f d e c 
  b8 a b g           f e d cis 
  d2--               r2

  \bar "|."
}

themusic = {
<<
  \new Staff = "subj" <<
     \set Staff.instrumentName = #"Violin"
     \set Staff.midiInstrument = #"violin"
     \set Score.tempoHideNote = ##t
     \tempo "Allegretto ben marcato" 4=94
     \blackspots
  >>
>>
}

\score {
  \themusic
  \layout { }
}
\score {
  \articulate \themusic
  \midi { }
}

% This work is licensed under the Creative Commons Attribution 3.0
% United States License. To view a copy of this license, visit
% http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
% Creative Commons, 171 Second Street, Suite 300, San Francisco,
% California, 94105, USA.

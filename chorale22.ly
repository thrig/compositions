%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% LilyPond engraving system - http://www.lilypond.org/                       %

\version "2.18.2"

\header {
  title   = "Chorale No. 22"
  subsubtitle = "2019-11-01"
  composer = "Jeremy Mates"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2019 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

tempoandetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 4/2
  \tempo 4=132
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %

sopa = \relative d'' {
  d\breve
  c1 f,
  g1~ g2 a
  b1 c

  c1 g
  b2 a g1
  f\breve~
  f2 e e c'

  b2 a b1
  a1~ a2 g
  a1 r1
  r1 b1~

  b1 a~
  a2 b c c,
  d1 g2 a
  b1~ b2 a

  a1 g2. f4
  e\breve
  r\breve
  r\breve

  r2 g1~ g2~
  g2 fis2 g1~
  g2 a4 g g2. f4
  e2 a1 b2

  c1~ c2 b~
  b2 a g1
  a1 g2 g
  c2 b a a

  b4 a g2. g4 f2
  e1 r1
  r\breve
  f2 e d2. d4

  e4 f g1 a2
  g1 e4 fis g2
  a1 b
  c1~ c2 a

  b4 a g a g f e2
  f2. f4 e1
  r1 r2 f2
  g1 g2 a~

  a2 g f e
  d2 e1 a,4 b
  c4 d e1 e4 f
  g1 g2 f

  e2 d r2 g2
  a2 b c1
  f,2 g a g~
  g2 g f1

  d\breve
  f\breve
  e\breve~
  e\breve
}

altoa = \relative d' {
  r\breve
  r\breve
  r\breve
  r\breve

  r\breve
  d\breve
  c1 f,
  g1~ g2 a

  b1~ b2 c~
  c2 d e1
  f1 d~
  d2 c g'2 f

  e2 f e d
  e1 f2 g
  f2 f e1~
  e1 r1

  c\breve
  b1 e,
  f1~ f2 g
  a1 b~

  b1 r1 % r2 d
  c2 d1 b2~
  b2 a bes4 c d2
  c4 b a2 c d

  c2. d4 e fis g2~
  g2 f4 e d2 e
  d1~ d2 e~
  e2 d f e

  d1 r1
  g1 f2 c
  b4 c d2 e d
  c1 b

  c1 d2 c
  e2 b c d~
  d2 c d2 e~
  e4 d c2 g' f

  e2 d1 c2~
  c2 r1 c2
  b2 c2. c4 d2
  e1~ e2 d

  f2 d c1
  r\breve
  r1 c1
  d2. a4 b c d2

  e2 b1 e2~
  e2 e a,4 b c d~
  d4 c c1 e2
  d1 c

  r\breve
  c\breve
  c\breve~
  c\breve
}

tenora = \relative c' {
  r\breve
  r\breve
  r1 d1~
  d1 c1

  f,1 g1~
  g2 a b1
  c1 c1~
  c2 b c a

  b1~ b2 r2
  r1 b~
  b2 a g f
  g1 d'

  e1 c2 b
  a2 g f e
  d1 b'2 a~
  a2 g~ g f~

  f2 e4 f g f g a
  g1 b
  d2 c4 b a g2.
  r\breve

  d'1~ d2 b
  a1 b4 c d2
  e4 d c2 d g,
  a4 g a1 g2~

  g2 g2. a4 b2
  c1 b2 c4 b
  a2 a2 r1
  a2 b d c

  b1 a2. b4
  c2 g f g
  b1 a~
  a1 r1

  g\breve
  g1 a2 b
  e1 d2 c4 b
  a1 e2 f

  g1 b2 c4 b
  a1 a~
  a2 g a a
  r2 g1 f2

  d2 g a1
  b1~ b2 c
  a2 g4 f g2 a
  b1~ b4 a d c

  b2 r2 e4 d c b
  a2 g f1~
  f2 r1 r2
  r1 a~

  a1 a
  a1 g
  g\breve~
  g\breve
}

bassa = \relative f {
  r\breve
  r\breve
  r\breve
  r\breve

  r\breve
  r\breve
  a\breve
  g1 c,

  d1~ d2 e
  f1 g
  d2 c b d
  g,\breve

  g'2 a a1
  r\breve
  a2. g4 g2 f
  e1 b2 d

  c\breve
  e1 g
  a1 d,2 e
  f1 d

  g1 g
  a2 d,2 g2. f4
  e2 f bes,1
  c1~ c2 r2

  e1~ e2 e~
  e2 f g c,
  d1 g
  r\breve

  g1 f4 e d d
  c1 d2 e2~
  e2 d c d4 e
  f1 g2 f

  e1 r2 c2~
  c2 d c b
  a1 g
  r1 r2 d'2

  g,1 g'2 a
  f4 e d1 c2
  d2 e f4 e d2
  c1 r1

  r\breve
  g'1 g2 f~
  f2 e c4 b c2
  g4 a b c d1

  e2 g1 r2
  r\breve
  r\breve
  r\breve

  d1~ d2 e2
  f\breve
  c\breve~
  c\breve
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% MIDI                                                                       %

msop = \new Voice {
  \tempoandetc
  \sopa
}
malto = \new Voice {
  \tempoandetc
  \altoa
}
mtenor = \new Voice {
  \tempoandetc 
  \tenora
}
mbass = \new Voice {
  \tempoandetc 
  \bassa
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% SCORE                                                                      %

ssop = \new Voice {
  \voiceOne
  \tempoandetc 
  \sopa
  \bar "|."
}

salto = \new Voice {
  \voiceTwo
  \tempoandetc 
  \altoa
  \bar "|."
}

stenor = \new Voice {
  \voiceThree
  \tempoandetc 
  \tenora
  \bar "|."
}

sbass = \new Voice {
  \voiceFour
  \tempoandetc 
  \bassa
  \bar "|."
}

upper = {
  \set Staff.printPartCombineTexts = ##f
  \partcombine \ssop \salto
}

lower = {
  \clef bass
  \set Staff.printPartCombineTexts = ##f
  \partcombine \stenor \sbass
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %

thescore = {
 << \new StaffGroup \with {
      \override StaffGrouper.staff-staff-spacing = #'(
                                (basic-distance . 0)
                                (padding . 1))
    }
   << \new Staff \upper
      \new Staff \lower
   >>
 >>
}

themidi = {
 <<
  \set Score.midiChannelMapping = #'staff
  \new Staff = "soprano" \msop                % pagbu
  \new Staff = "alto" \malto
  \new Staff = "tenor" \mtenor
  \new Staff = "bass" \mbass
 >>
}

\score {
  \thescore
  \layout { }
}

\score {
  \themidi
  \midi { }
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

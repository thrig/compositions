%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% LilyPond engraving system - http://www.lilypond.org/                       %

\version "2.18.2"

\header {
  title       = "Chorale No. 21"
  subsubtitle = "2019-10-01"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2019 Jeremy Mates - Creative Commons Attribution 4.0 United States License"
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

sopa = \relative g' {
  f2. g4 a c b a
  c2 d2. c8 b a2
  a2 g4 a b2 c
  d4 c b2 a g4 f

  e2 e r2 r4 b'4~
  b4 b c b8 a g2 b~
  b2 a4 f g a b2
  a2 g a a4 b

  c4 d c2 b g
  g2 a b c
  d2 e f f4 e
  d4 g, a2 bes a2

  c2 g a1~
  a2 g f1
}

altoa = \relative d' {
  r2 c1 f2
  f4 g f2. e4 e2
  f2 e4 f e2. e4
  d4 a' g e4 c1

  b2 c d1
  e2. d4 d2 g4 f
  e2 e d d~
  d4 c8 b c2 f4 g f2~

  f4 f e2 d e
  b2 fis' g a
  g2. c4 bes a g2
  b4 b a2 g4 f e2~

  e4 d d1 f2
  e2. e4 c1
}

tenora = \relative c' {
  r2 r2 f4 e d2
  c2. c4 b2 c2~
  c4 b b2 g4 b a4. g8
  f2 g a1

  g2. g4 fis2 g~
  g4 b a2 b2. b4
  c2. a4 b a g2
  a2. a2 g4 f2

  g2 g4 a b2. c4
  d2. c4 b2 a
  b2 b4 a d2 d4 c
  b2 c d c4 b

  a2 bes4 c f, g a2
  c2 b a1
}

bassa = \relative f {
  r2 f2. c4 d d
  f2 f g a
  d,2 e2 e4 d4 c2
  d2 e f f,

  g2 a b g
  g'2 f g2 e4 d
  c4 b c d g,2 g'
  f4 e2 e e4 d2

  e2 e4 f g2 g~
  g4 f8 e d2 g f~
  f4 f e2 d g~
  g4 g f2 bes, c

  f2 g d d
  c4 d e2 f1
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% MIDI                                                                       %

msop = \new Voice {
  \set Staff.midiInstrument = #"harpsichord"
  \tempoandetc
  \sopa
}
malto = \new Voice {
  \set Staff.midiInstrument = #"harpsichord"
  \tempoandetc
  \altoa
}
mtenor = \new Voice {
  \set Staff.midiInstrument = #"harpsichord"
  \tempoandetc 
  \tenora
}
mbass = \new Voice {
  \set Staff.midiInstrument = #"harpsichord"
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
 << \new StaffGroup
   << \new Staff \upper
      \new Staff \lower
   >>
 >>
}

themidi = {
 <<
  \set Score.midiChannelMapping = #'staff
  \new Staff = "soprano" \msop
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

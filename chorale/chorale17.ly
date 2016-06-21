%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version  "2.18.2"
\language "deutsch"
\include  "articulate.ly"

\header {
  title       = "Chorale No. 17.0.1"
  composer    = "Jeremy Mates"
  subsubtitle = "2016-06-21"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=62 }
fermtempo = { \tempo 4=42 }

keytempoetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 3/4
  \normtempo

  \key d \minor
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Music

sopa = \relative c'' {
  g8 c c b d4~
  d8 c d4 a
  c4 c8 d e d~
  d8 c b8 a16 b c8 d

  c8 b f16 g a8 h4
  c16 b a8 g a h4
  c8 d4 c8 c h
  a4 g8 a h cis

  d8 h c4. c16 d
  c8 h h a gis4
  a8 h c4. h8
  h4 e8 d c4

  a16 b a8 c8. c16 c4
  a8 g4 a8 b c
  b4 a b
  c4 d8 c16 b a4

  g8 f4 g8 a h
  c8 b a4 b8 d
  d8 c b a b d~
  d16 c b8 c8 a4 a8

  a8 g g f e4
  f4 g a
  h4 c8 c b4
  a4 g \fermtempo f\fermata
}

altoa = \relative g' {
  g4 f fis
  g8 a4 g16 f e8 f
  g4 a8 h cis a
  b8 g f f16 g f8 f

  e8 d d d16 f e8 d
  e4 e8 e8 g f
  e8 f4 e8 e d
  cis4 d8 fis gis a16 g

  f8 g4 a16 b a g f8~
  f16 e d8 d4 e
  e8. fis16 g8 a a4
  e4 g16 a g8 g4

  f4. a8 g c,
  d4 e8 f g a
  g4 f4. b,8
  f'8 es d e fis e

  d4. e8 f g
  e8 g4 f16 e f4
  g4 g f8 e
  f8 g a f8 e4

  f8 e d4. c8
  c8 b e e f f
  g16 e d c e8 a d,8 c~
  c8 b16 c~ c d c8~ c4\fermata
}

tenora = \relative h {
  b8 g a4. c8
  d4 c8 b cis d
  c8 b a4 a
  g16 f e8 f a a4~

  a8 b a4 g4~
  g8 f e4. f8
  a4 g a~
  a8 g16 f e4 e8 f16 g

  a8 g16 a g8 f4 a8
  f4 gis8 a h4
  c8 a g8. f16 fis4
  g8 a h h c d

  c8. b16 a g f8 e g
  a8 b4 a e'8
  d8 c d es d4
  c4 b8 a a4

  b4 a16 b c8 d4
  c8 g a4 d16 c b8
  b8 d4 es8 d g,
  f8 b a c4 cis8

  d8. c16 b4 g
  a4 b8 d c4
  g8 g a16 g f8 g4
  a2 a4\fermata
}

bassa = \relative c {
  c8 e f4 d
  b4 f' a8 d,
  e8 g f4 f,
  g8 c d4 a

  b16 c d8 f4 e4
  a,4 c g
  a4 h8 c4 d8
  e8 a, h4 e

  d4 c a
  d4 e8 f e8 d
  c4 e8 h d4
  e4 e16 f g f e8 d

  f4 f, c'8 e
  f8 g4 f8 e c
  d8 e d c b4
  a4 g d'8 c

  g'4 f8 c h4
  a8 e' cis d16 c b4
  es8 d g c, d e
  d8 e16 d f e f4 f8

  f8 g g, a e'4
  d4 c f8 d
  e4 a, b
  f'8 d e4 f\fermata
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \new Voice {
  \keytempoetc
  \sopa
}

malto = \new Voice {
  \keytempoetc
  \altoa
}

mtenor = \new Voice {
  \keytempoetc
  \tenora
}

mbass = \new Voice {
  \keytempoetc
  \bassa
}

themidi = {
 <<
  \set Score.midiChannelMapping = #'staff

  \new Staff = "voice1" {
    \set Staff.midiInstrument = #"electric piano 1"
    << \msop \malto \mtenor \mbass >>
  }
  \new Staff = "voice2" {
    \set Staff.midiInstrument = #"electric piano 2"
    << \msop \malto \mtenor \mbass >>
  }
 >>
}

\score {
  \themidi
  \midi { }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Score

ssop = \new Voice {
  \keytempoetc
  \voiceOne
  \sopa
  \bar "|."
}

salto = \new Voice {
  \keytempoetc
  \voiceTwo
  \altoa
  \bar "|."
}

stenor = \new Voice {
  \keytempoetc
  \voiceThree
  \tenora
  \bar "|."
}

sbass = \new Voice {
  \keytempoetc
  \voiceFour
  \bassa
  \bar "|."
}

upper = {
  \clef treble
  \set Staff.printPartCombineTexts = ##f
  \partcombine \ssop \salto
}

lower = {
  \clef bass
  \set Staff.printPartCombineTexts = ##f
  \partcombine \stenor \sbass
}

thescore = {
 <<
  \new PianoStaff << \new Staff \upper \new Staff \lower >>
 >>
}

\score {
  \thescore
  \layout { }
}

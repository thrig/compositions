%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version  "2.18.2"
\language "deutsch"
\include  "articulate.ly"

\header {
  title       = "Chorale No. 13"
  composer    = "Jeremy Mates"
  subsubtitle = "2016-02-21"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=94 }
fermtempo = { \tempo 4=50 }

keytempoetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 4/4
  \normtempo

  \key g \minor
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Music

sopa = \relative c'' {
  d8 b es16 d c d c8 b a4
  b8. b16 c8 b16 es d8 c16 b d4
  d4 c8 b g16 a b8 a16 b c b
  a4 b b c

  d4 d8 c b4 g
  g4 a b c
  c4 c h c
  c8 b b c es d16 c c b b a

  c8 a c4 d8 es d c
  b8 a g2 a8 b
  c2 d4 d8 c8
  b8 a g f e f a8. d16

  c8 b16 a g8 g a b es, a
  g8 a16 b c8. d16 c4 b
  b4. a8 g4 f8 es
  f8 g a b a16 g f8 g a~

  a8 b c16 b a8 d e f e
  d8 b16 c d8 e~ e16 d c8 h h
  c4 b a b8 as
  g8 a16 b c8 b as g g f

  es4 g8 a g f e4
  f8 g4 c16 b a8 a a g
  g8 f f g a b c a
  b8 g a b c d es d16 c

  b8 c d4 c b
  c4 c h \fermtempo c\fermata
}

altoa = \relative g' {
  g8 g4 g~ g8 f es
  d16 es f g a8 g f g a e
  f8 g16 f es a g8 es d c b
  c16 d es f g4 g g

  g4 es es es
  es4 c c c
  c4 e d8 f g f
  es8 f g es g8. a16 g8 g16 f

  g8 f es4 f8 d d4~
  d4 es8 f es d c b
  es8 d a' g a e f4
  g8 f e d c d c b

  a8 b16 c d8 e f d c c
  es8 f g16 f es f g4 f
  es4 f8 d d4. c8
  d8 es f d~ d c16 d es8. es16

  f8 g4 f16 g f4 f16 c' g8
  f16 e d8 f e4 a8 g4
  g8 a g4 f8 f g16 es d8
  d8 f16 d es8 g es16 d d c c4

  c8 b es c d4 c
  d4 d4 f8 f16 e d4
  c8 d4. d8 d c c
  d8 es f g a f g4~

  g4 f es d8. f16
  g8 f es f g f e4\fermata
}

tenora = \relative c' {
  b8. b16 c4 a16 e' d8 c c
  b4 d8. c16 b a g g f8 a~
  a8 g a b c4 f,8 g
  fis8 g d'4. d8 c4

  b4 b c b
  b4 a g g
  a4 g g g
  a4 d8 c b b c4

  es4 c8 a d4 b
  b2 a8 b4 d8
  a8 b c4 f,8 g4 c8
  d4 b a8 f e4

  f8 g16 a b8 b16 b c c b8 g4
  b8 d es16 d c8 c b b f
  g4 d8 f b c16 b a4~
  a8 g f g a4 b8. a16

  d4 e16 d c8 d a d16 c b c
  a4 a8 a b c16 a e'4~
  e16 d c8 d es16 d c8 d c c
  b4 c~ c8 b a b

  g4 g g g8 g
  f4 f f f
  a4 a a g8 f
  g4 d'8 b es d16 c b8 a

  g8 c16 b as8 b b a b g
  c4 b8 c d4 g,\fermata
}

bassa = \relative c {
  f8 es16 d c8 g c e f4
  g8 f16 es d4~ d8 es d c
  b16 c d es f8 g a e f c
  d8 b16 a g4 g'8 f es4

  d8 f g4 c,8 d es4
  b4 c e8 f c4
  f4 e8 d g4 c,
  f8 d e a g f es g

  c,8 d c4 b d
  d4 g c,8 b c4
  f8 g f es d c b a
  g8 a b g a4 a8 b16 c

  d4 g,8 c a b c f
  es8 d c4 f d
  c4 b d8 es f4
  b,2 f'4 es

  d8 g c, f16 e d8 c b c
  d8 g16 e d8 c g' f g e16 d
  c8 a b c f d es f
  g8 d c16 d es8 c d16 es f8 g

  c,4 c16 b a g b8 g a b16 c
  d4 b8 c d4 b
  c4 d8 e f b, es c
  b4 d c8 f c d

  es8 as, d g, c f, f' es16 d
  c8 f c4 g c\fermata
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \new Voice { \articulate {
  \keytempoetc
  \sopa
} }

malto = \new Voice { \articulate {
  \keytempoetc
  \altoa
} }

mtenor = \new Voice { \articulate {
  \keytempoetc
  \tenora
} }

mbass = \new Voice { \articulate {
  \keytempoetc
  \bassa
} }

themidi = {
 <<
  \set Score.midiChannelMapping = #'voice

  \new Staff = "soprano" << \msop >>
  \new Staff = "alto"    << \malto >>
  \new Staff = "tenor"   << \mtenor >>
  \new Staff = "bass"    << \mbass >>
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/
%
% timidity --config-file=organ.cfg

\version  "2.18.2"
\language "deutsch"
\include  "articulate.ly"

\header {
  title       = "Chorale No. 14"
  composer    = "Jeremy Mates"
  subsubtitle = "2016-03-05"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

% or ~96 if played on piano
normtempo = { \tempo 4=84 }
fermtempo = { \tempo 4=48 }

keytempoetc = {
  \set Staff.midiInstrument = #"church organ"
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 4/4
  \normtempo

  \key c \minor
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Music

sopa = \relative c''' {
  g8 g g f4 es d8
  d8 d c4 es c
  b4 as8 es'4 d8 d c
  g4 a8 h c d4 d8~

  d8 c4 c8 h h a4
  a4 gis8 a a4 a
  g8 a b c4 d c8
  c8 c c4 b b8 b

  b8 as4 g8 c b4 g8~
  g8 g f es f g16 as b c d es
  b8 b as4 g g
  g8 f es4 d \fermtempo es\fermata
}

altoa = \relative g' {
  g4 es8 as4 g8 f g
  as4 g4 f8 d8 es8 es
  es8 d4 c d es8
  b8 c c h es d g4

  f4 es8 d d e4 e8
  f8 f e d cis4 d
  g4 f8 es4 d f8
  a8 f g4 f d8 es

  es8 f d d8 es4 f8 d
  es4 d8 c b b d f
  g4 f8 d b es d4
  d4 c b c\fermata
}

tenora = \relative c' {
  c8 d b4. c4 d8
  f8 f d4 c8 b g g~
  g8 b c4 g8 g f g
  g4 c8 g4. b8 c

  d8 g,4 fis8 g e8 a g
  f8 c' h a g f f b
  d8 d d c4 b a8
  a8 a g4 b4 g~
  g8 f4 g8 g4 c

  c8 b as g4 g8 fis g
  g8 g f4 g8 a b4
  b4 a8 g f4 g\fermata
}

bassa = \relative c {
  c4 es8 f4 g8 b g8
  d8 f8 g4 as,8 b c4
  es8 b4 c h c8
  es8 es f d c b4 as8

  g8 c8 b a g4 c
  d4 e a, d
  b4 d8 es c g' f f
  c8 d es4 d8 c b4

  es8 d4 b8 c g as b
  c8 d4 es es8 d b
  es8 c4 d8 es4 d
  g4 c, d c\fermata
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \new Voice { % \articulate {
  \keytempoetc
  \sopa
} % }

malto = \new Voice { % \articulate {
  \keytempoetc
  \altoa
} % }

mtenor = \new Voice { % \articulate {
  \keytempoetc
  \tenora
} % }

mbass = \new Voice { % \articulate {
  \keytempoetc
  \bassa
} % }

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

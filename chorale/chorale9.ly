%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/
%
% timidity --config-file=organ.cfg

\version  "2.18.2"
\language "deutsch"

\header {
  title       = "Chorale No. 9"
  composer    = "Jeremy Mates"
  subsubtitle = "2015-09-17"
  copyright   = \markup { \teeny {
    \char ##x00A9
    "2015 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=110 }

tempoandetc = {
  \set Score.tempoHideNote = ##t
  \override Staff.TimeSignature #'stencil = ##f
  \accidentalStyle "neo-modern"
  \time 3/4
  \normtempo

  \key c \major
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

sopa = \relative a' {
  \partial 2 c2

  h4 c d8 c
  h4 c8 h a4
  h2 g4
  c2 h4~

  h4 a g
  d'4 c a
  g2~ g8. r16
  b2 b4

  b4 b4. as8
  g4 b a
  g4. a8 h c
  d8 c h4 c

  c4 b b
  h2~ h8. r16
  g2 g4
  f4 g a~

  a4 a4 h8 cis
  d2 d4
  cis2 d8 cis
  h4 a h8 cis

  d4 d h
  a4 h2
  cis4 d2
  d4 c4. d8

  e4 f8 e d4
  e4 h c8 d
  e2 e8 d
  c4 e d8 c

  d4 d d
  c4 h \tempo 4=72 c\fermata
}

altoa = \relative d' {
  \partial 2 e2

  gis4 a8 g fis4
  g2~ g8 d8
  d2 d4
  e4 fis g8 f

  e4 f e
  f4 e d
  e2~ e8. r16
  g2.~

  g4 g f
  es4 d d4
  d2 g8 f~
  f8 es8 d4 c

  es4 d es8 f
  g2~ g8. r16
  d4 e es
  d2 cis4

  d4 fis g
  g4 fis e
  e2 d4
  e4 fis8 e g4

  a2 g4
  fis2 e8 d
  e4 fis2
  g8 f e4 f

  g4 c h8 a
  g4 g8 fis g4~
  g8 f e4 g
  a4 c h8 a

  g4 f g
  a4 g8 f g4
}

tenora = \relative g {
  \partial 2 g2

  f'4 e d4~
  d e,4 fis
  g2 g4~
  g4 c g

  g4 f b
  a8 g a4 a8 h
  c2~ c8. r16
  d2 d4~

  d4 es d8 c
  b4 g a
  b8 a g f g4
  g8 a g2

  g8 a b as g as
  d2~ d8. r16
  h4 a4. h8
  a4 g2

  a4 a4. e'8
  h4 h4. h8
  a2 fis4
  g4 d'8 cis h a

  a4 h4. e8
  cis4 h h
  a4 a2
  h4 g f8 e

  h'4 a d8 d
  h8 c d4 c8 h
  a4 c4~ c8 h8
  d4 a2

  h4 h h8 c
  d4. d8 e4
}

bassa = \relative c {
  \partial 2 c2

  d4 c h8 a
  g4 c d
  g,2 h4
  a4 fis e'8 d

  c4 d e4
  d8 e f2
  g2~ g8. r16
  g,2 g4

  g4 c4. d8
  es4 es, fis
  g4. d'8 g,4
  c4 d es

  c4 g'8 f es d
  g2~ g8. r16
  g,4 c2
  d8 c h4 a

  d4. cis8 h a
  g2 g4
  a2 h8 d
  e4 h e

  fis8 e d4 e
  fis4 d g8 fis
  e4 d2
  g,4 c a

  g4 f g
  e'4 d e8 d
  c2 g4
  f'4 c d
  g4 d e

  f4 g c,
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \new Voice { \voiceOne
  \tempoandetc
  \sopa
}

malto = \new Voice { \voiceTwo
  \tempoandetc
  \altoa
}

mtenor = {
  \tempoandetc
  \tenora
}

mbass = {
  \tempoandetc
  \bassa
}

themidi = {
 <<
  \set Score.midiChannelMapping = #'staff
  % may need e.g. if feeding to synth
  %\set Score.midiChannelMapping = #'instrument

  % comment these out to listen to a particular voice only
  \new Staff = "soprano" << \msop >>
  \new Staff = "alto" << \malto >>
  \new Staff = "tenor" << \mtenor >>
  \new Staff = "bass" << \mbass >>
 >>
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SCORE

ssop = \new Voice {
  \tempoandetc
  \voiceOne
  \sopa
  \bar "|."
}

salto = \new Voice {
  \tempoandetc
  \voiceTwo
  \altoa
  \bar "|."
}

stenor = {
  \tempoandetc
  \clef bass
  \tenora
  \bar "|."
}

sbass = {
  \tempoandetc
  \bassa
  \bar "|."
}

upper = {
  \clef treble
  \set Staff.printPartCombineTexts = ##f
  \partcombine \ssop \salto
}

lower = {
  \clef treble
  \stenor
}

thescore = {
 <<
  \new PianoStaff << \new Staff \upper \new Staff \lower >>
  \new Staff << \clef bass \sbass >>
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

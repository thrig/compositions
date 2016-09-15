%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version  "2.18.2"
\language "deutsch"

\header {
  title       = "Chorale No. 11"
  composer    = "Jeremy Mates"
  subsubtitle = "2015-11-25"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2015 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=52 }

keytempoetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 4/4
  \normtempo

  \key g \major
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

sopa = \relative d' {
  fis4. g8 a h4.
  r2 c8 h g a
  r8 h8 a h4 d8 e4
  r8 h4 c8 r8 c8 h h~

  h8 r8 r2 e4~
  e4 fis8 e d h a4
  h4 a4 r8 h4 h8~
  h8 h4 d h4.
}

sopb = \relative fis' {
  a4. h8 cis4 a4~
  a8 h fis8 g a4 d4\rest
  d2\rest fis,4 fis'
  e4 d8 cis8 d4. r8

  d4 h4 e4. d8
  cis8 h cis2~ cis8 r8
  r8 cis8 d2 h4
  a2 r4 fis4~
}

sopc = \relative fis' {
  fis4 fis8 e h'8 a h4
  h8 g a4 a4 a4
  g8 fis fis4 g fis~
  fis4 g2 r4

  a4 h4. r8 g4~
  g4 fis r4 e4
  fis8 g a4 \tempo 4=51 h \tempo 4=49 h
  \tempo 4=45 h1
}

altoa = \relative g' {
  d4 h c h8 c
  d8 fis g4. r4 fis8 e
  d4 fis h8 a r8
  r8 g8 fis e4 r4.

  fis4 a h8 h, c d
  c4. r8 d4 fis8 e
  d4 fis4 r8 g4.~
  g8 a8 g2 r8 e
}

altob = \relative fis' {
  fis4 d4 fis8 e4.
  fis8 g d2.
  e4 c2\rest d4
  e4 g4 a4. r8

  g2. fis4
  e8 d cis8 r8 a'4 fis4
  g8 a g8 fis8 r2
  r4 e4. d8 cis4
}

altoc = \relative fis' {
  d2 d2
  e4 d8 e8 r4 e4~
  e8 d r4 c4. c8
  d2 r4 e4

  c4 d h8 c d fis
  e4 d2 r4
  d4 c4 g'4 e
  dis1
}

tenora = \relative h {
  h4 d r4 h4~
  h4 r4 e4. d8~
  d8 h c r4 fis, e8
  g2 e4 r4

  d'4 c h8 d a4
  r4 h4. g8 a8 r8
  fis8 g8 a4 fis4 r4
  r8 d8 g4. r8 d8 e
}

tenorb = \relative a {
  r8 cis4 h8 a2~
  a8 g a4 r4 fis8 g
  a8 cis d4. r8 fis,4
  h8 a d2.~

  d4 r4 g,4 a8 h
  cis2~ cis8 d8 e d 
  e4 r4 e,8 fis4 g8
  a2 d,4 r4
}

tenorc = \relative fis {
  fis2. h8 c~
  c8 h8 a g8 a2
  r4 a4 g4 a4
  h4 g4 h4 a4~

  a4 g4 r2
  c4 r4 a4 g4
  r4 r4 g4 r4
  fis1
}

bassa = \relative h, {
  h4. r8 fis'4 d
  e4 c2 r4
  r8 fis4. e8 d4 c8~
  c8 r8 r2 r8 d8~

  d8 h4 c8 d4 r4
  e8 fis4 g8 g, h r4
  h4. r8 d4 e4
  g8 fis4 r8 a, h4 r8
}

bassb = \relative h {
  fis8 e d4. cis4.
  r4 d4. c8 h4
  a4 fis'2 r4
  g2 fis4 d8 cis

  h8 cis d e~ e r4.
  a4. g8 fis e d4
  cis2 r4 d4
  cis4 cis4 r4 fis4
}

bassc = \relative h, {
  h4 h8 c d fis g4~
  g8 r8 fis8 e d4 c
  g'4 d4 e4 fis4
  d4 r4 r2

  r2 g8 fis fis4
  r4 fis2 r4
  d2 g,4 a
  h1
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = {
  \keytempoetc
  \sopa
  \sopb
  \sopc
}

malto = {
  \keytempoetc
  \altoa
  \altob
  \altoc
}

mtenor = {
  \keytempoetc
  \tenora
  \tenorb
  \tenorc
}

mbass = {
  \keytempoetc
  \bassa
  \bassb
  \bassc
}

themidi = {
 <<
  \set Score.midiChannelMapping = #'instrument

  \new Staff = "soprano" << \msop >>
  \new Staff = "alto" << \malto >>
  \new Staff = "tenor" << \mtenor >>
  \new Staff = "bass" << \mbass >>
  % optional track doublings
% \new Staff = "bbass" << \transpose c c, { \mbass } >>
% \new Staff = "ssoprano" << \transpose c c' { \msop } >>
 >>
}

\score {
  \themidi
  \midi { }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SCORE

ssop = \new Voice {
  \keytempoetc
  \voiceOne
  \sopa
  \sopb
  \sopc
  \bar "|."
}

salto = \new Voice {
  \keytempoetc
  \voiceTwo
  \altoa
  \altob
  \altoc
  \bar "|."
}

stenor = {
  \keytempoetc
  \clef bass
  \tenora
  \tenorb
  \tenorc
  \bar "|."
}

sbass = {
  \keytempoetc
  \bassa
  \bassb
  \bassc
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

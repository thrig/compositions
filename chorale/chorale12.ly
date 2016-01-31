%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version  "2.18.2"

\header {
  title       = "Chorale No. 12"
  composer    = "Jeremy Mates"
  subsubtitle = "2016-01-31"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=92 }
fermtempo = { \tempo 4=52 }

keytempoetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 4/4
  \normtempo

  \key d \major
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Music

sopa = \relative d'' {
  d8 fis e d cis4 d
  e4 b8 cis d4 cis8 b
  a4. r8 a4 a4
  b4 b cis b8 a

  d4. cis8 b a b4
  b4 a4. r8 a4
  g8 a g g b8 cis d4~
  d4 e8 d c4 b

  d4 d4. r8 a4
  b16 a g8 g a a b a4
  g4 a4. r8 a4
  fis4 gis8 a b cis d e

  cis4 b a b8 b
  d8 cis b4 a a
  g8 a b g cis4 \fermtempo d\fermata
}

altoa = \relative g' {
  a2. g8 fis
  e8 fis g4 g4. g8
  fis4. r8 d4 cis
  dis8 e16 fis gis4 e d8 cis

  b8 e d8 e4 fis8 e4
  e8 d cis4. r8 d4
  e4 e4. g8 fis4
  g8 fis e fis a4. g8

  fis4 fis4. r8 cis4
  fis4 e2 d4
  g4 fis4. r8 e4
  d4 e4 d8 cis b4

  cis4 e4. fis16 e d4
  fis4 gis cis,2~
  cis4 d e fis\fermata
}

tenora = \relative b {
  d4 cis a b
  cis4 b g a
  a4. r8 fis4 e
  fis4 e a4 g8 fis

  fis8. g16 a4 d, e8 fis
  gis4 e4. r8 fis4
  cis'4. b8 gis4 a
  b4. a8 fis4 g

  d'4 a4. r8 a4
  d4 d cis8 d16 e fis8 e
  d4 d4. r8 cis4
  b4 a fis gis

  a4 gis e fis
  d4 e e fis
  g!8 fis4 g8 a4 a\fermata
}

bassa = \relative b, {
  d4 a8 b cis4 b
  a4 g8 a b4 a
  d4. r8 d,4 a'
  a4 e'4. b8 d4

  d4 fis g8 fis gis4
  gis,4 a4. r8 d4
  cis4 e e d
  g4 c, d8 a e'4

  d4 d4. r8 fis4
  b,4 e fis fis
  g8 fis d4. r8 a4
  d4 cis d e

  a,4 cis2 b4~
  b8 a gis4 a d
  e4 d a d\fermata
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
  \set Score.midiChannelMapping = #'voice

  \new Staff = "soprano" << \msop >>
  \new Staff = "alto" << \malto >>
  \new Staff = "tenor" << \mtenor >>
  \new Staff = "bass" << \mbass >>
  % bass boost if laptop has crummy speakers
% \new Staff = "bbass" << \transpose b b, { \mbass } >>
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

stenor = {
  \keytempoetc
  \clef bass
  \tenora
  \bar "|."
}

sbass = {
  \keytempoetc
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

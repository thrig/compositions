% LilyPond engraving system - http://www.lilypond.org/

\version "2.18.2"
\include "articulate.ly"

\header {
  title = "counterpoint practice"
  tagline = #f
}

tempoandetc = {
  \tempo 4=72
  \key d \minor
  \time 2/4
}

altoa = \relative f' {
  d8 d d16 e f8
  e8 g f8. g16
  f16 e d8 d d
  d16 e f e f8 f

  d8 f a a
  g16 f g8 a16 g a8
  bes16 a g8 a f
  g8 g a16 g f8

  f8 g16 f g8 e16 f
  g8 g a a
  g16 f e8 f16 e f8
  f8 a a g16 f

  g8 a g f16 e
  d4 r4
}

tenora = \relative c' {
  R2
  r4 r8. bes16
  c16 bes d8 d8. c16
  bes16 a d c d4

  d8 d c4
  c16 d e8 f8. e16
  d8 r8 d8 f
  bes,8 e16 d c bes d e

  d8 e16 d c8 bes16 d
  e16 f e8 d d
  e16 d c8 d16 c d8
  R2

  R2
  R2
}

bassa = \relative c {
  d4 d
  a'8 e d8. bes'16
  a16 g f8 f8 f8
  d16 c a' g f8 f8

  f16 e d8 f8 f
  g8 g8 f d
  bes16 c d e f8 d
  e8 c4 d8

  d8 d8 e16 f g8
  c,4 f8 d8
  g8 a4 d,8
  d8 d16 e f8 e

  g8 f4 r8
  R2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

malto = \new Voice {
  \tempoandetc 
  \set Staff.midiInstrument = #"acoustic guitar (steel)"
  \altoa
}

mtenor = {
  \tempoandetc 
  \set Staff.midiInstrument = #"acoustic guitar (steel)"
  \tenora
}

mbass = {
  \tempoandetc 
  \set Staff.midiInstrument = #"acoustic guitar (steel)"
  \bassa
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SCORE

salto = \new Voice {
  \tempoandetc 
  \altoa
  \bar "|."
}

stenor = {
  \tempoandetc 
  \tenora
  \bar "|."
}

sbass = {
  \tempoandetc 
  \bassa
  \bar "|."
}

thescore = {
  \new StaffGroup <<
    \new Staff << \clef sop \salto >>
    \new Staff << \clef sop \stenor >>
    \new Staff << \clef bass \sbass >>
  >>
}

themidi = {
  <<
    \set Score.midiChannelMapping = #'staff
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
  \articulate { \themidi }
  \midi { }
}

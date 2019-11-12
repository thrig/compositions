% LilyPond engraving system - http://www.lilypond.org/
%
%  <f a des>1
%  <g bes d>
%  <a g e'>
%  <gis c e>
%  <a c ees>
%  <fis bes d>
%  <g bes cis>
%  <fis a d>
%
% midiutil fuzz

\version "2.18.2"
\include "articulate.ly"

\header {
  title   = "A Cheerful Background Progression"
  composer = "Jeremy Mates"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2019 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

tempoandetc = {
  \accidentalStyle "modern"
  \tempo 4=48
}

sop = \relative c' {
  \tempoandetc
  \set Staff.midiInstrument = #"cello"
  \mark "A"
  des1 d e e ees d cis d
  \mark "B"
  e f g g ges f e f
  \mark "C"
  dis e fis fis f e dis e
  \mark "A"
  des d e e ees d cis d
}

alt = \relative c' {
  \clef alto
  \tempoandetc
  \set Staff.midiInstrument = #"cello"
  a1 bes g c c bes bes a
  c des bes ees ees des des c
  b c a d d c c b
  a bes g c c bes bes a
}

ten = \relative c {
  \clef bass
  \tempoandetc
  % need instrument otherwise Logic es estúpido and transposes tenor +12
  \set Staff.midiInstrument = #"cello"
  f1 g a gis a fis g fis
  aes bes c b c a bes a
  g a b ais b gis a gis
  f g a gis a fis g fis
}

thescore = {
  \new StaffGroup <<
    \new Staff << \sop >>
    \new Staff << \alt >>
    \new Staff << \ten >>
  >>
}
themidi = {
  \new StaffGroup <<
    \new Staff << \sop >>
    \new Staff << \alt >>
    \new Staff << \ten >>
  >>
}

\score { \thescore }
\score { \articulate { \themidi } \midi { } }

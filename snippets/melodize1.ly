% LilyPond engraving system - http://www.lilypond.org/
%
% Walker alias method derived random melody (using Math::Random::Discrete) with
% manual adjustments to improve the flow and make better use of motifs. The
% base minor mode odds for members of the chromatic scale were:
%
%   6.33, 2.68, 3.52, 5.38, 2.6, 3.53, 2.54, 4.75, 3.98, 2.69, 3.34, 3.17
%
% via "Krumhansl, C. L., and E. J. Kessler. 1982. Tracing the dynamic changes
% in perceived tonal organization in a spatial representation of musical
% keys" by way of "Music and Probabiliy" by David Temperley, though these odds
% were run through a scaling equation x**odds though I forget what x was (six
% or seven, maybe?) to better stay in the mode.

\version "2.18.2"
\include "articulate.ly"

\header {
  title       = "melodize1"
  subsubtitle = "2015-01-12"
  composer    = "Jeremy Mates"
  copyright   = \markup { \teeny {
"© 2015 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

themusic = \relative c'' {
  a4 fis gis b
  a fis gis b
  a fis gis c
  a fis gis b

  a cis d e
  f cis d e
  cis a fis gis
  ais a fis gis

  b a fis ais
  b a fis gis
  b a fis gis
  c a fis ais

  cis d f e
  cis d a fis
  gis g a fis
  gis g a b

  cis d eis fis
}
\score {
  \new Staff << {
    \clef treble
    \key fis \minor
    \accidentalStyle "neo-modern"
    \themusic
    \bar "|."
  } >>
  \layout { }
}
\score {
  \new Staff << {
    \set Staff.midiInstrument = #"celesta"
    \tempo 4=84
    \themusic
  } >>
  \midi { }
}

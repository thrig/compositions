%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version  "2.18.2"

\header {
  title       = \markup { "Somewhat Random Walk" }
  composer    = "Jeremy Mates"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=120 }

keytempoetc = {
  \set Score.tempoHideNote = ##f
  \accidentalStyle "modern"
  \time 4/4
  \normtempo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Music

themusic = {
  \keytempoetc
  \set Staff.instrumentName = #'"Kalimba"
  \set Staff.midiInstrument = #'"kalimba"
  \autoBeamOff
  \include "out.ly"
  \bar "|."
} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Score

thescore = {
 <<
  \set Score.midiChannelMapping = #'instrument
  \new Staff \themusic
 >>
}

\book {
% \paper {
%   #(set-paper-size "letter")
% }
  \bookpart {
    \score {
      \thescore
      \layout { }
      \midi { }
    }
    \markuplist { \wordwrap-lines { \with-color #grey {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
    } } }
  }
}

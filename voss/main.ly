%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version  "2.18.2"

\header {
  title       = \markup { "Voss Orbit" }
  meter       = \markup { \sans \teeny
    "    Dynamic changes should be moderate in nature."
  }
  composer    = "Jeremy Mates"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

% Doubtless wrong, listen to MIDI for a better starting point.
normtempo = { \tempo 4=96 }

keytempoetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 4/4
  \normtempo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Music

thebells = {
  \keytempoetc
  \set Staff.instrumentName = #'"T.Bells"
  \include "out-tb.ly"
  \bar "||"
} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Score

thescore = {
 <<
  \set Score.midiChannelMapping = #'instrument
  \new Staff \thebells
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

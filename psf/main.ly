%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version  "2.18.2"

\header {
  title       = \markup { "Procrustean Function Of" }
  subtitle    = \markup { \hspace #10 \column {
\line { \typewriter { "(+ (* 2.39 (sin (+ (* 4.19 x) 5.16)))" } }
\line { \typewriter { "   (* 0.22 (sin (+ (* 2.03 x) 1.14)))" } }
\line { \typewriter { "   (* 1.14 (sin (+ (* 0.18 x) -4.96))))" } }
} }
  composer    = "Jeremy Mates"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=102 }

keytempoetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 4/4
  \normtempo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Music

flute = {
  \keytempoetc
  \set Staff.instrumentName = #'"Flute"
  \set Staff.midiInstrument = #'"flute"
  \include "out-flute.ly"
  \bar "||"
} 
harp = {
  \keytempoetc
  \set Staff.instrumentName = #'"Harp"
  \set Staff.midiInstrument = #'"orchestral harp"
  \include "out-harp.ly"
  \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Score

thescore = {
 <<
  \set Score.midiChannelMapping = #'instrument
  \new StaffGroup << \new Staff \flute \new Staff \harp >>
 >>
}

\book {
  \paper {
    #(set-paper-size "letter")
  }
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
  \bookpart {
    \header {
      title    = \markup { "Procrustean Function Of" }
      subtitle = "Flute"
    }
    \score {
      << \new Staff \flute >>
      \layout { }
    }
  }
  \bookpart {
    \header {
      title    = \markup { "Procrustean Function Of" }
      subtitle = "Harp"
    }
    \score {
      << \new Staff \harp >>
      \layout { }
    }
  }
}

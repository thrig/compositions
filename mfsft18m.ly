%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% LilyPond engraving system - http://www.lilypond.org/                       %

\version "2.18.2"
\include "articulate.ly"

\header {
  title = "Music for Slightly Fewer Musicians Than 18"
  composer = "Jeremy Mates"
  subsubtitle = "2016-07-22"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

tempoandetc = {
  \accidentalStyle "neo-modern"
  \tempo 4=94
  \time 6/8
  \key a \minor
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %

seven = {
  \set Staff.midiInstrument = #"orchestral harp"
  \include "voice6.ly"
  e''2.\f
}

six = {
  \set Staff.midiInstrument = #"orchestral harp"
  \include "voice4.ly"
  a'2.\!
}

five = {
  \set Staff.midiInstrument = #"dulcimer"
  \include "voice5.ly"
  c''2.\!\p
}

four = {
  \set Staff.midiInstrument = #"dulcimer"
  \include "voice3.ly"
  a'2.\!\p
}

three = {
  \include "voice2.ly"
  a2.\f
}

two = {
  \set Staff.midiInstrument = #"timpani"
  \include "voice1.ly"
  a2.\!
}

one = {
  \include "voice0.ly"
  a,2.\!
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %

stseven = {
  \tempoandetc 
  \seven
  \bar "|."
}

stsix = {
  \tempoandetc 
  \six
  \bar "|."
}

stfive = {
  \tempoandetc 
  \five
  \bar "|."
}

stfour = {
  \tempoandetc 
  \four
  \bar "|."
}

stthree = {
  \tempoandetc 
  \three
  \bar "|."
}

sttwo = {
  \tempoandetc 
  \two
  \bar "|."
}

stone = {
  \tempoandetc 
  \one
  \bar "|."
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %

thescore = {
 <<
     \new PianoStaff <<
       \set PianoStaff.instrumentName = #"Harp"
       \new Staff << \stseven >>
       \new Staff << \stsix >>
     >>

     \new Staff <<
       \set Staff.instrumentName = #"Dulcimer"
       \stfive
     >>
     \new Staff <<
       \set Staff.instrumentName = #"Dulcimer"
       \stfour
     >>

     \new Staff <<
       \set Staff.instrumentName = #"Timpani"
       \clef bass \sttwo
     >>

     \new PianoStaff <<
       \set PianoStaff.instrumentName = #"Piano"
       \new Staff << \stthree >>
       \new Staff << \clef bass \stone >>
     >>
 >>
}

\score {
  \thescore
  \layout { }
  \midi { }
}

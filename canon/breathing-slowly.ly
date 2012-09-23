% LilyPond engraving system - http://www.lilypond.org/
%
% Inverse Canon (plus a Clarinet).

\version "2.16.0"
\include "articulate.ly"

\header {
  title       = "Breathing Slowly"
  subsubtitle = "2012-09-22"
  composer    = "Jeremy Mates"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

keytempoetc = {
  \tempo "Adagio Tranquillamente" 4=72
  \time 4/4
}

voiceone = \relative g' {
  \keytempoetc
  \key g \major
  \clef treble

  g1->\mp
  a-> d-> c-> e-> g-> a-> g,->
  a-> d-> c-> e-> g-> a-> g,->
  a-> b-> a->\p g--\pp
}

voicetwo = \relative c' {
  \keytempoetc
  \key g \major
  \clef bass

  R1
  c->\p b-> fis-> g-> e-> c-> b->
  c'-> b-> fis-> g-> e-> c-> b->
  
  fis'-> g-> d->\pp g--\ppp
}

voicethree = \relative a' {
  % for Clarinet
  \transposition bes
  \keytempoetc
  \key a \major
  \clef treble

  R1
  b1->\pp cis1-> b1-> cis-> cis-> d-> e->
  fis1-> cis1-> b1-> cis-> cis-> d-> e->
  d-> cis-> gis->\ppp a--\pppp
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Misc.     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

upper = {
  \set Staff.instrumentName = #"Oboe"
  \set Staff.midiInstrument = #"oboe"
  \voiceone

  \bar "|."
}

middle = {
  \set Staff.instrumentName = \markup { Clarinet B\flat }
  \set Staff.midiInstrument = #"clarinet"
  \voicethree

  \bar "|."
}

lower = {
  \set Staff.instrumentName = #"Bassoon"
  \set Staff.midiInstrument = #"bassoon"
  \voicetwo

  \bar "|."
}

theblackdots = {
  <<
    \new StaffGroup <<
      \override Score.BarNumber #'break-visibility = #'#(#t #t #t)
      \set Score.barNumberVisibility = #(every-nth-bar-number-visible 2)

      \new Staff = "upper" \upper
      \new Staff = "middle" \middle
      \new Staff = "lower" \lower
    >>
  >>
}

themusic = {
  <<
    \new PianoStaff <<
      \set Score.midiChannelMapping = #'instrument
      \new Staff = "upper" \upper
      \new Staff = "middle" \middle
      \new Staff = "lower" \lower
    >>
  >>
}

\score {
  \theblackdots
  \layout { indent = 2.3\cm }
}
\score {
% DBG
  \unfoldRepeats \themusic
% \unfoldRepeats \articulate { \themusic }
% \articulate { \themusic }
  \midi { }
}
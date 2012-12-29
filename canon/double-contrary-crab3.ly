% LilyPond engraving system - http://www.lilypond.org/
%
% p.135 moleskine #014
%
% timidity --config-file=organ.cfg

\version "2.16.0"
\include "articulate.ly"

\header {
  title       = "Double Contrary Crab Canon III"
  subtitle    = "(III as in it took two prior failed attempts to obtain something not horrible)"
  subsubtitle = "2012-12-29"
  composer    = "Jeremy Mates"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

keytempoetc = {
  \key c \major
  \tempo 4=72
  \time 2/4
}

soprano = \relative g' {
  \keytempoetc \clef treble

  g2~
  \bar "||"

  g2
  c2
  f,2
  g8 a b4
  a2
  r4 f
  g2
  a8 b c4~

  \set Score.tempoHideNote = ##t
  \bar "||"
% or something but can't get it just right in notation
% c4. \times 2/3 { b16 a b } |
  \tempo 4=66
  c4( b
  \tempo 4=42
  c2)\shortfermata |
}

alto = \relative e' {
  \keytempoetc \clef treble

  r4 e4~
  \bar "||"

  e4 c~
  c4 f
  r4 f
  e2
  d4 c
  d8 e b4
  e4 r
  f2

  \bar "||"
  g4( d g2)\shortfermata
}

tenor = \relative g {
  \keytempoetc \clef bass

  r2
  \bar "||"

  g2
  r4 a4
  d4 a8 b
  c4 b
  a2
  g4 r
  g4 c~
  c4 a4

  \bar "||"
  g2~ g\shortfermata
}

bass = \relative c {
  \keytempoetc \clef bass

  \override TextScript #'staff-padding = #2.0
  \override TextScript #'Y-extent = #'(-1.5 . 1.5)

  c2
  \bar "||"

  c4_"I" d8 e
  f2_"IV"
  g4_"V" r4
  e2_"I6"
  d4_"II" e8 f
  g2_"V"
  c,2_"I"
  f2_"IV"

  \bar "||"
  c4 r c2\shortfermata
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Misc.     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

sopranoline = {
% \set Staff.instrumentName = #"Violin"
  \set Staff.midiInstrument = #"church organ"
  \soprano

  \bar "|."
}

altoline = {
% \set Staff.instrumentName = "Viola"
  \set Staff.midiInstrument = #"church organ"
  \alto

  \bar "|."
}

tenorline = {
% \set Staff.instrumentName = #"Cello"
  \set Staff.midiInstrument = #"church organ"
  \tenor

  \bar "|."
}

bassline = {
% \set Staff.instrumentName = #"Cello"
  \set Staff.midiInstrument = #"church organ"
  \bass

  \bar "|."
}

theblackdots = {
  <<
    \new StaffGroup <<
%     \override Score.BarNumber #'break-visibility = #'#(#t #t #t)
%     \set Score.barNumberVisibility = #(every-nth-bar-number-visible 2)

      \new Staff = "soprano" \sopranoline
      \new Staff = "alto" \altoline
      \new Staff = "tenor" \tenorline
      \new Staff = "bass" \bassline
    >>
  >>
}

themusic = {
  <<
    \new PianoStaff <<
      \set Score.midiChannelMapping = #'instrument
      \new Staff = "soprano" \sopranoline
      \new Staff = "alto" \altoline
      \new Staff = "tenor" \tenorline
      \new Staff = "bass" \bassline
    >>
  >>
}

\score {
  \theblackdots
  \layout {
%   indent = 2.3\cm
  }
}
\score {
% DBG
% \unfoldRepeats \themusic
% \unfoldRepeats \articulate { \themusic }
  \articulate { \themusic }
  \midi { }
}

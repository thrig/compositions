% LilyPond engraving system - http://www.lilypond.org/
%
% Crab canon, with "bookends" to begin and end it.

\version "2.16.0"
\include "articulate.ly"

\header {
  title       = "Crab Canon with Bookends"
  subsubtitle = "2012-12-16"
  composer    = "Jeremy Mates"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

keytempoetc = {
  \key c \minor
  \tempo "Moderato" 4=108
  \time 2/4
}

voiceone = \relative g' {
  \keytempoetc
  \clef treble

  g2
  aes4 f
  d2
  ees4 g
  f4 aes
  \bar "||"
  c2
  bes2
  aes2
  g2
  aes2
  g4 f
  f'4 \once \set suggestAccidentals = ##t e
  d4 c
  \bar "||"
  ees4 d
  c4 b
  c2~ c2~ c2
}

voicetwo = \relative c' {
  \keytempoetc
  \clef alto

  c4 g
  f2
  g4 b
  c4 bes
  aes4 f
  g4 aes
  bes4 c
  c,4 d
  ees2
  d2
  ees2
  f2
  g2
  aes2
  g2
  c2
  g2
  c,2
}

voicethree = \relative c {
  \keytempoetc
  \clef bass

  c2
  f
  g
  c,
  d
  g,~
  g
  aes~
  aes
  f
  c
  d
  g
  c,~
  c~
  c~
  c~
  c
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Misc.     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

upper = {
  \set Staff.instrumentName = #"Violin"
  \set Staff.midiInstrument = #"violin"
  \voiceone

  \bar "|."
}

middle = {
  \set Staff.instrumentName = "Viola"
  \set Staff.midiInstrument = #"viola"
  \voicetwo

  \bar "|."
}

lower = {
  \set Staff.instrumentName = #"Cello"
  \set Staff.midiInstrument = #"cello"
  \voicethree

  \bar "|."
}

theblackdots = {
  <<
    \new StaffGroup <<
%     \override Score.BarNumber #'break-visibility = #'#(#t #t #t)
%     \set Score.barNumberVisibility = #(every-nth-bar-number-visible 2)

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
% \unfoldRepeats \themusic
% \unfoldRepeats \articulate { \themusic }
  \articulate { \themusic }
  \midi { }
}

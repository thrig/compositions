% LilyPond engraving system - http://www.lilypond.org/

\version "2.14.0"
\include "articulate.ly"

\header {
  title       = "Crab Canon"
  subsubtitle = "2012-09-14"
  composer    = "Jeremy Mates"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

keytempoetc = {
  \time 3/4
  \tempo "Vivace" 4=164
  \key d \minor
}

voicetwo = \relative b' {
  \set Staff.midiInstrument = #"harpsichord"

  \keytempoetc
  \clef treble

  R2.
  R2.
  a4 r2
  R2.

  d,4 r2
  a'4 r4 g4(
  f4 e8 d8 e4
  a4 g4) r4

  a4(-- d4 c4
  bes8 a8 g8 a8 g8 f8
  d4 e4 f4
  g8 e8 f4 d4

  f4 e4 d4
  c4 b4 a4)
  d4 cis4 r4
  e4 r2

  r4 f4 r4
  R2.
  R2.
  d4 r2

  \bar "|."
}

voiceone = \relative d' {
  \set Staff.midiInstrument = #"harpsichord"

  \keytempoetc
  \clef treble

  r2 d4
  R2.
  R2.
  r4 f4 r4

  r2 e4
  r4 cis4 d4
  a4( b4 c4
  d4 e4 f4

  d4 f4 e8 g8
  f4 e4 d4
  f8 g8 a8 g8 a8 bes8
  c4 d4 a4--)

  r4 g4( a4
  e4 d8 e8 f4
  g4) r4 a4
  r2 d,4

  R2.
  r2 a'4
  R2.
  R2.

  \bar "|."
}

combo = \relative d' {
  \clef treble
  \key d \minor
  \time 3/4

  r2 d4
  R2.
  a'4 r2
  r4 f r

  d4 r e4
  a4 cis, << { g'4
  f4 e8 d e4
  a4 g r
  a4-- d c
  bes8 a g a g f
  f8 g a g a bes
  c4 d a--
  r4 g a
  e4 d8 e f4
  g4
} \\ {
               d4
  a4 b c
  d4 e f
  d4 f e8 g
  f4 e d
  d4 e f
  g8 e f4 d
  f4 e d
  c4 b a
  d4
} >>
  cis4 a'
  e4 r d
  r4 f r
  r2 a4
  d, r2
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Misc.     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

theblackdots = {
  <<
    \new StaffGroup <<
      \new Staff = "voicetwo" \voicetwo
      \new Staff = "voiceone" \voiceone
    >>
  >>
}

themusic = {
  <<
    \new PianoStaff <<
      \set Score.midiChannelMapping = #'instrument

      \new Staff = "voicetwo" \voicetwo
      \new Staff = "voiceone" \voiceone
    >>
  >>
}

\score {
  \theblackdots
  \layout { }
}
\score {
  <<
    \override Score.SystemStartBar #'collapse-height = #1
    \new Staff << \combo >>
  >>
  \layout { }
}
\score {
  \articulate { \themusic }
  \midi { }
}

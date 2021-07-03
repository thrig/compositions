\version "2.18.2"
\include "articulate.ly"
\language "nederlands"

\header {
  title = "Rem Ipsumlo"
  subsubtitle = "2021-07-03"
  composer = "Jeremy Mates"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2021 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

themusic = {
  \tempo 4=128
  \autoBeamOff
  \repeat volta 2 {
c''16\mf r16
c'16--\f r16 r16 r16
c'''16\p r16 r16 r16
c'16 r16
c''16
ges'16
f'16 r16 r16
c'16 r16 r16 r16
c'''16--\mf r16 r16
bes''16\mp r16 r16
ees'16--\p r16 r16
f16\mf r16
ges'16 r16
ges'16\mp r16 r16 r16
c16\p r16 r16 r16
f'16\mp r16
c'16 r16
c'16\p r16
ees''16 r16 r16 r16
ges16\mf r16
g''16\mp r16
ges''16--\mf r16 r16
g'16-- r16 r16
g'16\p r16
f16\mf r16
ges'16--\p r16
g'16
ges'16 r16
bes'16\mf r16 r16
f16\f r16
bes16--\mf r16 r16
ees'16--\p r16 r16 r16
f16\f r16
c'16--\mp r16 r16 r16
bes''16\f r16
g'16\p
ges'16\f r16 r16 r16
c''16\p
c'''16-- r16 r16 r16
ges'16-- r16 r16 r16
bes'16\mf r16 r16
g''16\p r16
c''16--\mf r16 r16
ges''16 r16
ees'16 r16
ees''16\p
g16\f r16 r16
bes16\p r16 r16
f'16 r16 r16
ges''16\mf r16 r16
f'16\mp r16
ees'16 r16
ees'16--\p r16 r16 r16
bes''16--\mp r16
g16\p r16
ges''16\mf r16 r16
c''16 r16
f''16--\p r16
bes''16
c'16 r16 r16
ees16 r16 r16
g'16
c'''16--\mp r16 r16
f'16 r16 r16
ges16\mf r16
ges16--\mp r16 r16
bes'16--\p r16 r16
ges'16-- r16
g'16
f''16 r16 r16 r16
c''16
ges''16--\mp r16 r16
f''16\p
bes'16\mf r16
c''16\p r16
ges'16\mp r16
ees16 r16
c'''16\mf r16 r16
ees''16 r16
f16\mp r16 r16
bes'16\p r16 r16 r16
ees16\mp r16 r16
g''16\p r16
bes'16\mp r16 r16
bes''16 r16
c''16\mf r16 r16
f'16 r16 r16 r16
ges'16 r16
c16 r16 r16
g''16 r16
c'16\f r16 r16
bes''16\mf r16
c'16 r16 r16
g''16\f r16 r16
ees'16--\mp r16 r16
ges'16\p r16 r16
ges16-- r16 r16 r16
c'''16\mf r16
c'16\mp r16
c'16\p r16
ges'16
g16\f r16 r16
f16-- r16
c16\p
ges'16\mp r16 r16 r16
g'16\p r16 r16
ges''16 r16 r16
c''16\mp r16
c16\p
ges'16\mf r16
ees16\mp r16 r16
ees16-- r16 r16
g''16\mf r16 r16
ges'16\p
c''16--\mf r16 r16 r16
c'''16\mp r16 r16 r16
ges''16\f r16 r16
g''16\p
c16--\mp r16
ges'16--\f r16 r16 r16
bes''16\p r16
c16\mf r16
ges''16 r16
ges16\mp r16 r16 r16
ges16\p r16 r16 r16 r16
bes''16
c'16\mf r16
ges'16-- r16 r16 r16 r16
ees'16\mp r16 r16 r16
g16--\p r16 r16 r16
ges''16\mf r16 r16
f''16--\p r16 r16
f16
c'''16 r16
f16\mf r16 r16
f16--\mp r16
bes16\p
c'16\mf r16 r16
bes'16--\mp r16
g16 r16
f'16--\f r16 r16 r16 r16
ees'16\p r16 r16
ges''16\mf r16 r16
f16\f r16
f16--\mf r16 r16
g''16 r16 r16
ges''16--\mp r16 r16 r16 r16
c'''16 r16
ges'16 r16
f'16\mf r16
c'16\mp r16
ees'16--\mf r16 r16
ges'16--\mp r16 r16
ges16--\p r16 r16 r16
ges16\mf r16
c''16-- r16 r16 r16
bes16 r16 r16
g''16-- r16
f'16--\f r16 r16 r16
bes'16--\p r16 r16
g''16--\f r16 r16
ges'16\mf r16
g'16\mp r16 r16
f16\mf r16
f16\p r16
f16\f r16 r16
ees16--\mf r16 r16 r16
  }

  %\bar "|."
}

thescore = { << \new PianoStaff \autochange { \themusic } >> }
themidi = { << \new Staff \themusic >>  }

\score { \thescore \layout { } }
\score { \articulate { \themidi } \midi { } }

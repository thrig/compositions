\version "2.18.2"
\include "articulate.ly"
\language "nederlands"

\header {
  title = "Lorem Ipsum"
  subsubtitle = "2021-07-02"
  composer = "Jeremy Mates"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2021 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

themusic = \new Voice \with {
  \remove "Note_heads_engraver"
  \consists "Completion_heads_engraver"
  \remove "Rest_engraver"
  \consists "Completion_rest_engraver"
} {
  \tempo 4=144
  \repeat volta 2 {
  des''4-.\mp a'4-. ees'4-.\mf aes'4-.
  des'4-.\f ees''4-. e'4-.\mf a'8-. des''4\p
    r8 a'4-. aes'4-.\mp e''4-.\p
  ees'4-.\mf r8 a'8-. ees'8-.\mp a'8-. des''8-.\p r8
  a'8-. ees''8-.\mp r8 aes'8-.\p des''4-. a'8-.\mp des''4
    ees'8-.\p aes'4-. e'4-.\mp des''4-.\p
  a'4-. des'8-.\mp a'4-.\p e''4-. ees''8-.\mp
  aes'8-.\pp e''8-.\p aes'8-.\pp a'8-.\p ees''4-.\pp e'8-. ees''8-.
  a'8-. ees''4-.\p e'4-. r8 aes'4-.
  ees'4-. des'8-. aes'8-. a'8-.\mp ees''8-. e'8-.\p ees'4\pp
    des'8-. r8 aes'8-. r8 e'8-. r8 des''4
    r8 e'8-.\p r8 des'4-. r8 ees''4
    aes'8-. e'8-. ees''8-. aes'4-. r8 ees''4\pp
    r8 a'8-.\p r8 e''8-.\pp des''4-.\mp a'4
    r8 aes'4-.\p r8 e'4-.\mp aes'8-.\p
  ees'8-. e''4-. r8 aes'4-.\mp r8 a'4
    ees''4-. r8 aes'4-. a'4-.\mf
  des''8-. r8 ees''8-. r8 a'8-.\p r8 ees''8-. r8
  }
  des'4-. r8 aes'4-.\mp e''4-.\p r8
  a'4-. ees''4-.\mf a'4-.\f ees'8-.\mp aes'8-.\mf
  des'4-. a'8-. aes'8-. r8 ees'4-.\f r8
  e''4-. r8 aes'4-. r8 e'4-.
  r8 ees''4-.\f e'8-.\mp aes'8-.\p a'8-. r8 aes'8-.
  ees''8-.\mp r8 des'8-. e'4-.\mf a'4-. e'8-.\mp
  aes'8-. ees'4-.\mf e''8-.\mp des''8-.\p r8 ees''8-.\mp a'8-.\p
  aes'8-.\mp ees''8-.\mf aes'8-. e'8-.\mp aes'8-.\mf ees'4-.\p r8
  des'4-. r8 ees'4-. r8 e''4-.\mp
  a'4-. aes'4-. des''4-. ees''4-.\p
  r8 e''4-.\mf r8 ees'8-.\f r8 a'8-.\mf e''4
    des''4-.\p aes'4\mp r4.
  \bar "|."
}

upper = {
  \accidentalStyle "dodecaphonic"
  \themusic
}

lower = {
  \clef bass
  R1*30
}

thescore = {
 << \new PianoStaff << \new Staff \upper \new Staff \lower >> >>
}

themidi = {
 << \new Staff \themusic >>  
}

\score {
  \thescore
  \layout { }
}

\score {
  \articulate { \themidi }
  \midi { }
}

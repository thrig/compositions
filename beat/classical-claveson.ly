% LilyPond engraving system - http://www.lilypond.org/

\version "2.18.2"
\include "articulate.ly"

\header {
  title       = "Classical & Clave Son"
  composer    = "Jeremy Mates"
  subsubtitle = "2015-06-30"
  copyright   = \markup { \teeny {
"© 2015 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline     = ##f
}

#(define dinkdink '((hhc default #t 0)))

keytempoetc = {
  \tempo 4=120
  \time 2/4
}

right = {
  \set DrumStaff.instrumentName = #"Hang Drum"

  \drummode {
    \keytempoetc
    \repeat volta 31 {
      hhc8\f hhc16\mf hhc hhc8 hhc  hhc8\f hhc16\mf hhc hhc8 hhc
    }
    hhc8\f hhc16\mf hhc hhc8 hhc hhc8\f hhc16\mf hhc hhc8 hhc~
    hhc8 r8 r4
  }

  \bar "|."
}

left = {
  \set DrumStaff.instrumentName = #"Hang Drum"

  \drummode {
    \keytempoetc
    \repeat volta 31 {
      halfopenhihat16\f r8 halfopenhihat16\mf r8 halfopenhihat16 r16 r8 halfopenhihat16 r16 halfopenhihat16 r8 r16
    }
    halfopenhihat16\f r8 halfopenhihat16\mf r8 halfopenhihat16 r16 r8 halfopenhihat16\f r16 halfopenhihat4~\f halfopenhihat8 r8 r4
  }

  \bar "|."
}

theblackdots = {
  <<
    \new StaffGroup <<
      \new DrumStaff <<
        \set DrumStaff.drumStyleTable = #(alist->hash-table dinkdink)
        \override Staff.BarLine #'bar-extent = #'(-1.5 . 1.5)
        \override Staff.StaffSymbol #'line-positions = #'( 0 )
        \right
      >>
      \new DrumStaff <<
        \set DrumStaff.drumStyleTable = #(alist->hash-table dinkdink)
        \override Staff.BarLine #'bar-extent = #'(-1.5 . 1.5)
        \override Staff.StaffSymbol #'line-positions = #'( 0 )
        \left
      >>
    >>
  >>
}

themusic = {
  <<
    \new DrumStaff <<
      \set DrumStaff.drumStyleTable = #(alist->hash-table dinkdink)
      \override Staff.BarLine #'bar-extent = #'(-1.5 . 1.5)
      \override Staff.StaffSymbol #'line-positions = #'( 0 )
      \right
    >>
    \new DrumStaff <<
      \set DrumStaff.drumStyleTable = #(alist->hash-table dinkdink)
      \override Staff.BarLine #'bar-extent = #'(-1.5 . 1.5)
      \override Staff.StaffSymbol #'line-positions = #'( 0 )
      \left
    >>
  >>
}

\score {
  \theblackdots
  \layout { indent = 3\cm }
}
\score {
  \unfoldRepeats \articulate { \themusic }
  \midi { }
}

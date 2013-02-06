% Harmonization practice from Bach chorale upper voice - SATB version

\version "2.14.0"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

\header {
  title = "Chorale 1"
  composer = "Jeremy Mates"
  subtitle = "(Derived from the Soprano line of an unknown Bach Chorale)"
  subsubtitle = "2013-02-06"
  tagline = #f
}

sop = \relative b' {
  \set Score.tempoHideNote = ##t
  \tempo 4=76
  \stemUp
  \time 3/4

  \partial 4 g
  g2 d'4
  b4. a8 g4
  g4. a8 \tempo 4=68 b4
  \tempo 4=56
  a2\fermata \tempo 4=76 b4
  d2 c4
  b4 \tempo 4=68 a2
  \tempo 4=54
  g2

  \bar "||"
}

alto = \relative e' {
  \stemDown

  \partial 4 d4
  c4 e fis
  g8 fis e4 d
  e4 d8 c e4
  fis2 g4
  g4 fis8 e4 fis8
  g4 d4 e
  d2
}

tenor = \relative g {
  \stemUp

  \partial 4 b4
  c4 b8 a4.
  g4. a8 b4
  c4 b8 a g4
  a2 g8 a
  b4 fis8 g8 a4
  g4 fis2
  b2
}

bass = \relative g {
  \stemDown
  \override Voice.TextScript #'font-size = #-4

  \partial 4 g4
  e4. b8 d4
  d4 e8 fis g4
  c,4 d8 fis8 e4
  d2 d8 c
  b4 b c
  d2 c4
  g2

  \bar "||"
}

\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble
      \key g \major
      \new Voice = "sop" \sop
      \new Voice = "alto" \alto
    >>
    \new Staff <<
      \clef bass
      \key g \major
      \new Voice = "tenor" \tenor
      \new Voice = "bass" \bass
    >>
  >>
  \layout { }
}

\score {
  \new StaffGroup <<
    \set Score.midiChannelMapping = #'staff
    \new Staff <<
     \set Staff.midiInstrument = #"church organ"
      % plus a plagal cadence in the MIDI for fun
      \new Voice = "sop" {
        \sop
        \relative g' { \tempo 4=46 g2 \tempo 4=36 g r2 }
      }
    >>
    \new Staff <<
      \set Staff.midiInstrument = #"church organ"
      \new Voice = "alto" { \alto \relative d' { e2 d r2 } }
    >>
    \new Staff <<
      \set Staff.midiInstrument = #"church organ"
      \new Voice = "tenor" { \tenor \relative b { c2 b r2 } }
    >>
    \new Staff <<
      \set Staff.midiInstrument = #"church organ"
      \new Voice = "bass" { \bass \relative c { c2 g r2 } }
    >>
  >>
  \midi { }
}

  \markuplist { \paragraph { \tiny     {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
} } }

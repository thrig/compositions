% LilyPond engraving system - http://www.lilypond.org/

\version "2.16.0"
\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

\header {
  title       = "Etude No.1"
  subtitle    = "One Way Hash Function"
  composer    = "Jeremy Mates"
  subsubtitle = "2012-12-12"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

upper = {
  \accidentalStyle "neo-modern"
  \clef treble
  \key c \major
  \time 5/16
  \tempo \markup {
    "Staccato (dynamics to taste)"
    \with-color #(x11-color 'grey55)
    \teeny { "(" \general-align #Y #DOWN \note #"4" #1 = "66-76 )" }
  }
  \set Timing.beatStructure = #'(2 3)

  \partial 16
  \include "etude1.upper.ly"

  \bar "|."
}

upper_midi = {
  \tempo 4=72
  \include "etude1.upper-midi.ly"
}

lower = {
  \accidentalStyle "neo-modern"
  \clef treble
  \set Timing.beatStructure = #'(5)

  \partial 16
  \include "etude1.lower.ly"

  \bar "|."
}

lower_midi = {
  \include "etude1.lower-midi.ly"
}

\book {
  \paper {
    #(set-paper-size "letter")
  }
  \score {
    \new PianoStaff = "PianoStaff_pf" <<
      \new Staff = "Staff_pfUpper" << \upper >>
      \new Staff = "Staff_pfLower" << \lower >>
    >>
    \layout { }
  }
  \score {
    \unfoldRepeats \articulate {
      \new PianoStaff <<
        \set Score.midiChannelMapping = #'instrument
        \new Staff = "upper_midi" \upper_midi
        \new Staff = "lower_midi" \lower_midi
      >>
    }
    \midi {
      \context { }
    }
  }
  \markuplist { \paragraph {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
} }
}

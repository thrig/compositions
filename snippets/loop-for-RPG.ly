% LilyPond engraving system - http://www.lilypond.org/

\version "2.16.0"
\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?) (interpret-markup-list layout props (make-justified-lines-markup-list (cons (make-hspace-markup 4) args))))

\header {
  title       = "Loop for RPG?"
  subsubtitle = "2012-09-29"
  composer    = "Jeremy Mates"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

sop = \relative c'' {
  \time 4/4
  \tempo 4=76

  \repeat volta 2 {
    e1~ e e~ e e d des \key a \major e~ e e~ e
  }
}

alto = \relative a' {

  \repeat volta 2 {
    c1~ c c~ c c bes~ bes \key a \major cis b cis b
  }
}

tenor = \relative f' {

  \repeat volta 2 {
    a1 g a g fis gis~ gis \key a \major gis e gis e
  }
}

bass = \relative f' {

  \repeat volta 2 {
    f1_"I"
    e_"V6"
    f_"I"
    e_"V6"

    d~_"VI"
    d_"II64"
    e_"VII7*"
    \key a \major
    a,_"III (I)"

    gis_"(V6)"
    a_"(I)"
    gis_"(V6)"
  }
}

\markuplist { \paragraph {
Works well if looped in GarageBand with "Swirling Droplets" plus some
master track ambience fiddling, reminds me of filler music in an RPG
(e.g. when lazing about town). Tonic extension via inverse dominants and
then a somewhat workable modulation to III (started as a II->VII->III
modulation attempt), then III extension via its dominant.
} }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble

      \key f \major

      \set Staff.printPartCombineTexts = ##f
      \partcombine
      << \sop    >>
      << \alto   >>
    >>
    \new Staff <<
      \clef alto

      \key f \major

      \set Staff.printPartCombineTexts = ##f
      \partcombine
      << \tenor >>
      << \bass  >>
    >>
  >>
  \layout { }
}

% MIDI playback
\score {
  \unfoldRepeats {
% \articulate {
  \new PianoStaff <<
    \set Score.midiChannelMapping = #'instrument
    \new Staff <<
      \set Staff.printPartCombineTexts = ##f
      \partcombine
      << \sop    >>
      << \alto   >>
      << \bass  >>
      << \tenor >>
    >>
  >>
% }
  }
  \midi { }
}

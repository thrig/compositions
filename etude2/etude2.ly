% LilyPond engraving system - http://www.lilypond.org/

\version "2.16.0"
\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

\header {
  title       = "Etude No.2"
  subtitle    = "Hash Key Rotation"
  composer    = "Jeremy Mates"
  subsubtitle = "2012-12-16"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

upper = {
  \accidentalStyle "neo-modern"
  \clef treble
  \key c \major
  \tempo \markup {
    "Dynamics and rhythm to taste"
    \with-color #(x11-color 'grey55)
    \teeny { "(" \general-align #Y #DOWN \note #"4" #1 = "66-76 )" }
  }

  s1*47

  \bar "|."
}

lower = {
  \accidentalStyle "neo-modern"
  \clef bass

  \include "etude2.voice1.ly"

  \bar "|."
}

\book {
  \paper {
    #(set-paper-size "letter")
  }
  \score {
    \new PianoStaff = "PianoStaff_pf" <<
      \new Staff = "upper" << \upper >>
      \new Staff = "lower" << \lower >>
    >>
    \layout { }
  }
% \score {
%   \unfoldRepeats \articulate {
%     \new Staff <<
%       \set Score.midiChannelMapping = #'instrument
%       \new Staff = "upper_midi" \upper_midi
%       \new Staff = "lower_midi" \lower_midi
%     >>
%   }
%   \midi {
%     \context { }
%   }
% }
  \markuplist { \paragraph {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
} }
}

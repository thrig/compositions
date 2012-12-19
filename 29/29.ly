% LilyPond engraving system - http://www.lilypond.org/

\version "2.16.0"
\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?) (interpret-markup-list layout props (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

\header {
  title       = "Twenty Nine"
  subsubtitle = "2012-12-19"
  composer    = "Jeremy Mates"
% copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  copyright   = ""
  tagline     = ##f
}

keytempoetc = {
  \tempo "Adagio Maestoso" 4=112
  \time 3/2
}

voiceone = \relative b' {
  \keytempoetc
  \clef treble

  b1*3/2->\mp
  a1*3/2->
  f1*3/2->
  e1*3/2->
  e1*3/2->
  e1*3/2->
  g1*3/2->
  g1*3/2->
  a1*3/2->
  e1*3/2->\p
  e'1*3/2->\mp
  c1*3/2->
  bes1*3/2->
  a1*3/2->
  g1*3/2->\p
  g1*3/2->
  g1*3/2->
  a1*3/2->
  f1*3/2->
  e1*3/2->
  e1*3/2->
  e1*3/2->
  f1*3/2->
  d'2.\mf(_\markup { \italic "rit." } d4 c2
  bes2) bes2.( a4
  a1*3/2->)
  a1*3/2->\mp
  g1*3/2~\p
  g1\pp\fermata r2
}

voicetwo = \relative b {
  \keytempoetc
  \clef alto

  b1\mp e2~
  e2 c a~
  a2 d, f~
  f2 e g~
  g2 f c'~
  c2( b a
  b2 c d~)
  d2 c( b
  a2 g a
  b2) c\p e~
  e2\mp( f2 g~)
  g2 f( e
  d2 e f~)
  f2-> a\mf c~
  c2 b g~
  g2 a( c
  b2~ b16 g4.. a2~)
  a2 c,\mp a~
  a2 d, f~
  f2 e g~
  g2 f c'~
  c2( b a~
  a2 b c)
  d1*3/2->\p_\markup { \italic "rit." } 
  e1 d2~
  d2 b\mp( c
  a2 g f)
  b1*3/2\p(
  c1\pp\fermata) r2
}

voicethree = \relative e {
  \keytempoetc
  \clef bass

  e1*3/2->\mp
  c1*3/2->
  d1*3/2->
  c1*3/2->
  a1*3/2->
  a'1*3/2->
  g1*3/2->
  e1*3/2->
  f1*3/2->
  e1*3/2->\p
  g1*3/2->\mp
  g1*3/2->
  g1*3/2->
  f1*3/2->
  e1*3/2->\p
  d1*3/2->
  g1*3/2->
  c,1*3/2->\mp
  d1*3/2->
  c1*3/2->
  a1*3/2->
  a'1*3/2->
  f1*3/2->
  d1*3/2->\p_\markup { \italic "rit." } 
  g1*3/2->
  a1*3/2->
  f1*3/2->\mp
  g1*3/2\p(
  c,1\pp)\fermata r2
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Misc.     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

upper = {
  \set Staff.instrumentName = #"English Horn"
  \set Staff.midiInstrument = #"english horn"
  \voiceone

  \bar "|."
}

middle = {
  \set Staff.instrumentName = #"Trombone"
  \set Staff.midiInstrument = #"trombone"
  \voicetwo

  \bar "|."
}

lower = {
  \set Staff.instrumentName = #"Bassoon"
  \set Staff.midiInstrument = #"bassoon"
  \voicethree

  \bar "|."
}

theblackdots = {
  <<
    \new StaffGroup <<
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
  \articulate { \themusic }
  \midi { }
}
  \markuplist { \paragraph {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
} }

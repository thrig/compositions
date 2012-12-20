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
  \tempo "Adagio Maestoso con Affettuoso" 4=108
  \time 3/2
}

voiceone = {
  % English Horn transposing instrument pitched in F below C
  \key g \major
  \transposition f,

  \keytempoetc
  \clef treble

  \transpose c g' { \relative b {
    b1.->\mp
    a1.->
    f1.->
    e1.->
    e1.->
    e1.->
    g1.->
    g1.->
    a1.->
    e1.->
    e'1.->
    c1.->
    bes1.->
    a1.->
    g1.->\p
    g1.->
    g1.->
    a1.->
    f1.->
    e1.->
    e1.->
    e1.->
    f1.(
    d'2.\mf_\markup { \italic "rit." } d4 c2)
    bes2( bes2. a4
    a1.->)
    a1.->\mp
    g1.~\p
    g1\fermata r2
  } }
}

voicetwo = \relative b {
  \keytempoetc
  \clef bass

  b1\mp e2~
  e2 c a~
  a2 d, f~
  f2 e g~
  g2 f c'~
  c2( b a
  b2 c d~)
  d2 c( b
  a2 g a~)
  a2-> r2 \clef treble e'~\mf
  e2( f2 g~)
  g2 f(\mp e
  d2 e f~)
  f2-> a\mf c~
  c2 b g~
  g2 a( c
  b2~ b16 g2 a4..~)
  a2 \clef bass c,\p a~
  a2 d,\mp f~
  f2 e g~
  g2 f c'~
  c2( b a~
  a2 b\< c\!)
  d1.->\p_\markup { \italic "rit." } 
  e1 d2~
  d2 b\mp( c
  a2 g f)
  b1.\p(
  c1\fermata) r2
}

voicethree = \relative e {
  \keytempoetc
  \clef bass

  e1.->\mp
  c1.->
  d1.->
  c1.->
  a1.->
  a'1.->
  g1.->
  e1.->
  f1.->
  e2 d'2~ d4-> r4
  g,1.->
  g1.->
  g1.->
  f1.->
  e1.->\p
  d1.->
  g1.->
  c,1.->\mp
  d1.->
  c1.->
  a1.->
  a'1.->
  f1.->
  d1.->\p_\markup { \italic "rit." } 
  g1.->
  a1.->
  f1.->\mp
  g1.\p(
  c,1)\fermata r2
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

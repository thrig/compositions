% LilyPond engraving system - http://www.lilypond.org/
%
% Strings version for harmonic checks and phrasing.
%
%% timidity --config-file=organ.cfg

\version "2.16.0"
\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?) (interpret-markup-list layout props (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

\header {
  title       = "Twenty Nine"
  subtitle    = "To Lives Lost"
  subsubtitle = "2012-12-26"
  composer    = "Jeremy Mates"
  copyright   = ""
  tagline     = ##f
}

keytempoetc = {
  \set Score.tempoHideNote = ##t
  % or for orchestra strings possibly even slower?
  \tempo "Adagio Maestoso con Affettuoso" 4=108
  \time 3/2
}

voiceone = {
  \keytempoetc
  \clef treble

  \relative b' {
    b1.\p(
    a1.
    f1.
    e1.
    e1.
    e1.--)
    g1.(
    g1.
    f1.--)
    a1.(
    e'1.--)
    c1.(
    bes1.
    a1.)
    g1.(
    g1.
    g1.
    a1.
    f1.
    e1.
    e1.
    e1.)
    f1.(
    \tempo 4=106
    d'2.\mf_\markup { \italic "rit." } d4 c2)
    \tempo 4=104
    bes2( bes2. a4
    \tempo 4=101
    a1.)
    \tempo 4=99
    a1.--\mp
    \tempo 4=96
    g1.--\p
    \tempo 4=56
    g1.\fermata
  }
}

voicetwo = \relative b {
  \keytempoetc
  \clef bass

  b1--\mp e2~
  e2( c) a~
  a2-- d,( f~)
  f2-- e( g~)
  g2-- f( c'~)
  c2( b a
  b2 c d~)
  d2 c( b
  a2 g a~)
  a1 \clef treble e'2~\f
  e2( f2\mf g~)
  g2 f(\mp e
  d2 e f
  f2) a--\f c~
  c2 b\mf( g~)
  g2 a(\f c
  b2~ b16 g2 \tempo 4=100 a4..~)_\markup { \italic "rit." }
  \tempo 4=108
  a2_\markup { \italic "a tempo" } \clef bass c,\p( a~)
  a2 d,\mp( f~)
  f2 e( g~)
  g2 f( c'~)
  c2( b a~
  a2 b\< c--\!)
  d1.--\p
  e1( d2~)
  d2-- b(\mp c
  a2 g f)
  b1.--\p
  c1.\fermata
}

voicethree = \relative e {
  \keytempoetc
  \clef bass

  e1.\p(
  c1.
  d1.
  c1.
  a1.)
  a'1.(
  g1.
  e1.
  f1.)
  e2(\mf d'1
  g,1.)\p
  g1.
  g1.
  f1.(
  e1.
  d1.--)
  g1.--
  c,1.(
  d1.
  c1.
  a1.)
  a'1.(
  f1.
  d1.)
  g1.(
  a1.
  f1.)
  g1.--
  c,1.\fermata
}

% contrabass probably just doubles cello
voicefour = {
  \keytempoetc
  \clef bass
  \transposition c,

  \relative e {
    e1.\p(
    c1.
    d1.
    c1.
    a1.)
    a'1.(
    g1.
    e1.
    f1.)
    e2(\mf d'1
    g,1.)\p
    g1.
    g1.
    f1.(
    e1.
    d1.--)
    g1.--
    c,1.(
    d1.
    c1.
    a1.)
    a'1.(
    f1.
    d1.)
    g1.(
    a1.
    f1.)
    g1.--
    c,1.\fermata
  }
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Misc.     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

upper = {
% \set Staff.midiInstrument = #"english horn"
  \set Staff.midiInstrument = #"violin"
  \voiceone

  \bar "|."
}

middle = {
% \set Staff.midiInstrument = #"trombone"
  \set Staff.midiInstrument = #"viola"
  \voicetwo

  \bar "|."
}

lower = {
% \set Staff.midiInstrument = #"bassoon"
  \set Staff.midiInstrument = #"cello"
  \voicethree

  \bar "|."
}

bass = {
  \set Staff.midiInstrument = #"contrabass"
  \voicefour

  \bar "|."
}

theblackdots = {
  <<
    \new StaffGroup <<
      \new Staff = "upper" \upper
      \new Staff = "middle" \middle
      \new Staff = "lower" \lower
%     \new Staff = "bass" \bass
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
%     \new Staff = "bass" \bass
    >>
  >>
}

\score {
  \theblackdots
  \layout {
%   indent = 2.3\cm
  }
}
\score {
  \articulate { \themusic }
% \themusic
  \midi { }
}
\markuplist { \paragraph {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
} }

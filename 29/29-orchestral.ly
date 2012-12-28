% LilyPond engraving system - http://www.lilypond.org/
%
% Orchestral arrangement (based on playback in Finale so mostly guessing
% on the dynamics).
%
% * Trombones need to be able to stand out from the orchestra, or
%   sometimes play with it.
% * Trumpets were too clear and striking to replace the high parts for
%   the trombones, from the samples I have.
% * Strings are background filler, should only sometimes become legible
%   as the wind parts fade out; wind instruments primary.
% * Alto flute a must, as normal flute is too sweet in high parts.
%   Parallel below or silence if alto flutes unavailable.
% * Have not tested Clarinets/Oboes, but suspect their timbre will not
%   suit this work.
% * Snare drum/military marching type percussion might work for spare
%   beat lead-ins and accents.

\version "2.16.0"

#(define-markup-list-command (paragraph layout props args) (markup-list?) (interpret-markup-list layout props (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

\header {
  title       = "Twenty Nine"
  subtitle    = "To Lives Lost"
  subsubtitle = "2012-12-29"
  composer    = "Jeremy Mates"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

keytempoetc = {
  \tempo "Adagio Maestoso con Affettuoso" 4=100
  \time 3/2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Woodwinds

altoflute = {
  \set Staff.instrumentName = #"Alto Flute"
  \set Staff.shortInstrumentName = #"A. Fl."
  \set Staff.midiInstrument = #"flute"

  \keytempoetc
  \clef treble

  \relative b' {
    b1.(\mp
    a1.
    f1.
    e1) r2

    e1.
    e1 r2
    g1.(
    g1.

    f1) r2
    a2( g\< a\!
    e'1.\mp
    c1.

    bes1.
    a1) r2
    g1.(
    g1.

    g1) r2
    a1.(
    f1.
    e1) r2

    e1.
    e1 r2
    f1.(
    d2._\markup { \italic "rit." } d4 c2)

    \clef bass
    bes2( bes2. a4
    a1) r2
    a1 r2
    g1.\p(

    g1.\fermata)
  }

  \bar "|."
}

% TODO wrestle transposition to working state
ehorn = {
  \set Staff.instrumentName = #"English Horn"
  \set Staff.shortInstrumentName = #"E. Hn."
  \set Staff.midiInstrument = #"english horn"

  \keytempoetc
  \clef treble

  \relative b' {
    b1.(\mp
    a1.
    f1.
    e1) r2

    e1.
    e1 r2
    g1.(
    g1.

    f1) r2
    a2( g\< a\!
    e'1.\mp
    c1.

    bes1.
    a1) r2
    g1.(
    g1.

    g1) r2
    a1.(
    f1.
    e1) r2

    e1.
    e1 r2
    f1.(
    d'2.\f_\markup { \italic "rit." } d4 c2)

    bes2(\mf bes2. a4
    a1) r2
    a1\mp r2
    g1.\p(

    g1.\fermata)
  }

  \bar "|."
}

bassoon = \relative e {
  \set Staff.instrumentName = #"Bassoon"
  \set Staff.shortInstrumentName = #"Bsn."
  \set Staff.midiInstrument = #"bassoon"

  \keytempoetc
  \clef bass

  e1.\mp(
  c1.
  d1.
  c1.

  a1) r2
  a'1.(
  g1.
  e1) r2

  f1.(
  e2\< d'1\!->)
  g,1\mp r2
  g1 r2

  g1 r2
  f1.(
  e1.
  d1.

  g1) r2
  c,1.(
  d1.
  c1.

  a1) r2
  a'1.(
  f1.
  d1)_\markup { \italic "rit." } r2

  g1.(
  a1.
  f1) r2
  g1.\p(

  c,1.\fermata)

  \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Brass

% TODO work out transposition
hornf = \relative e {
  \set Staff.instrumentName = #"Horn in F"
  \set Staff.shortInstrumentName = #"Hn."
  \set Staff.midiInstrument = #"french horn"

  \keytempoetc
  \clef bass

  e1.\mp(
  c1.
  d1.
  c1.

  a1) r2
  a'1.(
  g1.
  e1) r2

  f1.(
  e2\< d'1\!->)
  g,1\mp r2
  g1 r2

  g1 r2
  f1.(
  e1.
  d1.

  g1) r2
  c,1.(
  d1.
  c1.

  a1) r2
  a'1.(
  f1.
  d1)_\markup { \italic "rit." } r2

  g1.(
  a1.
  f1) r2
  g1.(\p

  c,1.\fermata)

  \bar "|."
}

tboneone = {
  \set Staff.instrumentName = #"Trombone 1"
  \set Staff.shortInstrumentName = #"Tbn. 1"
  \set Staff.midiInstrument = #"trombone"

  \keytempoetc
  \clef bass

  \relative b {
    b1--\mp e2~
    e2( c) a~
    a2 r1
    r2 << { e\mp( g~) g2-- } \\ { s4. s8\< s4. s8\! s4.\> s8\! } >> r1

    r2 b2\mf( a
    b2 c d~)
    d2-- r1

    R1.
    \clef treble
    r1 e2~\f(
    e2 f\mf g~
    g2--) r1
    
    R1.
    r2 << { a\ff c~ c2( b g~ g2--) } \\ { s4. s8\< s4. s8\! } >> r1

    R1.
    \clef bass
    r2 c,2\mf( a~
    a2) r1
    r2 << { e\mp( g~) g2-- } \\ { s4. s8\< s4. s8\! s4.\> s8\! } >> r1
    r2 b2(\mf a~
    a2 b\< c--\!)
    R1._\markup { \italic "rit." }

    r1 d2~\p
    d2 b\mp( c
    a2 g f--)
    R1.

    R1.
  }

  \bar "|."
}

tbonetwo = {
  \set Staff.instrumentName = #"Trombone 2"
  \set Staff.shortInstrumentName = #"Tbn. 2"
  \set Staff.midiInstrument = #"trombone"

  \keytempoetc
  \clef bass

  \relative d {
    R1.
    R1.
    r2 << { d2\mp( f~) f2-- } \\ { s4. s8\< s4. s8\! s4.\> s8\! } >> r1

    r2 << { f2\mp( c'~) c2-- } \\ { s4. s8\< s4. s8\! } >> r1
    R1.
    r2 c2\mf( b

    a2 g a~)
    a1-- r2
    R1.
    \clef treble
    r2 f'2\mf( e

    d2 e f
    f2--) r1
    R1.
    r2 << { a2\ff c( b2 g a~) a2-- } \\ { s4. s8\< s4. s8\! s1. s4.\> s8\! } >> r1

    \clef bass
    r2 << { d,,2\mp( f~) f2-- } \\ { s4. s8\< s4. s8\! s4.\> s8\! } >> r1

    r2 << { f2\mf( c'~) c2-- } \\ { s4. s8 s4. s8 } >> r1
    R1.
    d1.--\p_\markup { \italic "rit." }

    e1-- r2
    R1.
    R1.
    b1.(

    c1.\fermata)
  }

  \bar "|."
}

tuba = \relative e, {
  \set Staff.instrumentName = #"Tuba"
  \set Staff.shortInstrumentName = #"Tuba"
  \set Staff.midiInstrument = #"tuba"

  \keytempoetc
  \clef bass

  e2\mp r1
  c2 r1
  d2 r1
  c2 r1

  a2 r1
  a'2 r1
  g2 r1
  e2 r1

  f2 r1
  e2\<( d'1\!->)
  g,2\mp r1
  g2 r1

  g2 r1
  f2 r1
  e2 r1
  d2 r1

  g2 r1
  c,2 r1
  d2 r1
  c2 r1

  a2 r1
  a'2 r1
  f2 r1
  d2_\markup { \italic "rit." } r1

  g2 r1
  a2 r1
  f2 r1
  g2\p r1

  c,1.\fermata

  \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Strings

violin = {
  \set Staff.instrumentName = #"Violin"
  \set Staff.shortInstrumentName = #"Vln."
  \set Staff.midiInstrument = #"violin"

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
    a2( g a
    e'1.
    c1.

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
    \set Score.tempoHideNote = ##t
    \tempo 4=98
    d'2.\mf_\markup { \italic "rit." } d4 c2)

    \tempo 4=96
    bes2( bes2. a4
    \tempo 4=93
    a1.)
    \tempo 4=90
    a1.--\mp
    \tempo 4=88
    g1.\p(

    \tempo 4=42
    g1.\fermata)
  }

  \bar "|."
}

viola = \relative b {
  \set Staff.instrumentName = #"Viola"
  \set Staff.shortInstrumentName = #"Vla."
  \set Staff.midiInstrument = #"viola"

  \keytempoetc
  \clef alto

  b1--\mp e2~
  e2( c) a~
  a2-- d,( f~)
  f2-- e( g~)

  g2-- f( c'~)
  c2 b( a
  b2 c d~)
  d2 c( b

  a2 g a~)
  a1 \clef treble e'2~\f
  e2( f2\mf g~)
  g2 f( e

  d2 e f
  f2) a-- c~
  c2 b( g~)
  g2 a c

  b2 g a~
  a2 \clef bass c,( a~)
  a2 d,( f~)
  f2 e( g~)

  g2 f( c'~)
  c2 b( a~
  a2 b\< c--\!)
  d1.--\p_\markup { \italic "rit." }

  e1( d2~)
  d2-- b(\mp c
  a2 g f)
  b1.\p(

  c1.\fermata)

  \bar "|."
}

cello = \relative e {
  \set Staff.instrumentName = #"Cello"
  \set Staff.shortInstrumentName = #"Vc."
  \set Staff.midiInstrument = #"cello"

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
  e2(\< d'1\!->)
  g,1.\p
  g1.

  g1.
  f1.(
  e1.
  d1.)

  g1.--
  c,1.(
  d1.
  c1.

  a1.)
  a'1.(
  f1.
  d1.)_\markup { \italic "rit." }

  g1.(
  a1.
  f1.)
  g1.(

  c,1.\fermata)

  \bar "|."
}

% contrabass *mostly* just doubles cello
doublebass = {
  \set Staff.instrumentName = #"Double Bass"
  \set Staff.shortInstrumentName = #"D.B."
  \set Staff.midiInstrument = #"contrabass"

  \keytempoetc
  \clef bass
  \transposition c

  \relative e {
    e1.\p(
    c'1.
    d1.
    c1.

    a1.)
    a1.(
    g1.
    e1.

    f1.)
    e2(\< d'1\!->)
    g,1.\p
    g1.

    g1.
    f1.(
    e1.
    d1.)

    g1.--
    c,1.(
    d1.
    c1.

    a1.)
    a'1.(
    f1.
    d1.)_\markup { \italic "rit." }

    g1.(
    a1.
    f1.)
    g1.\pp(

    c,1.\fermata)
  }

  \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Misc.

theblackdots = {
  <<
    \new StaffGroup <<
      \new Staff = "altoflute" \altoflute
      \new Staff = "ehorn" \ehorn
      \new Staff = "bassoon" \bassoon
    >>
    \new StaffGroup <<
      \new Staff = "hornf" \hornf
      \new Staff = "tboneone" \tboneone
      \new Staff = "tbonetwo" \tbonetwo
      \new Staff = "tuba" \tuba
    >>
    \new StaffGroup <<
      \new Staff = "violin" \violin
      \new Staff = "viola" \viola
      \new Staff = "cello" \cello
      \new Staff = "doublebass" \doublebass
    >>
  >>
}

\score {
  \theblackdots
  \layout {
    indent = 2.3\cm
    short-indent = 0.8\cm
  }
}

\markuplist { \paragraph {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
} }

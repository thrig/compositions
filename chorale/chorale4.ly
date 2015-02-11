%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/
%
% timidity --config-file=organ.cfg

\version  "2.18.2"
\include  "articulate.ly"
\language "deutsch"

\header {
  title       = "Chorale No. 4"
  composer    = "Jeremy Mates"
  subtitle    = "I take a dim view of Dorian"
  subsubtitle = "2015-02-11"
  copyright   = \markup { \teeny {
"© 2015 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

tempoandetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 3/4
  \tempo 4=60
  \key f \dorian
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

sopa = \relative b' {
  h4 h8 h c4
  c4 c b
  \tempo 4=37 as4\fermata \tempo 4=60 as g
  as8 b as g f16( es f8)
}

sopb = \relative b' {
  g8 \tempo 4=40 f4\fermata \tempo 4=60 f4 as8
  b16( as g8) r8     c8 d16( es d8)
  c16( b \tempo 4=35 c4)\fermata \tempo 4=60 c8 f es
  des8 c4 h8 c8 c
}

sopc = \relative b' {
  c8( b as) d( c h)
  f'8 f \tempo 4=39 e4\fermata \tempo 4=60 e8 e
  e4( d8 c h c)
  a8( h c d e) h

  c4 b as
  g4 \tempo 4=36 g\fermata \tempo 4=60 as
  c4. b8 as g
  as8 b c2~
  c4 b2
  as4 b c
  \tempo 4=39 c2\fermata r4
}

altoa = \relative f' {
  f4 f es
  es8( d es c d es)
  f4 c c8 c
  d8 d c es d16( c d8)
}

altob = \relative e' {
  h8 c4 c4.
  d8 es f4 d16( c d8)
  d8 e4 c8 as' g
  f8 es g8.( f16 es8 d)
}

altoc = \relative e' {
  es8 g f4 g8 g
  d4 c g'4~
  g8 a4. g16( f e8)
  f8( g a) g4 f8

  c8 d4 f4 es8 
  d8 f es4 es
  g2 f8 es8
  f4. g8 as b
  es,4 f g
  f4. e8 g4
  f2 r4
}

tenora = \relative a {
  as4 as4. as8
  as4 c f,8 g
  as4 f es
  f8 es4 as8 g4
}

tenorb = \relative a {
  g8 as4 as as8
  g4 as8 es16 as g8 b
  b8 g4 as4 b8
  c4. g8 as4
}

tenorc = \relative a {
  c8 es c as c4
  h4 g g
  b8 a8 d4 d8 c
  c8 g d' h a h

  g8 a g d' c4
  h4 c c
  c8 d es4 c4
  c8 b as g f4

  g4 as g
  d'4 d8 c e4
  a,2 r4
}

bassa = \relative f {
  d4 d4 c
  f,4 as b
  f4 f c'
  f,4 as8 c4 es8
}

bassb = \relative f {
  d8 c4 f f8
  f8 es d c b16 as g8~
  g8 c4 f4 g8
  as,8 es'!4 des8 c f
}

bassc = \relative f {
  c4 f4 es8 g
  g,4 c c
  des8 e f4 g
  f8 e d e c d

  e8 f g d es c
  g'4 c, f
  es8 d c4 f
  f8 g f es d4

  c4 d es
  f4 g c,
  f2 r4
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \new Voice { \voiceOne
  \tempoandetc 
  \sopa \sopb
  \sopc
}

malto = \new Voice { \voiceTwo
  \tempoandetc 
  \altoa \altob
  \altoc
}

mtenor = {
  \tempoandetc 
  \tenora \tenorb
  \tenorc
}

mbass = {
  \tempoandetc 
  \bassa \bassb
  \bassc
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SCORE

ssop = \new Voice {
  \tempoandetc 
  \voiceOne
  \sopa
  \sopb
  \sopc
  \bar "|."
}

salto = \new Voice {
  \tempoandetc 
  \voiceTwo
  \altoa
  \altob
  \altoc
  \bar "|."
}

stenor = {
  \tempoandetc 
  \clef bass
  \tenora
  \tenorb
  \tenorc
  \bar "|."
}

sbass = {
  \tempoandetc 
  \bassa
  \bassb
  \bassc
  \bar "|."
}

upper = {
  \clef treble
  \set Staff.printPartCombineTexts = ##f
  \partcombine \ssop \salto
}

lower = {
  \clef treble
  \stenor
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

thescore = {
 <<
  \new PianoStaff << \new Staff \upper \new Staff \lower >>
  \new Staff << \clef bass \sbass >>
 >>
}

themidi = {
 <<
  \set Score.midiChannelMapping = #'staff
  \new Staff = "soprano" <<
%   \set Staff.midiInstrument = #"electric piano 1"
    \msop
  >>
  \new Staff = "alto" <<
%   \set Staff.midiInstrument = #"electric piano 1"
    \malto
  >>
  \new Staff = "tenor" <<
%   \set Staff.midiInstrument = #"electric piano 1"
    \mtenor
  >>
  \new Staff = "bass" <<
%   \set Staff.midiInstrument = #"electric piano 1"
    \mbass
  >>
 >>
}

\score {
  \thescore
  \layout { }
}

\score {
  \articulate { \themidi }
% \themidi
  \midi { }
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

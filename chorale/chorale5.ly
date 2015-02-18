%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/
%
% timidity --config-file=organ.cfg

\version  "2.18.2"
\include  "articulate.ly"
\language "deutsch"

\header {
  title       = "Chorale No. 5"
  composer    = "Jeremy Mates"
  subsubtitle = "2015-02-18"
  copyright   = \markup { \teeny {
"© 2015 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

tempoandetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 4/4
  \tempo 4=60
  \key fis \minor
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

sopa = \relative b' {
  e4 e8 d cis4 d
  e4 fis gis \tempo 4=32 fis\fermata \tempo 4=60
  cis4. h8 a4 cis4~
  cis8 a h4 cis d8 d
}

sopb = \relative b' {
  e8 cis \tempo 4=33 fis4\fermata \tempo 4=60 fis4 e
  fis8 e d4 cis2
  cis4. h8 cis4 h
  \tempo 4=31 a4\fermata \tempo 4=60 a4 h2
}

sopc = \relative b' {
  h8 d cis h cis4 a8 cis
  h8 a h16 a gis8 a h cis4
  d4 \tempo 4=34 cis4\fermata \tempo 4=60 cis4 h8 h
  a8 gis fis4 e8 e' d4

  e4 fis8 e d2
  \tempo 4=22 cis4\fermata \tempo 4=60 r2.
}

altoa = \relative f' {
  cis4 fis fis2
  gis4 fis e a4
  a8 gis fis4. e4 d8
  e8 fis gis fis4 a8 h8 fis
}

altob = \relative a' {
  gis4 a4 a a
  a4. gis8 a8 fis gis4
  a8 gis fis4 e8 fis gis4
  fis4 fis fis e8 fis
}

altoc = \relative e' {
  gis4 a8 gis fis e fis e
  d4 d8 e fis gis gis4
  gis4 fis fis fis8 gis
  e4 cis8 d cis4  gis'8 fis

  e8 gis d'8 cis h2
  ais4 r2.
}

tenora = \relative a {
  a4 h8 fis cis'4 h~
  h4 a8 h cis4 cis
  fis4 cis4. gis8 a8 h
  gis4 d'4. cis8 h8 h
}

tenorb = \relative a {
  h8 h a4 cis2
  h4 h e2
  cis4 d gis,2
  a4 cis d cis8 h~
}

tenorc = \relative a {
  h4 a4. cis4 a8
  h4 gis cis h
  e4 a, fis fis8 gis~
  gis4 a4 gis h

  cis8 e d4 gis,2
  cis4 r2.
}

bassa = \relative f {
  fis2 e4 d
  cis2 cis4 fis
  fis,8 gis a h cis4 fis8 gis,
  cis4 h a gis
}

bassb = \relative f {
  cis4 fis, a a
  d4. e8 a,4 cis
  fis8 e d4 e8 d cis4
  fis4 fis4 h, cis8 d
}

bassc = \relative f {
  e4 fis2 fis,4
  gis2 fis4 gis4
  cis,4 fis a dis8 h
  cis4 a8 h cis4 h4

  a4 gis4~ gis8 e fis gis
  fis4 r2.
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

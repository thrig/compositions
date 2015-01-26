%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% LilyPond engraving system - http://www.lilypond.org/                       %
%                                                                            %
% timidity --config-file=organ.cfg                                           %

\version "2.18.2"
\include "articulate.ly"

\header {
  title = "Chorale No. 3"
  composer = "Jeremy Mates"
  subsubtitle = "2015-01-26"
  copyright   = \markup { \teeny {
"© 2015 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

tempoandetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 4/4
  \tempo 4=56
  \key e \major
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %

sopa = \relative d'' {
  \partial 4 e4

  e8 fis gis8 fis16 e d4 cis
  b4 gis a4 a
  gis4 a b8 cis dis4
  e16 dis cis dis fis8 e dis16 cis b8 cis dis~

  dis4 cis8 dis8 e a,16 b cis8 b~
  b8 b b ais b4 b8 cis
  dis4 cis8 b cis4 dis8 e
  fis4. e8 dis cis dis e16 dis

  cis4 dis8 eis fis4 gis4
  fis4 cis b8 b b4
  b4 b a a
  gis2 r2
}

altoa = \relative a' {
  \partial 4 gis4

  b4 b8 a16 gis fis4 e4
  e8 fis e fis4 e8 dis fis
  e2 dis16 e fis8 fis fis
  gis8 ais b8 cis16 b ais16 gis fis8 fis fis

  b8 e, gis a8 e cis e dis~
  dis8 b dis cis dis4 fis
  fis8 b a gis a4 b8 cis
  dis8 b ais gis fis8 e fis4

  fis4 fis8 b ais4 cis4~
  cis8 b ais gis fis gis dis cis
  fis4 gis fis fis
  e2 r2
}

tenora = \relative e' {
  \partial 4 b4

  b8 dis e4 a,4 a
  gis8 a16 b cis8 d cis8 b4 a8
  b4 a a4 a8 a
  gis4 fis fis'8 b, ais b~

  b8 gis4 fis8 gis4 a~
  a8 gis gis g fis4 fis
  fis4 fis' fis b,8 a~
  a8 gis fis b b4 b8 b
  
  ais4. gis8 fis b gis eis'
  ais,4 r4 b4 gis
  b8 dis e d cis4 b8 a
  b2 r2
}

bassa = \relative d {
  \partial 4 e4

  e8 b e, a d4 a
  e'8 dis cis8 b a4 b
  e4 fis b,8 fis b dis
  b8 cis dis e fis8 dis e dis16 cis

  b8 e a, b8 gis a fis b~
  b8 e e e dis4 b8 ais
  b4 r4 fis'8 e dis cis
  b8 cis dis e b e dis cis

  fis4 b,8 cis dis e!16 dis cis4
  fis4 fis dis e
  b4 e, fis'8 e dis4
  e2 r2
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% MIDI                                                                       %

msop = \new Voice {
  \tempoandetc 
  \voiceOne
  \sopa
}

malto = \new Voice {
  \tempoandetc 
  \voiceTwo
  \altoa
}

mtenor = {
  \tempoandetc 
  \tenora
}

mbass = {
  \tempoandetc 
  \bassa
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% SCORE                                                                      %

ssop = \new Voice {
  \tempoandetc 
  \voiceOne
  \sopa
  \bar "|."
}

salto = \new Voice {
  \tempoandetc 
  \voiceTwo
  \altoa
  \bar "|."
}

stenor = {
  \tempoandetc 
  \clef bass
  \tenora
  \bar "|."
}

sbass = {
  \tempoandetc 
  \bassa
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

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %

thescore = {
 <<
  \new PianoStaff << \new Staff \upper \new Staff \lower >>
  \new Staff << \clef bass \sbass >>
 >>
}

themidi = {
 <<
  \set Score.midiChannelMapping = #'staff
  \new Staff = "soprano" \msop
  \new Staff = "alto" \malto
  \new Staff = "tenor" \mtenor
  \new Staff = "bass" \mbass
 >>
}

\score {
  \thescore
  \layout { }
}

\score {
  \articulate { \themidi }
  \midi { }
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

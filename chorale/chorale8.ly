%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version  "2.18.2"
\include  "articulate.ly"
\language "deutsch"

\header {
  title       = "Chorale No. 8"
  composer    = "Jeremy Mates"
  subsubtitle = "2015-08-06"
  copyright   = \markup { \teeny {
"© 2015 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

%normtempo = { \tempo 4=66 }
normtempo = { \tempo 4=66 }

tempoandetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 4/4
  \normtempo
  \key c \major
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

sopa = \relative b' {
  g4 g fis gis
  a4 g2 a4
  h8 a gis4 c4 \tempo 4=36 h4\fermata \normtempo
  b4 a2 a4 g8
  f16 g a8 b4. a4
  b4 b cis \tempo 4=32 d4\fermata \normtempo
  d4. c8 h a g c16 b
  a4 a8 g a16 b c8~ c b8
  es16 d c8~ c16 b a8 a a \tempo 4=36 b4\fermata \normtempo
  d4 es16 d c8 a8 g cis a8 dis8 e16 dis cis8 cis h8 h d8 e16 d
  cis8 d4 cis8 d d c8 d8
  e8 e \tempo 4=32 d4\fermata \normtempo d c
  b16 a g8 b c4 d d8
  c8 b c4 d8 c b16 a8 a16
  b8 d c16 b8 a16 a8 cis \tempo 4=38 d4\fermata \normtempo
  d4 d cis8 h a4~
  a8 h gis a a gis8 a16 h cis8
  d4. e8 fis8 e d4
  g,4 g fis gis
  a4 g2 a4
  h8 a gis4 c4 \tempo 4=28 h4\fermata
}

altoa = \relative f' {
  d4 es d8 c h4
  d4. c8 h8 a c8 h
  d8 cis cis4 d8 fis d4
  g4 es d2 es8
  d8 f g4. fis4
  g4 g a a
  f8 g a4 g8 f e4
  d16 e f g f8 e d16 d g8 f f
  g4 f4 fis8 fis g4
  a4 g4 f8 e g fis8 gis8 gis gis8 a g8 g4 g8
  a4 gis4 a8 f f16 g a8~
  a8 a a4 g as
  g16 f es8 d g a4. a8
  g4 f a f8 f
  g8 d a'16 g g8 f8 e d4
  fis4 g e2
  d8 fis8 cis4 d8 h8 cis cis
  g'8 a h4 a8 g fis4
  d4 es d8 c h4
  d4. c8 h8 a c8 h
  d8 cis cis4 d8 fis d4
}

tenora = \relative a {
  h4 as a h
  a8 g8 g2 fis8 g16 a
  h4. a8 a4 h
  d4 c4 a4 b4 c8
  b8 c d4 c4 b8
  b8 c16 d e8 f e4 d4
  d8 e f8 e16 d c4 c16 b a8
  b8 b a b4 c d16 c
  b4 c4 c8 d d4
  d4 b8 c~ c8 b cis4 his8 cis16 his cis8 d!~ d8 e d c8
  e8 fis h, cis~ cis b c8 a8
  cis4 d4 b as
  d8 d b4 a8 d4 d8
  es8 d c2 d8 d
  g,8 b c16 d e8 f,8 g a4
  a4 h a8 gis a4
  a4 gis8 fis4 gis8 fis fis
  d'4 d8 cis h8 e8 a,4
  h4 as a h
  a8 g8 g2 fis8 g16 a
  h4. a8 a4 h
}

subtenora = \relative f {
  d2 fis4 e
  fis8 e8 d4 e d
  fis4 gis4 fis g
  g2 f4 f g8
  g8 f e g a4 g8
  g8 e16 f g8 d e8 g fis4
  h4 a e8 a e f
  f4. g8 a g a4
  g16 f es8 a8 a a8 d, g4
  f4 g16 f e8 f8 g e a8 gis8 e gis8 a h8. a16 g8 g8~
  g8 fis16 e gis8 a8 f4 f8. g16~
  g8 cis, fis4 g es
  f8 g8 g es8 f4. f8
  es4 a4. f4 f8
  e8 g~ g16 f e8 d e f4
  d4 d2 e4
  fis4 e8 d d e8. d16 cis8
  e8 d4 g8 fis2
  d2 fis4 e
  fis8 e8 d4 e d
  fis4 gis4 fis g
}

bassa = \relative c {
  g4^\markup { \sans \teeny "Probably for piano, four hands" } c d e8 d
  d4 h c d~
  d4 e d g
  g,4 a d f c8
  d8 a g b c d4
  e4 c a d,
  g4 f a c
  b8 d4 e8 f e f16 e d8
  c4 a8 c d8 c g4
  d4 g8 a d cis4 fis8 dis cis16 dis e8 fis g8 g, h c8
  a8 h8 h a8 d d a16 g fis e
  a8 a d4 g, c
  g8 es' d c4 b b8
  c8 d16 e f4 d8 a b16 c d8
  b8 g a16 b c8 a4 d,
  d'4 g, a8 h cis4
  fis,8 h cis a fis h a4
  g8 fis g4
  d8 cis d8 a'
  g4 c d e8 d
  d4 h c d~
  d4 e d g,
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \new Voice { \voiceOne
  \tempoandetc 
  \sopa
}

malto = \new Voice { \voiceTwo
  \tempoandetc 
  \altoa
}

mtenor = \new Voice { \voiceThree
  \tempoandetc 
  \tenora
}

msubtenor = \new Voice { \voiceFour
  \tempoandetc 
  \subtenora
}

mbass = {
  \tempoandetc 
  \bassa
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SCORE

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

stenor = \new Voice {
  \tempoandetc 
  \voiceThree
  \clef bass
  \tenora
  \bar "|."
}

ssubtenor = \new Voice {
  \tempoandetc 
  \voiceFour
  \clef bass
  \subtenora
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
  \clef bass
  \set Staff.printPartCombineTexts = ##f
  \partcombine \stenor \ssubtenor
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
    \msop
  >>
  \new Staff = "alto" <<
    \malto
  >>
  \new Staff = "tenor" <<
    \mtenor
  >>
  \new Staff = "subtenor" <<
    \msubtenor
  >>
  \new Staff = "bass" <<
    \mbass
  >>
 >>
}

\score {
  \thescore
  \layout { }
}

\score {
% \articulate { \themidi }
  \themidi
  \midi { }
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

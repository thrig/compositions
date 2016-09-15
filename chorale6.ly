%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version  "2.18.2"
\language "deutsch"

\header {
  title       = "Chorale No. 6"
  composer    = "Jeremy Mates"
  subsubtitle = "2015-03-16"
  copyright   = \markup { \teeny {
    \char ##x00A9
    "2015 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=56 }

tempoandetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 2/4
  \normtempo
  \key b \minor
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

sopa = \relative b' {
  \partial 4 ges4

  f8 es16 f as4
  ges4 as8 b
  c8 des es4
  \tempo 4=40 des4\fermata \tempo 4=96 r4 \normtempo

  des4 des8 des
  h8 c c c
  b8 as ges as16 ges
  f8 e \tempo 4=52 f4\fermata \normtempo

  as4~ as16 ges c8
  des8 b c4
  ges8 as16 b f8 b
  as16 ges as8 f8. b16

  c4 \tempo 4=46 d4\fermata
}

sopb = \relative b' {
  \tempo 4=96 r4 \normtempo b4~
  b8 a8 b c16 b
  a8 b8 d d

  es4 es8 des16 c
  b16 as b4 c8
  des8 es \tempo 4=46 b4\fermata
}

sopc = \relative c'' {
  \tempo 4=76 r4 \normtempo b4

  c8 des es4
  es8 f es des
  es4 b8 es16 des
  c8 f, c'16 b as8

  des8 c16 des c b a8
  \tempo 4=36 b4\fermata r4
}

altoa = \relative d' {
  \partial 4 as4

  b8 c16 des as8 b16 c
  des8 c f4
  as8 as16 ges f8 es
  f4 r4

  b4 b8 as
  ges4 f16 es des8~
  des8 f8 b,4
  as8 b c4

  c4 des8 es8
  f2
  b,2
  es4 des8 c16 f
  
  es8 f8 f4
}

altob = \relative e' {
  r4 f4
  des8 f f g~
  g16 f g8 a f

  es8 b' c b16 as
  ges16 f des8 es4
  f4 f4
}

altoc = \relative e' {
  r4 d8 c~
  
  c8 f as es~
  es8 des8 as'4
  ges8 f4 as8
  as4 es8 f

  b8 es,8 as16 d, e f
  des4 r4
}

tenora = \relative a {
  \partial 4 es4

  f4 c'8 f,
  ges4 c8 des
  es16 ges, f'8 c8 c
  des4 r4

  des,4 f4
  ges8 as~ as16 ges as8
  b4. ges8
  as8 ges as4

  as4 b8 b
  as8 ges f as
  des,8 f4.
  c'8 f, b as

  c8 c f,4
}

tenorb = \relative a {
  r4 f4
  b8 c des c
  es16 d8. c16 d b8~

  b16 as g8 as f
  b4. a8
  as8 c des4
}

tenorc = \relative a {
  r4 f8 ges8~
  
  ges8 f8 es as~
  as8 b as4
  b4 des8 f,
  as8 des ges, f

  ges8 as4 f8
  f4 r4
}

bassa = \relative c {
  \partial 4 as4

  des8 c f8 des
  es4~ es8 des
  c8 b f'4
  b,4 r4

  b4 b4
  es4 f4
  ges8 f es4
  c8 c f,4

  f'8 es des c
  b4 as
  b4 c8 des
  c4 b
  
  f4 b
}

bassb = \relative f {
  r4 des4
  ges8 f b, es
  c8 g' f d

  c8 es as, b
  es8 b8 c f,8
  b8 a b4
}

bassc = \relative e {
  r4 b8 es~
  
  es des8 c4
  c8 b8 f'4
  es4 des4
  c8 f c des

  es4 f
  b,4 r4
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \new Voice { \voiceOne
  \tempoandetc
  \sopa
  \sopb
  \sopc
}

malto = \new Voice { \voiceTwo
  \tempoandetc
  \altoa
  \altob
  \altoc
}

mtenor = {
  \tempoandetc
  \tenora
  \tenorb
  \tenorc
}

mbass = {
  \tempoandetc
  \bassa
  \bassb
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
% \new Staff << \clef bass \transpose b b, { \sbass } >>
 >>
}

themidi = {
 <<
  \set Score.midiChannelMapping = #'staff
% may need e.g. if feeding to synth
% \set Score.midiChannelMapping = #'instrument
  \new Staff = "soprano" <<
    \set Staff.midiInstrument = #"electric piano 1"
    \msop
  >>
  \new Staff = "alto" <<
    \set Staff.midiInstrument = #"electric piano 1"
    \malto
  >>
  \new Staff = "tenor" <<
    \set Staff.midiInstrument = #"electric piano 1"
    \mtenor
  >>
  \new Staff = "bass" <<
    \set Staff.midiInstrument = #"electric piano 1"
    \mbass
  >>
% optional parallel support for bass
  \new Staff = "bassoompfh" <<
    \set Staff.midiInstrument = #"electric piano 1"
    \transpose b b, { \mbass }
  >>
 >>
}

\score {
  \thescore
  \layout { }
}

\score {
  \themidi
  \midi { }
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

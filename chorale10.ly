%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/
%
% timidity --config-file=organ.cfg

\version  "2.18.2"
\language "deutsch"

\header {
  title       = "Chorale No. 10-1"
  composer    = "Jeremy Mates"
  subsubtitle = "2015-11-03"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2015 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=90 }

tempoandetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 4/4
  \normtempo

  \key f \major
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

sopa = \relative d'' {
  b2 c4 g
  d'2 c8 b a4
  c8 d e f~ f2
  e2 f2

  d4 d e b
  g4 a b c
  d8 c b4 a4. b16 a
  g8 a b c d c h4

  c2 c4 b
  f'2~ f8 e d c16 b
  a4 b8 c d c b a
  g2 f8 b c4

  d8 c16 b a8 d f e16 d d8 c
  d4 c8 b a d d4
  c2 c4 d
  d4 c8 b a2

  g4. a8 b c a4
  e'4 f8 e d4 c
  d4 e8 d c4 b~
  b4 c d e~

  e4 e e d~
  d4 d c b
  a8 a a g g4 a
  b4 c c8 b4 a8

  b2 b
  \tempo 4=64 a2\fermata r2
}

altoa = \relative f' {
  d4 e8 f e d d4~
  d4 c d e8 f
  e8 d c4 f8 a g f
  g2 a

  a8 f f e e4 d8. c16
  d8 e d4 f8 d c e
  d4 e8 e f4 d8 e
  e8 f g a g d16 e d4

  c2 a8 e' d g
  f8~ f16 g a b a8 a g f e
  f2~ f8 e d c16 d
  e4. d8 c b g' d16 d

  f8 g f4 b8 c d, e16 fis
  g8 f a g f4 g8 f
  e2 f8 f f4
  g16 f e4 g8 c, d e4

  e2 d8 e f4
  g8 f a g b a g f
  a4 g a8 e f4~
  f4 a b c

  b4 a g g8 g
  f8 f f e e4 d~
  d8 c4 h e fis8
  g4 g8 f f f g f

  g2 g
  f2 r2
}

tenora = \relative a {
  g2 f8 e d4
  f8 g a b~ b2
  a2 b~
  b8 a g f d'2

  d8 c b4 c8 a a g
  g4 f8. e16 f8 g a g
  f4 g f d'
  c4 b8 a~ a a g f

  e2 f8 g4 b8
  c8 b a4 a b8 g
  c4 g8 a b c f, a
  c4 g a g8 g

  a4 a a b8 d
  b8 a e'4 b8 a h a
  g2 a4 b8 a
  g4 g8 e a4 c~

  c4 c d,8 g a4
  a4 c g c
  f,8 e g f a g f e
  d4 e f8 e b' a

  g8 f a g b a d4
  a4 b c8 c c b
  b4 a4. g4 d'8~
  d8 e4 d d4.

  d2 e
  c2 r2
}

bassa = \relative c {
  g2 a4 b
  d,4 c' b8 d c b
  c2 d
  e2 d

  f4 g c, f8 e
  d8 c d4 d e
  b4 g a b
  c4 d8 c b d g,4

  c2 f,4 b
  a4 f' d8 e f4
  f4. e8 d4 f
  c2~ c8 d e f

  d2~ d8 c b a
  g4 a d g,
  c2 f4 b,~
  b4 c8 e f4 f,

  c'8 d e c b4 d,
  a'4 f g e
  d4 e f2
  b4 a g f

  g4 c e b
  d4 g, a b
  d2 e8 e e d
  d4 c f8 g e f

  g,2 c
  f2 r2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = {
  \tempoandetc
  \sopa
}

malto = {
  \tempoandetc
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

themidi = {
 <<
  \set Score.midiChannelMapping = #'staff
  % may need e.g. if feeding to synth
  %\set Score.midiChannelMapping = #'instrument

  % comment these out to listen to a particular voice only
  % duplicate voicings for Aria Player with:
  \new Staff = "soprano" << \msop >>   % Koppelflote 4'
  \new Staff = "ssoprano" << \msop >>  % Great Clarion 4'
  \new Staff = "sssoprano" << \msop >> % Flutes 8' 4' 1'
  \new Staff = "alto" << \malto >>     % Great Clarion 4'
  \new Staff = "aalto" << \malto >>    % Flutes 8' 4' 1'
  \new Staff = "tenor" << \mtenor >>   % Great Clarion 4'
  \new Staff = "ttenor" << \mtenor >>  % Pedal Trompette 8' 4'
  \new Staff = "bass" << \mbass >>     % Prinzipal 8'
  \new Staff = "bbass" << \mbass >>    % Pedal Principal 16'
 >>
}

\score {
  \themidi
  \midi { }
}

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

thescore = {
 <<
  \new PianoStaff << \new Staff \upper \new Staff \lower >>
  \new Staff << \clef bass \sbass >>
 >>
}

\score {
  \thescore
  \layout { }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/
%
% timidity --config-file=sf.cfg
%
% The alto bears the original melody.

\version  "2.18.2"
\language "deutsch"

\header {
  title       = "Chorale No. 7"
  composer    = "Jeremy Mates"
  subsubtitle = "2015-03-17"
  copyright   = \markup { \teeny {
    \char ##x00A9
    "2015 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=54 }

tempoandetc = {
  \set Score.tempoHideNote = ##t
  \override Staff.TimeSignature #'stencil = ##f
  \accidentalStyle "neo-modern"
  \normtempo

  \key d \dorian

}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

sopa = \relative b' {
  a4~ a8[ g f] a4 g4. f4 g f8[ g] a4 f4.
}

sopb = \relative b {
  d8[ f] g4 f8[ e] c'4~ c8[ b] a4 a4 a4 a4 a8[ h] c4 c8[ b] a4.
}

sopc = \relative g' {
  g4 a8[ h] c4 c8[ b a] b4 c4 d4 e4 d4 c4 c4 b4 a4 a4.
}

altoa = \relative d' {
  \cadenzaOn
  f4 e f d e d c d e d4.
  \cadenzaOff \bar "|"
}

altob = \relative e' {
  \cadenzaOn
  d4 e f g g a g f \bar "|" d f g f f4.
  \cadenzaOff \bar "|"
}

altoc = \relative e' {
  \cadenzaOn
  e4 f g f4. f4 e d c d f e d c d4. 
  \cadenzaOff \bar "|."
}

tenora = \relative b {
  c4 c4~ c b c a g a~ a~ a4.
}

tenorb = \relative b {
  h4 c d c e8[ d] c4~ c4 d4 d4 d4 e4 d4 c4.
}

tenorc = \relative b {
  c4 a4 g4 a8[ d c] b4 g4 h4 g4 a4 c4. g4 a8 a4 a4.
}

bassa = \relative e {
  f4 c d~ d c d e d c d4.
}

bassb = \relative f {
  d4 c b e c4 f4 e4 d4 d4~ d4 c4 d4 f4.
}

bassc = \relative e {
  e4 e8[ d] e4 f4. d4 e4 h4 c4 f4~ f4 g4 f4 e4 d4.
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \new Voice { \voiceOne
  \tempoandetc
  \sopa r8
  \sopb r8
  \sopc
}

malto = \new Voice { \voiceTwo
  \tempoandetc
  \altoa r8
  \altob r8
  \altoc
}

mtenor = {
  \tempoandetc
  \tenora r8
  \tenorb r8
  \tenorc
}

mbass = {
  \tempoandetc
  \bassa r8
  \bassb r8
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
% optional parallel support for bass
  \new Staff = "bassoompfh" <<
%   \set Staff.midiInstrument = #"electric piano 1"
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

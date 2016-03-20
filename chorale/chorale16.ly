%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version  "2.18.2"
\language "deutsch"
\include  "articulate.ly"

\header {
  title       = "Chorale No. 16"
  composer    = "Jeremy Mates"
  subsubtitle = "2016-03-19"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=64 }

keytempoetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 4/4
  \normtempo

  \key e \minor
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Music

sopa = \relative c'' {
  h8 e4 a,8 d4 c8 h8~
  h8 a8 g4 c8 d a c
  c8 h16 c d8 e h c h4
  d8 c h c16 h a8 h c d

  h8 c8 h4 e8 d c16 h a8~
  a8 h4 h8 fis16 g a8 h4
  fis8 g4~ g16 fis16 e8 fis g a
  h8 a16 g g8 fis e8 h'4 a8~
}

sopb = \relative a' {
  a8 h c h a16 g fis8 g a
}

sopc = \relative a' {
  a8\repeatTie h c h a16 g fis8 g4
}

altoa = \relative g' {
  d8 g4 fis4 g g16 fis
  e8 fis e4  e8 h'4 e,8
  a4 g8 fis8~ fis e d4~
  d8 g4 a16 g fis4 e4

  g8 fis e d c8 g' e c
  e8 fis16 e g8 e d e fis4
  d4 e16 d cis8~ cis8 h4 fis'8
  d8 cis8 d4 c8 g'4 c,8
}

altob = \relative fis' {
  fis4 e8 d~ d c h c
}

altoc = \relative fis' {
  fis4 e8 d~ d c h4
}

tenora = \relative h {
  fis8 e d' c16 h a8 h g4
  g4~ g8 h a4 c4~
  c8 d16 e d8 c d4 fis
  g,4 h8 a4 g8 a h

  g8 a8 h4 e,8 h'4 e,8
  a4 g8 fis8~ fis e d4
  fis8 h4 e,8 a4 g8 fis~
  fis8 e d4 a'4 h8 e,
}

tenorb = \relative h {
  a8 g4 g8 fis16 g a8 g fis
}

tenorc = \relative h {
  a8 g a h fis16 g a8 d4 
}

bassa = \relative c {
  h8 g4 a8 fis4 e8 h'
  e4 c8 d e4 fis8 g
  fis4 h,8 a h4 d4
  h8 e4 a,8 d4 c8 h8~

  h8 a8 g4 c8 d a c
  c8 h16 c d8 e h cis h4
  h4 g8 a cis d e d
  h8 cis h8 a c4 g8 a
}

bassb = \relative h, {
  fis4 g8 h fis4 e8 fis
}

bassc = \relative h, {
  fis4 g8 d'4 d8 g,4 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \new Voice { \articulate {
  \keytempoetc
  \repeat unfold 2 {
    \sopa
  }
  \alternative {
    { \sopb }
    { \sopc }
  }
} }

malto = \new Voice { \articulate {
  \keytempoetc
  \repeat unfold 2 {
    \altoa
  }
  \alternative {
    { \altob }
    { \altoc }
  }
} }

mtenor = \new Voice { \articulate {
  \keytempoetc
  \repeat unfold 2 {
    \tenora
  }
  \alternative {
    { \tenorb }
    { \tenorc }
  }
} }

mbass = \new Voice { \articulate {
  \keytempoetc
  \repeat unfold 2 {
    \bassa
  }
  \alternative {
    { \bassb }
    { \bassc }
  }
} }

themidi = {
 <<
  \set Score.midiChannelMapping = #'staff

  \new Staff = "v1" {
    \set Staff.midiInstrument = #"electric piano 1"
    << \msop \malto \mtenor \mbass >>
  }
  \new Staff = "v3" {
    \set Staff.midiInstrument = #"electric piano 2"
    << \msop \malto \mtenor \mbass >>
  }
 >>
}

\score {
  \themidi
  \midi { }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Score

ssop = \new Voice {
  \keytempoetc
  \voiceOne
  \repeat volta 2 {
    \sopa
  }
  \alternative {
    { \sopb }
    { \sopc }
  }
  \bar "|."
}

salto = \new Voice {
  \keytempoetc
  \voiceTwo
  \repeat volta 2 {
    \altoa
  }
  \alternative {
    { \altob }
    { \altoc }
  }
  \bar "|."
}

stenor = \new Voice {
  \keytempoetc
  \voiceThree
  \repeat volta 2 {
    \tenora
  }
  \alternative {
    { \tenorb }
    { \tenorc }
  }
  \bar "|."
}

sbass = \new Voice {
  \keytempoetc
  \voiceFour
  \repeat volta 2 {
    \bassa
  }
  \alternative {
    { \bassb }
    { \bassc }
  }
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
  \partcombine \stenor \sbass
}

thescore = {
 <<
  \new PianoStaff << \new Staff \upper \new Staff \lower >>
 >>
}

\score {
  \thescore
  \layout { }
}

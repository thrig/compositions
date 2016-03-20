%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version  "2.18.2"
\include  "articulate.ly"

\header {
  title       = "Eight Bit Intro"
  composer    = "Jeremy Mates"
  subsubtitle = "2016-03-20"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo "Blippy" 4=96 }

keytempoetc = {
  \accidentalStyle "neo-modern"
  \time 2/4
  \normtempo

  \key bes \minor
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Music

sopa = \relative c'' {
  f4. g8
  ees16 des c4 f8
  bes,4. c8
  des16 ees des4 f16 ges

  f4 ees16 des ges, aes 
  bes4 des8 c
  f4. des8
  f4. ees8

  f8 c f8. des16
  ees4 c8 des16 c
  bes4. r8
}

altoa = \relative g' {
  c4 c8 bes
  aes16 bes aes16 g f16 aes c ees
  des,16 f ges ees des f aes f
  des16 ges aes16 bes f des aes bes

  c4 aes'8 ees16 des
  ges16 f ees ges bes des, f aes
  c,16 ees des f aes ees ges bes
  aes16 c f, aes c bes g ees

  c16 des f aes f aes c bes
  aes4 ges16 f8 f16
  f4. r8
}

bassa = \relative b {
  f4 aes8 g
  c4. aes8
  bes4. aes8
  bes8 f bes8. ges16

  aes4 f8 ges
  bes4. c8
  aes16 ges f4 bes8
  f4. g8

  aes16 bes aes4 c16 des
  c4 bes16 aes des, ees
  bes'4. r8
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \new Voice { \articulate {
  \keytempoetc
  \sopa
} }

malto = \new Voice { \articulate {
  \keytempoetc
  \altoa
} }

mbass = \new Voice { \articulate {
  \keytempoetc
  \bassa
} }

themidi = {
 <<
  \set Score.midiChannelMapping = #'staff

  % on the wild assumption the NES Composer soundfont is available
  \new Staff = "v0" {
    << \msop \malto \mbass >>
  }
  \new Staff = "v1" {
    \set Staff.midiInstrument = #"electric piano 1"
    << \msop \malto \mbass >>
  }
  \new Staff = "v2" {
    \set Staff.midiInstrument = #"electric piano 2"
    << \msop \malto \mbass >>
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
  \sopa
  \bar "|."
}

salto = \new Voice {
  \keytempoetc
  \voiceTwo
  \altoa
  \bar "|."
}

sbass = \new Voice {
  \keytempoetc
  \voiceFour
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
  \sbass
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

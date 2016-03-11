%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/
%
% timidity --config-file=organ.cfg

\version  "2.18.2"
\language "deutsch"
\include  "articulate.ly"

\header {
  title       = "Chorale No. 15"
  composer    = "Jeremy Mates"
  subsubtitle = "2016-03-10"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=84 }
fermtempo = { \tempo 4=40 }

keytempoetc = {
  \set Staff.midiInstrument = #"church organ"
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 4/4
  \normtempo

  \key e \major
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Music

sopa = \relative c'' {
  h2 a4 gis~
  gis8 fis a4 gis2
  h4 cis dis cis
  h4 gis gis2

  a4 gis8 a h4 cis
  dis4 e~ e8 cis h8 a
  h4 a h2
  dis8 cis h4 cis gis

  gis8 cis h4 a8 gis fis gis
  h2 h4 cis8 d
  e8 a, gis4 gis a~
  a8 h cis4 d cis8 h

  a2 gis
  gis8 a h4 a4. a8
  gis4 fis fis gis4~
  gis8 a h4 cis dis8 cis

  h4 cis4 h4 \fermtempo h4\fermata
}

altoa = \relative g' {
  gis4 fis d e
  e4 dis4 e2
  fis2~ fis8 gis a4
  fis4 dis e e~

  e8 dis8 e4. gis8 fis4
  dis4 gis8 a gis4. fis8
  gis4 fis e2
  fis4 gis4. fis8 e cis

  e4 fis e8 e dis e
  fis2 gis8 fis e fis
  gis8 fis e2 d4
  cis4 e8 fis gis4. gis8

  e2 h4 e~
  e8 fis e8 d cis8 dis4.
  e2 dis8 cis h4
  e4 fis gis4. a8
  gis4 fis2 gis4
}

tenora = \relative c' {
  e2~ e8 d cis h
  cis4 a4 h2
  h4 h a8 h a4~
  a8 gis h4 h2

  cis4 h h a8 gis
  fis4 e e' dis4
  h8 dis cis4 h2
  h4. a8 gis4. a8

  h8 a fis4 a a
  dis2 h4 a4
  cis4 h cis2
  a8 gis a4 gis fis

  e2 gis4 h
  gis8 fis gis4 a h
  h4 a h h~
  h8 cis dis4 e dis
  e8 dis cis4 dis4 e4
}

bassa = \relative c {
  e4. dis8 fis4 gis
  a8 e fis4 gis2
  h,4. e8 fis4 fis
  dis8 cis h4 e4 a8 gis

  fis4 gis gis, a
  h4 gis2 h4
  e4 fis gis4. e8
  dis4 e cis8 dis e fis

  e4 dis cis fis
  h,2 e8 d cis h
  a4 e'8 d cis4 fis
  fis8 e cis4 h a8 gis

  a2 e'4 h
  cis8 dis e4 fis dis8 h
  e4 fis4 h,4 e4
  e8 a dis,4 cis h
  h'4 a h e,\fermata
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

mtenor = \new Voice { \articulate {
  \keytempoetc
  \tenora
} }

mbass = \new Voice { \articulate {
  \keytempoetc
  \bassa
} }

themidi = {
 <<
  \set Score.midiChannelMapping = #'voice

  \new Staff = "soprano" << \msop >>
  \new Staff = "alto"    << \malto >>
  \new Staff = "tenor"   << \mtenor >>
  \new Staff = "bass"    << \mbass >>
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

stenor = \new Voice {
  \keytempoetc
  \voiceThree
  \tenora
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/
%
% timidity --config-file=nes.cfg

\version  "2.18.2"
\include  "articulate.ly"

\header {
  title       = "Invention No. 4"
  composer    = "Jeremy Mates"
  subsubtitle = "2016-04-08"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo "Blippy" 4=100 }

keytempoetc = {
  \accidentalStyle "neo-modern"
  \time 2/4
  \normtempo

  \key bes \minor
}

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

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
  bes4. aes8
}

sopsubjb = \relative g' {
  ges16 aes bes8 c4

  ees8 des4 c8
  bes8 aes bes16 c aes bes
  c8 des16 c bes8 aes16 g
  aes8 bes16 aes g16 bes c8
}

sopb = \relative c'' {
  \sopsubjb
  \transpose bes f' { \sopsubjb }
  \relative g'' {
    ees8 des c bes
    aes'8 ges f ees
    g8 f ges e
  }
}

sopc = \relative c'' {
  f8 f16 ees aes8 g
  c4. aes8
  bes4. aes8
  bes8 f bes8. ges16

  aes4 f8 ges
  bes4. c8
  aes16 ges f4 bes8
  f4. g8

  aes16 bes aes4 c16 des
  c4 bes16 aes des, ees
}

sopspiral = \relative d' {
  f4. bes8
  ges4 aes8 bes
  c4 des8 bes
  f'4 e8 d

  c4. b8
  a4 dis
  e4 fis
  gis4 fis~
  fis8 e e cis
}

sopd = \relative f'' {
  f4 ees16 des ges, aes
  bes4 c16 des ees des
  c4 bes

  des8 bes c bes
  c8 bes aes16 bes c bes
  \sopspiral
  \transpose bes cis' { \sopspiral } 
  \transpose bes e' { \sopspiral } 
  \transpose bes g' { \sopspiral } 
}

sope = \relative f'' {
  f4 f8 g
  ees16 des c4 f8
  bes,4. c8
  des16 ees des4 f16 ges

  f4 ees16 des ges, aes 
  bes4 des8 c
  f4. des8
  f4. ees8

  f8 c f8. des16
  ees4 c8 des16 c
  bes4 bes8 c
  des16 c bes8 aes c16 des

  ees8 des c ees16 des
}

sopf = \relative f'' {
  f8 f16 ees aes8 g
  c4. aes8
  bes4. aes8
  bes8 f bes8. ges16

  aes4 f8 ges
  bes4. c8
  aes16 ges f4 bes8
  f4. g8

  aes16 bes aes4 c16 des
  c4 bes16 aes des, ees
  des8 ees des8.. r32
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
  f4 des8 ees8
}

altosubjb = \relative g' {
  ees16 f ges f aes ges ees des

  f16 aes f des ees f ees c
  des8 f16 ees16 des ees f8
  g16 aes f aes g8 d16 ees
  f16 c d f ees d g ees
}

altob = {
  \altosubjb
  \transpose bes f' { \altosubjb }
  \relative c'' {
    c16  bes bes aes aes ges ges f
    f'16 ees ees des des ces ces bes
    d16 c c bes des des c c
  }
}

altoc = \relative a' {
  c16 des, f aes c ees ees, g
  c,8 ees16 g bes f aes g
  bes16 ees, g des f aes ees g
  f16 g aes c bes ges ees des

  f16 bes, des f aes8 bes16 c
  f,16 bes des c bes ges ees c
  c'16 bes aes f des bes des f
  aes16 c f, aes ees g bes g

  f16 des ees aes f des f aes
  g4 g8 f16 ges
}

altospiral = \relative f' {
  des8 c16 ees ges bes, des f
  ees16 des f ees ges f ees des
  aes'16 f bes g bes aes ges f
  f16 aes c aes g e f8
  e16 a d e, g fis g d
  e16 g dis e fis gis dis fis
  gis16 b c a cis dis dis, fis
  e16 gis cis fis, a cis cis, e
  fis16 a cis b~ b a~ a fis
}

altod = \relative f' {
  f4 c16 f ees c
  bes4 aes'16 ges ces, des
  ees8 f ges f16 ges

  aes8 ges16 aes f8 ees16 f
  ges16 ees c des f8 ees8
  \altospiral
  \transpose bes cis' { \altospiral }
  \transpose bes e' { \altospiral }
  \transpose bes g' { \altospiral }
}

altoe = \relative c'' {
  c8 aes c bes
  aes16 bes aes16 g f16 aes c ees
  des,16 f ges ees des f aes f
  des16 ges aes16 bes f des aes bes

  c4 aes'8 ees16 des
  ges16 f ees ges bes des, f aes
  c,16 ees des f aes ees ges bes
  aes16 c f, aes c bes g ees

  c16 des f aes f aes c bes
  aes4 ges16 f8 f16
  f8 des ges aes
  ges16 aes ees16 ges f des c8

  c16 ees ges des f aes ges bes
}

altof = \relative b' {
  c16 des, f aes c ees ees, g
  c,8 ees16 g bes f aes g
  bes16 ees, g des f aes ees g
  f16 g aes c bes ges ees des

  f16 bes, des f aes8 bes16 c
  f,16 bes des c bes ges ees c
  c'16 bes aes f des bes des f
  aes16 c f, aes ees g bes g

  f16 des ees aes f des f bes
  c4 ees8 bes16 aes
  f16 aes ges bes aes8.. r32
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
  f4 f8 aes
}

basssubjb = \relative c' {
  c8 bes aes ges

  f4. aes8
  bes4. f8
  ees4 d16 ees f8
  d8 bes g' ees16 aes
}

bassb = {
  \basssubjb
  \transpose bes f { \basssubjb }
  \relative c {
    c8 des ees f
    f8 ges aes bes
    g8 aes bes c
  }
}

bassc = \relative c {
  f8 des ees g
  ees16 des c8 des f
  bes,8 c des c
  des16 ees des4 f16 ges

  f4 ees16 des ges, aes 
  bes8 bes16 aes des8 c
  f4. des8
  f4. ees8

  f8 c f8. des16
  ees4 c8 des16 c
}

bassspiral = \relative c {
  bes4. ees8

  c4 des8 ees
  f4 ges8 ees
  bes'4 aes8 ges
  f4. ees8

  des4 g
  a4 b
  c4 b~
  b8 a a fis
}
bassspirallast = \relative c {
  <bes bes'>4. <ees ees'>8

  <c c'>4 <des des'>8 <ees ees'>
  <f f'>4 <ges ges'>8 <ees ees'>
  <bes' bes'>4 <aes aes'>8 <ges ges'>
  <f f'>4. <ees ees'>8

  <des des'>4 <g g'>
  <a a'>4 <b b'>
  <c c'>4 <b b'>~
  <b b'>8 <a a'> <a a'> <fis fis'>
}

bassd = \relative c {
  bes4 c16 des ees8
  des4 ees8 aes,8
  ges8 f8 ees'8 des
  \bassspiral
  \transpose bes cis' { \bassspiral }
  \transpose bes e' { \bassspiral }
  \transpose bes g { \bassspirallast }
  <bes bes'>4. <ees ees'>8
  <c c'>4 <des des'>16 <bes bes'> <ees ees'>16 <c c'>
}

basse = \relative b {
  <f f'>8 <c' f>16 bes aes8 g
  c4. aes8
  bes4. aes8
  bes8 f bes8. ges16

  aes4 f8 ges
  bes4. c8
  aes16 ges f4 bes8
  f4. g8

  aes16 bes aes4 c16 des
  c4 bes16 aes des, ees
  f8 bes, ees16 des c8
  bes8 c8 f8 ees16 bes'

  aes8 bes16 aes c f, bes8
}

bassf = \relative f {
  f8 des ees g
  ees16 des c8 des f
  bes,8 c des c
  des16 ees des4 f16 ges

  f4 ees16 des ges, aes 
  bes8 bes16 aes des8 c
  f4. des8
  f4. ees8

  f8 c f8. des16
  ees4 c8 ges'16 f
  bes8 ees, f8.. r32
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \new Voice { \articulate {
  \keytempoetc
  \repeat unfold 2 { \sopa \sopb }
  \sopc
  \sopd
  \sope
  \sopf
} }
malto = \new Voice { \articulate {
  \keytempoetc
  \repeat unfold 2 { \altoa \altob }
  \altoc
  \altod
  \altoe
  \altof
} }
mbass = \new Voice { \articulate {
  \keytempoetc
  \repeat unfold 2 { \bassa \bassb }
  \bassc
  \bassd
  \basse
  \bassf
} }

themidi = {
 <<
  \set Score.midiChannelMapping = #'staff
  % on the wild assumption a NES Composer soundfont is available
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
  \repeat volta 2 {
    \sopa
    \sopb
  }
  \sopc
  \sopd
  \sope
  \sopf
  \bar "|."
}

salto = \new Voice {
  \keytempoetc
  \voiceTwo
  \repeat volta 2 {
    \altoa
    \altob
  }
  \altoc
  \altod
  \altoe
  \altof
  \bar "|."
}

sbass = \new Voice {
  \keytempoetc
  \voiceFour
  \repeat volta 2 {
    \bassa
    \bassb
  }
  \bassc
  \bassd
  \basse
  \bassf
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
\markuplist { \paragraph { \with-color #grey \tiny {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105.
} } }

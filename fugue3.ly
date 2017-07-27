%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version  "2.18.2"
\include  "articulate.ly"

\header {
  title       = "Fugue No. 3"
  composer    = "Jeremy Mates"
  subsubtitle = "2017-07-27"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2017 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

normtempo = { \tempo 4=66 }

keytempoetc = {
  \accidentalStyle "modern"
  \time 2/4
  \normtempo
  \key c \minor
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Music

subject = {
  c4 ees16( d c b)
  c8 r8 d16( ees f8)
  ees16( f g aes g f ees) r16
  f16( ees d c) ees( d c b)
}

countersubject = {
  bes8 d~ d16 c d r16
  bes16( c d ees) c( d ees f)
  g4 fis8 g16 d
  ees8( f16 ees) d( c d8)
}

sopa = \relative c'' {
  \subject c4 d8 ees16 aes,
  \relative a' { \countersubject } d8( c b) d16 c
  ees8( d c b)
  g16 aes c8~ c d
  g,4 g'
  f4 ees8.( d16
  c16 b) c8 r8 d8~
  d8 ees f( ees16 d)
  g16( f ees d) ees( d c bes)
  \subject
  c4 d16( c d ees)
  f16( ees) c( d ees) d( ees f)
  d8 g16( f ees d) f( ees
  d16 c) ees r16 \transpose c d { \relative c'' { \subject        } } d4
  r8 f8 d c
  e,8 e' a,16( g f) f'16\rest
  r8 f8( e16 d) r8
  r8 d16( e f8) ees16 d
  c8 bes c16 d bes8
  c8 g aes g
  f16( g aes8) g( aes16 bes)
  c8 bes16( c d8) c16( \tempo 4=62 b^\markup { \italic "rit." }
  \tempo 4=54
  c4) r4
}

altoa = \relative g' {
  s2*4
  r8 g16( a bes aes g f)
  \transpose c g, { \relative g' { \subject        } } g4 d8 f
  \transpose g c' { \relative a  { \countersubject } }
  g4 bes16( aes g f)
  g8 r8 d16( ees f8)
  ees16( d c8) g'16 f g8~
  g16 f bes aes g4~
  g8 bes aes r8
  R2*2
  r8 g16 a bes a bes8
  a8 a c16 bes a8
  bes16 a g8~ g16 g a a
  bes16 a g ees f( g a bes)
  c8 bes16 a~ a f g a
  bes16( a g f) bes d cis d
  e8 d16 c bes a g bes
  d8 bes
  \transpose g d { \relative a' { \countersubject } } a8 g16 f
  g8 g ees d
  c16( d ees c) f8 ees~
  ees8 d~ d ees
  c8 d~ d16 aes'( g f
  g4) r4
}

bassa = \relative c {
  R2*10
  \relative f { \subject } c4 g'
  bes16( aes g f) g4
  g4 g8. bes16
  \transpose g c { \relative g  { \countersubject } }
  c,8 g'16( f ees f g) r
  a8 c16( bes a bes c) r
  bes8 ees16 d c8. c16
  bes8 a16 c d8 c16 bes
  a8 bes d,( e16 f)
  g8 bes~ bes16 bes a8
  c16( bes a8) g bes
  g16( a bes a)
  \transpose c d { \relative c  { \subject        } } d,4
  \transpose g c { \relative g  { \countersubject } } c4 r4
}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \articulate {
  \keytempoetc
  \sopa
}
malto = \articulate {
  \keytempoetc
  \altoa
}
mbass = \articulate {
  \keytempoetc
  \bassa
}

themidi = {
 <<
  \set Score.midiChannelMapping = #'instrument
  \new Staff << \msop \malto \mbass >>
 >>
}
\score {
  \themidi
  \midi { }
}

%
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

sbass = {
  \keytempoetc
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
  \set Score.tempoHideNote = ##t
  \new PianoStaff << \new Staff \upper \new Staff \lower >>
 >>
}
\score {
  \thescore
  \layout { }
}

\markuplist { \paragraph { \with-color #grey {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
} } }

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

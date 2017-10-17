% LilyPond engraving system - http://www.lilypond.org/

\version "2.18.2"
\include "articulate.ly"

\header {
  title       = "Chorale No. 17"
  composer    = "Jeremy Mates"
  subsubtitle = "2017-10-17"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2017 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

tempoandetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "modern"
  \tempo 4=66
}

sopa = \relative f'' {
  c2\mf f,4(\mp\< g)
  c4( d ees\!\> d)
  c8( bes\! aes4) bes8( aes g bes)
  des4\mf c8( bes) des4(\mp\< c8 b)

  c4.\!\mf g8( aes4 bes)
  c8( bes aes4) g g(
  a4\< b c)\!\> b8( a)
  g4\! g c4(\mf d4)

  e2 c4( bes\>
  aes4 g)\!\mp g4 d'4(\f
  ees4) f2 ees4(\mf
  d4 c4) bes8 d8( ees4)

  aes,8 aes( bes c~) c c4.~
  c8 g8(\mp aes bes16 aes g8) g( f4)
  g8(\mf a bes4) a4.\mp r8
}

altoa = \relative f' {
  e16(\mf f g8) a4 r8 c,8( d4)
  e8( d) b4(\! c8 d) r8 g8
  ees16(\< f g8\!\> f ees\! d4) r8 g8(
  aes4) r8 g8(\mp f4.) r8

  g8(\mf f ees4) f8( ees d4)
  ees8 d16(\< ees f8\!\> ees d4)\! ees(
  e4 f4) e2
  d4 e) a4.\mf b8~

  b8 a( g4 fis) r8 g~
  g8( f ees4) f2
  ees4( d2) ees8(\mp f16\< g
  aes8) bes(\!\> aes g)\! g8.( aes16 bes8) aes16( bes

  c4) d,8(\mp e!16 f g8) a8 r8 f~
  f8( e) ees( des4) ees8 ees4
  c8\mf f( e4) f4.\mp r8
}

tenora = \relative c' {
  c4\mf r8 g8( a4) g
  g4( aes) g( a8 b)
  c4 r8 c8( bes8 c d4)
  des4(\mf ees4.) r8 r8 d8

  c4\mf c c r4
  g'4 c, bes bes(
  c4) g2 a4(
  b4 c) a8(\mf g f4)

  g8( a b4) a8 c8 g4
  c4 r4 b4 c~
  c4 aes'( g) g\mp(
  f4 ees) d16(\< ees f8 g8)\!\> c,

  f8(\! ees) g c, c8 r8 g8(\mp a8
  b16 c8) r16 c4( bes c)
  g4 g a4. r8
}

bassa = \relative c {
  c4\mf f d\> b
  c4\!\mp f(\mf ees8 f g4)
  c,4 f( g8 aes bes g)
  f4.\mf r8 aes4\mp\< ees8 g

  ees8(\!\mf f) aes4 f( g)
  c,4 f( g) ees4
  c2 c4 f4
  g4 c,4 f4\mf d4

  c4 g' ees bes'
  f4 c' g ees
  c4 d g c,8(\mp ees
  f8 g\< aes bes)\!\> bes8 g16( f\! ees8) aes16( g

  f8) c' g4 c,8 f4 d8
  g4(\mp f4 g aes)
  e!4 c f4. r8
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \new Voice {
  \tempoandetc 
  \set Staff.midiInstrument = #"electric piano 2"
  \sopa
}

malto = \new Voice {
  \tempoandetc 
  \set Staff.midiInstrument = #"electric piano 2"
  \altoa
}

mtenor = {
  \tempoandetc 
  \set Staff.midiInstrument = #"electric piano 2"
  \tenora
}

mbass = {
  \tempoandetc 
  \set Staff.midiInstrument = #"electric piano 2"
  \bassa
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SCORE

ssop = \new Voice {
  \tempoandetc 
  \sopa
  \bar "|."
}

salto = \new Voice {
  \tempoandetc 
  \altoa
  \bar "|."
}

stenor = {
  \tempoandetc 
  \tenora
  \bar "|."
}

sbass = {
  \tempoandetc 
  \bassa
  \bar "|."
}

thescore = {
  \new StaffGroup <<
    \new Staff << \ssop >>
    \new Staff << \salto >>
    \new Staff << \clef alto \stenor >>
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

\paper {
  page-count = 1
}
\score {
  \thescore
  \layout { #(layout-set-staff-size 20) }
}
\score {
  \articulate { \themidi }
  \midi { }
}

% LilyPond engraving system - http://www.lilypond.org/

\version "2.18.2"
\include "articulate.ly"

\header {
  title       = "2/4"
  subsubtitle = "2019-10-03"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2019 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=88 }

keytempoetc = {
  \accidentalStyle "neo-modern"
  \time 2/4
  \normtempo
}

uppera = \relative c'' {
  \partial 8 c16(\mf d

  e8 g4\f) c,8(
  d4\mp) a'16(\f g f8
  e8 d4) e16(\mf f
  g8) c,-. g'16( f e8

  g4\p) c,8(\mp d16 c
  b8) c-.\mf g c(\f
  d8 e4)\p f8\f
  b,8 g4 g'8(\p

  c,8\mf b) d(\f c
  a4.)\p g8\pp
  a8.(\p b16 c8\mp\< d
  e8 g4\!\f) c,8(

  d4)\mp a'16(\f g f8
  e8 d4) e16(\mf f
  g8) c,-. g'16( f e8
  g4\p) c,8(\mp d16 c

  b8) c-.\mf g c(\f
  d8 e4)\p f8\f
  b,8 g4 g'8(\p
  c,8\mf b) d(\f c

  a4.)\p g8\pp
  a8.(\p b16 c8\mp d)
  b4-.\sfz g-.\sfz
  a8(\mf e'4)\f d8(

  b8\mf a4.)\mp
  g8(\mf d'4\ff\< f8\!\>
  e4.->\!) a,8(\mp
  e'4)\ff d8\f( b8

  a4.)\ff g8(
  c16 b c8) b( a
  b4) a8( g
  a4.)\f g8(\mp

  ees'4)\mf g(
  d4)\p a(\mp
  bes4)\mf d(
  a4)\p g(\mp

  ees4)\mf g(
  d4)\p c(\mp
  ees4)\mf d(
  g4.)\p fis8(\mp

  g4)\mf bes4--\f
  d8( c ees8. d16
  c4) ees8( d16 c
  bes8) g'-. d8.( bes16

  a4) d--
  d4 ees
  bes4. a8(
  g4.) c16(\mf d

  e8 g4\f) c,8(
  d4\mp) a'16(\f g f8
  e8 d4) e16(\mf f
  g8) c,-. g'16( f e8

  g4\p) c,8(\mp d16 c
  b8) c-.\mf g c(\f
  d8 e4)\p f8\f
  b,8 g4 g'8(\p

  c,8\mf b) d(\f c
  a4.)\p g8\pp
  a8.(\p b16 c8\mp\< d
  e8 g4\!\f) c,8(

  d4)\mp a'16(\f g f8
  e8 d4) e16(\mf f
  g8) c,-. g'16( f e8
  g4\p) c,8(\mp d16 c

  b8) c-.\mf g c(\f
  d8 e4)\p f8\f
  b,8 g4 g'8(\p
  c,8\mf b) d(\f c

  a4.)\mp g8
  a8.(\mf b16 c8\f d
  g,8-.\ff r4.
}

lowera = \relative c' {
  \clef alto
  \partial 8 r8

  c16-.\mp c-. c-. c-. c-. c-. c-. c-.
  b16-. b-. b-. b-. b-. b-. b-. b-.
  g16-. g-. g-. g-. g-. g-. g-. g-.
  c16-. c-. c-. c-. c-. c-. c-. c-.
 
  e16-. e-. e-. e-. e-. e-. e-. e-.
  f16-. f-. f-. f-. f-. f-. f-. f-.
  c16-. c-. c-. c-. c-. c-. c-. c-.
  d16-. d-. d-. d-. d-. d-. d-. d-.

  e16-. e-. e-. e-. e-. e-. e-. e-.
  f16-. f-. f-. f-. f-. f-. f-. f-.
  d16-. d-. d-. d-. d-. d-. d-. d-.
  c16-. c-. c-. c-. c-. c-. c-. c-.

  b16-. b-. b-. b-. b-. b-. b-. b-.
  g16-. g-. g-. g-. g-. g-. g-. g-.
  c16-. c-. c-. c-. c-. c-. c-. c-.
  e16-. e-. e-. e-. e-. e-. e-. e-.

  f16-. f-. f-. f-. f-. f-. f-. f-.
  c16-. c-. c-. c-. c-. c-. c-. c-.
  d16-. d-. d-. d-. d-. d-. d-. d-.
  e16-. e-. e-. e-. e-. e-. e-. e-.

  f16-. f-. f-. f-. f-. f-. f-. f-.
  d16-. d-. d-. d-. d-. d-. d-. d-.
  g,16-. g-. g-. g-. g-. g-. g-. g-.
  c16-. c-. c-. c-. c-. c-. c-. c-.

  c16-. c-. c-. c-. c-. c-. c-. c-.
  d16-. d-. d-. d-. d-. d-. d-. d-.
  e16-. e-. e-. e-. e-. e-. e-. e-.
  g16-. g-. g-. g-. g-. g-. g-. g-.

  f16-. f-. f-. f-. f-. f-. f-. f-.
  f16-. f-. f-. f-. f-. f-. f-. f-.
  e16-. e-. e-. e-. e-. e-. e-. e-.
  fis16-. fis-. fis-. fis-. fis-. fis-. g-. g-.

  g16-. g-. g-. g-. g-. g-. g-. g-.
  fis16-. fis-. fis-. fis-. fis-. fis-. fis-. fis-.
  d16-. d-. d-. d-. d-. d-. d-. d-.
  c16-. c-. c-. c-. c-. c-. c-. c-.

  bes16-. bes-. bes-. bes-. bes-. bes-. bes-. bes-.
  bes16-. bes-. bes-. bes-. bes-. bes-. bes-. bes-.
  a16-. a-. a-. a-. a-. a-. a-. a-.
  g16-. g-. g-. g-. g-. g-. g-. g-.

  bes16-. bes-. bes-. bes-. bes-. bes-. bes-. bes-.
  f'16-. f-. f-. f-. f-. f-. f-. f-.
  ees16-. ees-. ees-. ees-. ees-. ees-. ees-. ees-.
  g16-. g-. g-. g-. g-. g-. g-. g-.

  fis16-. fis-. fis-. fis-. fis-. fis-. fis-. fis-.
  bes,16-. bes-. bes-. bes-. bes-. bes-. bes-. bes-.
  d16-. d-. d-. d-. d-. d-. d-. d-.
  g16-. g-. g-. g-. g-. g-. c,-. c-.

  c16-. c-. c-. c-. c-. c-. c-. c-.
  b16-. b-. b-. b-. b-. b-. b-. b-.
  g16-. g-. g-. g-. g-. g-. g-. g-.
  c16-. c-. c-. c-. c-. c-. c-. c-.

  e16-. e-. e-. e-. e-. e-. e-. e-.
  f16-. f-. f-. f-. f-. f-. f-. f-.
  c16-. c-. c-. c-. c-. c-. c-. c-.
  d16-. d-. d-. d-. d-. d-. d-. d-.

  e16-. e-. e-. e-. e-. e-. e-. e-.
  f16-. f-. f-. f-. f-. f-. f-. f-.
  d16-. d-. d-. d-. d-. d-. d-. d-.
  c16-. c-. c-. c-. c-. c-. c-. c-.

  b16-. b-. b-. b-. b-. b-. b-. b-.
  g16-. g-. g-. g-. g-. g-. g-. g-.
  c16-. c-. c-. c-. c-. c-. c-. c-.
  e16-. e-. e-. e-. e-. e-. e-. e-.

  f16-. f-. f-. f-. f-. f-. f-. f-.
  c16-. c-. c-. c-. c-. c-. c-. c-.
  d16-. d-. d-. d-. d-. d-. d-. d-.
  e16-. e-. e-. e-. e-. e-. e-. e-.

  f16-. f-. f-. f-. f-. f-. f-. f-.
  d16-. d-. d-. d-. d-. d-. d-. d-.
  R2
}

midiupper = {
  \keytempoetc
  \uppera
} midilower = {
  \keytempoetc
  \lowera
}

scoreupper = {
  \keytempoetc
  \uppera
  \bar "|."
}
scorelower = {
  \keytempoetc
  \clef bass
  \lowera
  \bar "|."
}

themidi = {
  <<
    \new Staff = "upper" <<
      \set Staff.midiInstrument = #"electric bass (finger)"
      \midiupper
    >>
    \new Staff = "lower" <<
      \set Staff.midiInstrument = #"electric bass (pick)"
      \midilower
    >>
  >>
}

\book {
  \score {
    \new StaffGroup \with {
      \override StaffGrouper.staff-staff-spacing = #'(
                                (basic-distance . 0)
                                (padding . 0))
      } <<
      <<
        \new Staff = "upper" << \scoreupper >>
        \new Staff = "lower" << \scorelower >>
      >>
    >>
    \layout { }
  }
  \score {
    \new Staff = "midi" <<
      \set Score.midiChannelMapping = #'instrument
      \articulate { \themidi }
    >>
    \midi { }
  }
}

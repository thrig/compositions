% LilyPond engraving system - http://www.lilypond.org/

\version "2.18.2"
\include "articulate.ly"

\header {
  % some portion of the bass line being an integer representation of an
  % output of the weierstrass function (see my Music::Voss Perl module)
  title = "after weierstrass"
  subsubtitle = "2019-04-06"
  composer = "Jeremy Mates"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2019 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

tempoandetc = {
  \tempo 4=68
  \time 3/4
}

sopa = \relative f'' {
  c4\ff-- bes2
  a8 g4( bes4.)\f
  R2.
  \time 2/4
  g4-- c(

  \time 3/4
  bes2) a8(\mf c~)
  c8 g4 \times 2/3 { bes4( r16 \autoBeamOff c16 \autoBeamOn } d8)
  \time 4/4
  \times 2/3 { f8(\f ees16 d) r8 } c8-.\mf bes8-. r4 r8 d8-.
  \time 3/4
  c8 r8 d,4 a'\f

  g8 c-.\mf bes-. r8 a8-.\mp g-.
  bes8-.\mf a-. g-. a-. bes d\mp
  \time 2/4
  d8( cis) r4
  \times 2/3 { r8 f8\f( e } d4\mp)

  \time 3/4
  g4\f( f4. e8)
  d4(\mf f) a,8\f-. a-.
  g8\ff b-. c-. bes-. a g
  f8-. a-. b-. c-. e( f

  d4) c e
  \time 2/4
  f4--\f b,8( c)
  a8( g) g( f)
  \time 3/4
  f4( ees4.) ges16 ges

  \times 2/3 { f4 r16 d16 } ees8-. f-. ees-. g-.
  \time 2/4
  \times 2/3 { a8 r8. a16\mf } g8 f-. r8
  c'8-. r8 f-.
}

altoa = \relative f' {
  e4\ff r2
  f8( e4 g4.)\f
  r8 g8( f e f8.--) r16
  \time 2/4
  e4-- e

  \time 3/4
  r2 f8(\mf ees~)
  ees8 \times 2/3 { d4( r16 fis16 } g4) r8
  \time 4/4
  \times 2/3 { a8(\f g16 f) r8 } g4\mf
    r8 \times 2/3 { a8[( bes16 c]) r8 } r8
  \time 3/4
  r8 bes8 bes4\mp c,\f

  b'8 a-.\mf g-. r8 f8-.\mp e-.
  \times 2/3 { r4 r16 f16\mf } r8
    \times 2/3 { f4\> r16 \autoBeamOff e16( \autoBeamOn } d8)
  \time 2/4
  d8\!\p( cis) f\< bes,
  \times 2/3 { f'8\!\mf a8( g } fis4\mp)

  \time 3/4
  b4\f( a4. g8)
  g4\mf a \times 2/3 { f4\f r16 e16 }
  d8-.\ff d-. r8 e8-. \times 2/3 { d8 c' r }
  \times 2/3 { d,4 r16 d16 } r8 a'8-. \times 2/3 { a4 r16 a16 }

  g8 bes g-. f-. g4
  \time 2/4
  a8\f a( g) r8
  d8-. r8 e8-. f-.
  \time 3/4
  c4( c4.) ees16( d

  c8) c-. c-. r8 c8-. r8
  \time 2/4
  \times 2/3 { r4 r16 f16\mf } r4
  r8 g8-. r8 f8-.
}

tenora = \relative c' {
  g4\ff-- bes2
  r4. d8(\f \times 2/3 { bes4) r16 c16( }
  d2) r4
  \time 2/4
  r4 g,4(

  \time 3/4
  bes2) c8\mf c~
  c8 bes a d4 r8
  \time 4/4
  f4\f g, r8 \times 2/3 { f8[( g16 a]) r8 } r8
  \time 3/4
  r4 f'4 \times 2/3 { e4\f c16\mp d }

  e2\f \times 2/3 { r4 r16 c16\mp }
  d4\mf( ees d8) r8
  \time 2/4
  r8 e8\mp d(\< g
  c,4\!\mf a'\mp)

  \time 3/4
  g8\f g, r4. c8\mf(
  b4 d) c(\f
  b8) g-.\ff c-. r8 \times 2/3 { d8 c r }
  r4 d4( c

  bes4) c r4
  \time 2/4
  c4--\f e8 r8
  r4 g,8-. bes-.
  \time 3/4
  a4( g4.) bes16( ges

  a4) a8-. r a8-. bes-.
  \time 2/4
  a4 r4
  \times 2/3 { r8 b16\p r8. } \times 2/3 { r8 e16\mp r8. }
}

bassa = \relative c {
  c4\ff-- g'2
  a8 c4(\f g) g8~
  g4. g8( des8.--) r16
  \time 2/4
  c4-- c(

  \time 3/4
  g'2) a8(\mf g~)
  g8 g4 g8( f d~)
  \time 4/4
  d8 r4 \times 2/3 { bes8[ c16 d] r8 } r4 d8-.
  \time 3/4
  \times 2/3 { f4 r16 a( } bes4) a(\f

  e4) g8-.\mf r8 c4\mp
  g8-.\mf f-. ees-. d-. g4
  \time 2/4
  \times 2/3 { r4 r16 cis,16\mp\< } d8( ees
  f4\!\mf d\mp)

  \time 3/4
  g,4\f( d'4. e8)
  g4\mf d d8-.\f d-.
  g8-. r8 c,8-.\ff c-. f g
  a8 r8 g8-. f-. e-. d-.

  g8-. f-. e-. d-. c4
  \time 2/4
  f8\f f( e) \times 2/3 { a8 g16 }
  f8( g) c,( d)
  \time 3/4
  f,4( c'4.) ees,16 ees

  f4 c'8-. d-. r g8~
  \time 2/4
  g8 f-.\mf ees-. f-. r8
  c8-. r8 f8-.
}

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
    \new Staff = "soprano" \msop
    \new Staff = "alto"   \malto
    \new Staff = "tenor" \mtenor
    \new Staff = "bass" \mbass
  >>
}

\score {
  \articulate { \themidi }
  \midi { }
}

ssop = {
  \tempoandetc
  \sopa
  \bar "|."
}

salto = {
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

\score {
  \thescore
  \layout { }
}

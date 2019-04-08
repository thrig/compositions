% LilyPond engraving system - http://www.lilypond.org/
%  for campbells_harpischord_tuned_1.sf2
% timidity --config-file=harps.cfg

\version "2.18.2"

\header {
  title       = "Invention No.6"
  composer    = "Jeremy Mates"
  subsubtitle = "2019-04-07"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2019 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

tempoandetc = {
  \tempo 4=57
  \time 2/4
}

sopa = \relative f' {
  c8 r16 c16 d e f g
  b32 a g16 f g32 f e16 g c8
  b8 a16 g f e c d
  e32 f g16 f32 g a16 b a g16 g32 f

  c'8 c
  \transpose g d { \relative g'' {
        g8. d16
  d16 e f32 e d16 c32 d e f e16 d
  g,16 d' c d f8 e32 d c b
  c8 d~ d16 e d32 c b16

  c8 } } a16 b~ b a16 b32 c d16~
  d16 f e d~ d c8 b16
  d4 d8 c8
  b8 e,8 a16 g8 f16~

  f16 e f c' b8. b16
  c16 d e8 d16 e f8
  d8 bes8 a4
  c8 d16 c bes8. g16

  a8 bes8 r16 bes16 a8
  g8 a4 a8
  g16 f e a c8 b8
  a8 e f8 g16 a32 b

  c16 g d'16 c b8. a16
  g16 b a f a b c d32 c
  b16 a g8 f8 e8
  a8 c16 b~ b a e'8

  d8 c16 b a4~
  a16 g f a c a g e
  f8 c'8. a16 b8
  f16 g b8. b16 a8

  g8 a b c8~
  c8 b16 a g g8 a16
  b16 c d e d8 g,8~
  g8 r8 a8 r8

  a8 b8 c8 r8
  c8 r8 d4
  a4. g8
  g4 a

  d,4 g
  g2
}

altoa = \relative d' {
  r8 d16 r16 b8 a
  d8 r8 a8 c16 b32 c
  d8 e c r8
  c16 b a8 g8. d'16

  \transpose c g, { \relative g {
  c8 r16 c16 d e f g
  b32 a g16 f g32 f e16 g c8
  b8 a16 g f e c d
  e32 f g16 f32 g a16 b a g16 g32 f

  g4 f8 e
  } }
  c16 d e g, \relative g' { g8. d16
  d16 e f32 e d16 c32 d e f e16 d
  g,16 d' c d f8 e32 d c b

  c8 d~ d16 e d32 c b16
  c4 } r4
  r4 f'16 g a8
  g16 a bes8 g e

  d8 d a c32 d e16
  e16 b f' e d c c b
  b32 c d16 c8~ c16 d e8
  e16 d c b c d32 e d16 d

  c8 b16 a g16 a b c
  e8. d16 d4~
  d16 c d e c8 g'16 f~
  f16 e~ e d g16 f32 e c8

  b8 c8~ c16 d f8
  e8 d a b16 c
  d8 g8 f8 b,16 c
  d8 r8 d8 r8

  e8 \transpose d f { \relative d' { d4 cis8
  b8 e,8 a16 gis8 fis16~
  fis16 e fis cis' b8. b16
  cis16 d e8 d16 e fis8

  d8 b8 a4
  cis8 d16 cis b8. gis16
  a8 b8 r16 b16 a8
  gis8 a4 a8

  gis16 fis e a cis8 b8 } }
  e2
}

bassa = \relative f {
  c8 g'8 g8. d16
  d16 e f32 e d16 c32 d e f e16 d
  g,16 d' c d f8 e32 d c b
  c8 d~ d16 e d32 c b16

  c16 b a8 g8 r8
  d'8 e16 fis g8 e
  d8 c8 r8 c16 c'
  g8 e32 d c16 d8 d8

  g8 f8 e16 f g8
  c,8 r16 c16 d e f g
  b32 a g16 f g32 f e16 g c8
  b8 a16 g f e c d

  e32 f g16 f32 g a16 b a g16 g32 f
  e4 d
  g4 a16 g f e~
  e16 d g16 a bes a g bes

  f8 g r16 g16 a8
  e8 d8 b16 c32 d e16 d
  g8 a f8 g8
  \transpose d a { \relative d {
  d4 d8 c8

  bes8 e,8 a16 g8 f16~
  f16 e f c' bes8. bes16
  c16 d e8 d16 e f8
  d8 bes8 a4

  c8 d16 c bes8. g16
  a8 bes8 r16 bes16 a8
  g8 a4 a8
  g16 f e a c8 bes8 } }

  e8 d4 c8
  b8 c16 d e g8 f16
  e8 d16 c f8 g
  e4 d

  f8 g a d
  a4 g
  f4 f8 e
  d8 c8 d16 e f8

  g4 g4
  c2
}

msop = {
  \tempoandetc 
  \sopa
}

malto = {
  \tempoandetc 
  \altoa
}

mbass = {
  \tempoandetc 
  \bassa
}

themidi = {
  <<
    \set Score.midiChannelMapping = #'staff
    \new Staff = "soprano" \msop
    \new Staff = "alto"  \malto
    \new Staff = "bass" \mbass
  >>
}

\score {
  \themidi
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

sbass = {
  \tempoandetc 
  \bassa
  \bar "|."
}

thescore = {
  \new StaffGroup <<
    \new Staff << \clef sop \ssop >>
    \new Staff << \clef alto \salto >>
    \new Staff << \clef bass \sbass >>
  >>
}

\score {
  \thescore
  \layout { }
}

% LilyPond engraving system - http://www.lilypond.org/

\version "2.18.2"
\include "articulate.ly"

\header {
  title       = "Chorale No. 18"
  subsubtitle = "2017-11-24"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2017 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=96 }
fermtempo = { \tempo 4=60 }

tempoandetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "modern"
  \key e \major
  \normtempo
}

sopa = \relative e' {
  e8 fis gis4 a4 gis4
  b8 cis dis4 e8 dis cis4
  b8 cis b4~ b8 cis dis4
  cis4 cis4 dis4
    \fermtempo
    % way way way too close to the staff and note otherwise
    e4^\markup { \translate #'(0.68 . 0.68) \musicglyph #"scripts.ufermata" }
    \normtempo
}

sopb = \relative b' {
  b4 b8 a gis4 ais8 b16 cis
  dis8 cis b4 cis4 cis4
  dis4 dis4 e4 cis4
  cis8 b16 ais gis8 fis fis8 ais
    \fermtempo
    b4^\markup { \translate #'(0.68 . 0.68) \musicglyph #"scripts.ufermata" }
    \normtempo
}

sopc = \relative b' {
  gis4 b4 cis cis
  b4 b8 cis dis cis b a
  gis4 a4 b4 fis4
  b4 a8 gis fis4 gis4
}

sopd = \relative b' {
  \fermtempo
  gis4^\markup { \translate #'(0.68 . 0.68) \musicglyph #"scripts.ufermata" }
    \normtempo
    b4 a4 a4
  b4 cis8 dis16 e fis4. fis8
  e4 d4 cis8 b a4
  b8 a b4 cis4 b4
  a8 gis b4
    \fermtempo
    b4^\markup { \translate #'(0.68 . 0.68) \musicglyph #"scripts.ufermata" }
    \normtempo
}

sope = \relative b' {
            b4
  b8 b gis4 a4 dis4
  e4 b4 cis8 dis e4
  b4 dis4 cis4 b8 a
  gis4 a4 b4
    \fermtempo
    gis4^\markup { \translate #'(0.68 . 0.68) \musicglyph #"scripts.ufermata" }
    \normtempo
}

altoa = \relative e' {
  b4 e4. fis8 e4
  fis8. a16 b8 a gis4 a4
  gis4 e8 gis fis4 gis4~
  gis4 a8 gis fis4 gis4
}

altob = \relative e' {
  fis4 e4 dis8 e fis8 gis
  ais4 gis8 fis e4 fis8 gis
  ais4 b4 b4 ais8 gis
  fis8 e e dis cis4 dis4
}

altoc = \relative e' {
  e4 fis8 e a8 b a4
  gis8 a gis4 fis8 e fis4
  e8 dis e8 fis gis4 dis4
  gis4 fis8 e dis4 dis4
}

altod = \relative e' {
  e4 gis8 fis e4 fis4
  gis4 gis4 a8 gis fis4
  gis8 a b8 gis~ gis8 gis fis8 b,
  fis'4 gis8 e a4 gis4
  fis8 e fis8 a gis4
}

altoe = \relative e' {
            gis4
  gis8 dis e4 e dis8 fis
  gis4 gis8 a e8 fis a4
  gis8 e b'4 ais4 gis4~
  gis4 fis4 fis4 e4
}

tenora = \relative c' {
  gis2 cis4 b4
  dis2 cis8 fis e4
  b8 a gis8 b dis e dis4
  e4. e16 dis dis8 b8 b4
}

tenorb = \relative c' {
  dis4 b4~ b8 cis cis4
  fis4 e4 gis4 cis,8 cis
  fis8 e dis8 cis b4 fis4
  gis4. b8 ais4 b4
}

tenorc = \relative c' {
  b8 gis dis'4 e4 fis8 e
  dis4 e8 cis b cis dis4
  cis4 cis b2
  e8 d cis4 b2
}

tenord = \relative c' {
  b4 gis4 cis4 cis8 dis
  e4 e4 d4 d8 d
  b4 b4 e8 d cis4
  d8 cis b4 e4. e8
  cis4 dis e
}

tenore = \relative c' {
            e4
  dis4 cis8 dis cis4 b4
  b4 b8 fis gis4 cis4
  b4 fis'4 fis8 e dis4
  e4 cis4 dis4 b4
}

bassa = \relative g {
  % in quarter notes original phrase (from the Piston Harmony text)
  % I VI IV I  V III VI IV  I I V III  VI IV V I
  e8 dis cis b a4 e'
  b8 a gis4 cis8 b a4
  e'4 e, b'8 a gis4
  cis8 b a4 b4 e,4
}

bassb = \relative c {
  b4 e8 fis gis4 fis8 e
  dis4 e8 dis cis4 fis
  dis4 gis e fis
  cis8 dis e4 fis8 fis b,4
}

bassc = \relative c {
  e4 b8 cis a8 gis fis4
  gis8 fis e4 b' b
  cis8 b a4 gis8 a b4
  e,4 fis8 gis b a gis4
}

bassd = \relative a, {
  e4 e' a8 gis fis4
  e8 d cis4 d8 cis b4
  e8 fis gis8 e cis4 fis8 d
  b4 e8 cis a4 e'4
  fis4 b, e
}

basse = \relative a, {
            e4
  gis8 b cis8 b a4 b8 b
  e,4 e'4 cis8 b a4
  e'4 b4 fis'4 gis4
  e4 fis4 \relative c { b4 e4 }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

msop = \new Voice {
  \tempoandetc 
  \sopa
  \sopb
  \sopc
  \sopd
  \sope
}

malto = \new Voice {
  \tempoandetc 
  \altoa
  \altob
  \altoc
  \altod
  \altoe
}

mtenor = {
  \tempoandetc 
  \tenora
  \tenorb
  \tenorc
  \tenord
  \tenore
}

mbass = {
  \tempoandetc 
  \bassa
  \bassb
  \bassc
  \bassd
  \basse
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SCORE

ssop = {
  \tempoandetc 
  \sopa
  \sopb
  \sopc
  \sopd
  \sope
  \bar "|."
}

salto = {
  \tempoandetc 
  \altoa
  \altob
  \altoc
  \altod
  \altoe
  \bar "|."
}

stenor = {
  \tempoandetc 
  \tenora
  \tenorb
  \tenorc
  \tenord
  \tenore
  \bar "|."
}

sbass = {
  \tempoandetc 
  \bassa
  \bassb
  \bassc
  \bassd
  \basse
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
}
\score {
  \thescore
  \layout { #(layout-set-staff-size 18) }
}
\score {
  \articulate { \themidi }
  \midi { }
}

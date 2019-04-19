% LilyPond engraving system - http://www.lilypond.org/

\version "2.18.2"
\include "articulate.ly"

\header {
  title       = "Earth"
  composer    = "Jeremy Mates"
  subsubtitle = "2019-04-18"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2019 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

keytempoetc = {
  \key c \major
  \time 4/4
  \tempo 4=120
  \accidentalStyle "neo-modern"
}

uppera = \relative c {
  \partial 2.
  s2.
  s1

  \repeat volta 7 {
    s1*3
    \cadenzaOn
    s8 s2.
  }
  \cadenzaOff

  s1
  s8 s2.

  s1*32

  \cadenzaOn
  s2

  \clef "bass_8"
  \relative c, {
    b1\fff
  }
  \cadenzaOff
  s1

  \repeat volta 7 {
    s1*3
    \cadenzaOn
    s8 s2.
  }
  \cadenzaOff

  s1
  s8 s2.
}

lowera = {
  \clef "bass_8"
  % TODO probably should instead count them out and number them manually
  \override Score.BarNumber.break-visibility = #all-invisible
  % TODO really want lilypond to not jam the dynamics ontopofoneanother
  \override DynamicLineSpanner.staff-padding = #3
  \relative c, {
    \partial 2.
    <ais cis f>4\ff q\mf <d ges b>
    <bes f'>\mp <a e' cis'> q\p <bes f'>\mp

    \repeat volta 7 {              \mark "7x"
      b8 <d f bes>4\ppp <cis f bes>^\pp <d ges b> <ees ges b>8~
      q8 <d f ais>4 <ees ges b>\ppp <b fis'> <b d fis>8~\f
      q8 <ais cis f>4\ff q\mf <d fis b> <bes f'>8~\f
      \cadenzaOn
      q8 <a e' cis'>4\mp q\p <bes f'>\mp
    }
    \cadenzaOff

    b8 <d f bes>4\ppp <cis f bes>^\pp <d ges b> <ees ges b>8~
    \cadenzaOn
    q8 <d f ais>4 <ees ges b>\ppp <b fis'>
    \cadenzaOff
    \bar "||"
  }

  <bes,, f,>1\mf
  b,,1\pp
  <des, f, bes,>8
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  \cadenzaOn
  <ees, ges, b,>8\pp
  \bar "|"

  b,,1
  \bar "|"
  \cadenzaOff
  <des, f, bes,>8
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  \cadenzaOn
  <ees, ges, b,>8\pp
  \bar "|"

  b,,1
  \bar "|"
  \cadenzaOff
  <des, f, bes,>8
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <ees, ges, b,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  \cadenzaOn
  <ees, ges, b,>8\pp
  \bar "|"

  b,,1
  \bar "|"
  \cadenzaOff
  <des, f, bes,>8
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <ees, ges, b,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <ees, ges, b,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  \cadenzaOn
  <ees, ges, b,>8\pp
  \bar "|"

  b,,1
  \bar "|"
  \cadenzaOff
  <des, f, bes,>8
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  \cadenzaOn
  <ees, ges, b,>8\pp
  \bar "|"

  b,,1
  \bar "|"
  \cadenzaOff
  <des, f, bes,>8
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <ees, ges, b,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <ees, ges, b,>8\mf
  \cadenzaOn
  <ees, ges, b,>8^\pp
  \bar "|"

  b,,1
  \bar "|"
  \cadenzaOff
  <des, f, bes,>8
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <ees, ges, b,>8\mf
  \cadenzaOn
  <ees, ges, b,>8^\pp
  \bar "|"

  b,,1
  \bar "|"
  \cadenzaOff
  <des, f, bes,>8
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <ees, ges, b,>8\mf
  \cadenzaOn
  <ees, ges, b,>8^\pp
  \bar "|"

  b,,1
  \bar "|"
  \cadenzaOff
  <des, f, bes,>8
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <d, f, bes,>8\mf
  <b,, ges,>8^\pp
  <ges, b,>8\f
  <des, f, bes,>8\pp
  c,8
  <d, f, bes,>8\mp
  c,8^\ppp
  <ees, ges, b,>8\mf
  \cadenzaOn
  <ees, ges, b,>8\pp
  \bar "||"

  \relative c, {
    r4 <ais cis f>\ff q\mf <d ges b>
    \bar "|"
    \cadenzaOff
    <bes f'>\mp <a e' cis'> q\p <bes f'>\mp

    \repeat volta 7 {              \mark "7x"
      b8 <d f bes>4\ppp <cis f bes>^\pp <d ges b> <ees ges b>8~
      q8 <d f ais>4 <ees ges b>\ppp <b fis'> <b d fis>8~\f
      q8 <ais cis f>4\ff q\mf <d fis b> <bes f'>8~\f
      \cadenzaOn
      q8 <a e' cis'>4\mp q\p <bes f'>\mp
    }
    \cadenzaOff

    b8 <d f bes>4\ppp <cis f bes>^\pp <d ges b> <ees ges b>8~
    \cadenzaOn
    %q8 <d f ais>4 <ees ges b>\ppp <b fis'>
    q8 <d f ais>4 <ees ges b>\ppp <b fis'>
    \cadenzaOff
  }
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

\book {
  \score {
    \new PianoStaff = "piano" <<
      <<
        \new Staff = "upper" << \scoreupper >>
        \new Staff = "lower" << \scorelower >>
      >>
    >>
    \layout { }
  }
}

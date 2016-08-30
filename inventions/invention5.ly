%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version "2.18.2"
\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

\header {
  title       = "Invention No. 5"
  composer    = "Jeremy Mates"
  subsubtitle = "2016-08-30"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = { \tempo 4=96 }

keytempoetc = {
  \key c \minor
  \time 4/4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Music

sopa = \relative c'' {
  R1
  r2 r4 r16 g16( a bes
  c8 a8.) r16 ees'8-. d16( c d8) a-. f-.
  c'( bes16 a bes4) aes8( g aes bes

  c8) ees, bes'8( c d8) g, c4(
  bes4 aes8 g16 f ees4) c8-. f
  r16 c'( d ees f8 d8.) r16 bes8-. a16( g a8)
  d8-. bes-. f'-. e16( d e8) c g'( f16 e)

  f8-. d-. bes ees16( d c d aes bes c bes aes c
  d8.) d16( c16 bes aes bes c4) bes8( aes
  g8 f) aes( c16 d c bes aes g aes8) d,
  ees16( f16 g aes g4) f8-. ees-. d4

  ees4 r16 aes16( bes c des8 bes8.) r16 f'8-.
  ees16( des ees8) bes8-. g-. des'( c16 bes) c4(
  bes4) c des8 g,8 des ees8
  r8 f'8 ees( f8) des( c4) bes8(

  aes16 bes c8) r16 c16( d ees f8 d8.) r16 aes'8-.
  g16( f g8) d8 bes f'( ees16 d ees8) g,-.
  bes16( aes bes c des8 ees f4) ees(
  des8 c) des ees c f, bes8( d16 ees

  f8.) des16( c8 ees8.) r16 aes,8-. bes16( c bes8)
  ees8-. g-. c,8( d16 ees d4) r16 c16( bes aes
  g8 bes8.) r16 ees8-. f16( g f8) bes,8-. d-.
  g,( aes16 bes aes4--) r2
}

altoa = \relative c' {
  r16 c16( d ees f8 d8.) r16 aes'8-. g16( f g8)
  d8-. bes-. f'( ees16 d ees4 d)
  ees4 f g16( a bes8 c) d,
  ees8-. d-. g-. ees-. r16 c16( d ees f8 d8)~

  d16 r16 aes'8-. g16( f g8) d-. bes-. f'( ees16 d
  ees4) d r16 g16( a bes c8) a16( g
  a8 g f) r16 d16( ees f g8 f) c'8
  g4( f16 g a8) g-. a-. bes16( a g8

  f4 g) r16 g16( f ees d8 f8~)
  f16 r16 b,8-. c16( d c8) f-. aes-. d,( ees16 f
  ees4) \clef bass r16 d16( c bes aes8 c8.) r16 f,8-.
  g16( aes g8) bes-. ees,-. f4 aes

  g4. r8 r2
  R1 \clef treble
  r16 ees'16( f g aes8 f8.) r16 c'8-. bes16( aes bes8)
  f8-. des-. aes'( g16 f g8 aes g4)

  f8-. ees-. g8( f16 ees d8) f8 g( f16 ees)
  bes'16( aes g8 f) d8( aes') f( ees4)
  % TODO troublesome 19th measure
  r16 f16( g aes bes8 g8.) r16 des'8-. c16( bes c8)
  g8-. ees-. bes'( aes16 g aes4) g8-. f-.

  aes8( bes) aes-. g-. f8. r16 g8( ees16 d
  c8) bes'( aes g) f-. aes-. g( f
  ees4 d c8 d) g8( f)
  ees8-. d-. c4-- r2
}

midiupper = {
  \normtempo
  << {
    \sopa
  } {
    \altoa
  } >>
}

scoreupper = {
  \accidentalStyle "neo-modern"
  \keytempoetc
  \sopa
  \bar "|."
}
scorelower = {
  \accidentalStyle "neo-modern"
  \keytempoetc
  \altoa
  \bar "|."
}

\book {
% \paper {
%   #(set-paper-size "letter")
% }
  \score {
    \new PianoStaff = "PianoStaff_pf" <<
      <<
        \new Staff = "Staff_pfUpper" << \scoreupper >>
        \new Staff = "Staff_pfLower" << \scorelower >>
      >>
    >>
    \layout { }
  }
  \score {
    \unfoldRepeats \articulate {
      \new Staff = "midi" <<
        \set Score.midiChannelMapping = #'instrument
        \midiupper
      >>
    }
    \midi { }
  }
%  \markuplist { \paragraph { \with-color #grey \teeny {
%This work is licensed under the Creative Commons Attribution 3.0 United
%States License. To view a copy of this license, visit
%http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
%Creative Commons, 171 Second Street, Suite 300, San Francisco,
%California, 94105, USA.
%} } }
}

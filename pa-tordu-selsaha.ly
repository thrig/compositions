% LilyPond engraving system - http://www.lilypond.org/

\version "2.18.2"

\header {
  dedication = \markup { \italic "tu'e pa tordu selsa'a sera'a pa clani namcu .i" }
  copyright = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2021 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

\book {
\score {
  \new Staff <<
    \set Score.tempoHideNote = ##t
    \time 2/4
    \tempo 4=120
    \relative c' {
      c4 c8 c  g'4 g  a a(   g2)
      f4( f) e c d d( c2)

      c4 c8 c g' g g4 a a g2
      f4( f) e c d d( c2)

      g'4 g f( f e e) d2
      g4( g) f( f) e( e) d2

      c4 c8( c g'4) g a( a) g2
      f4 f e c d d c2
      \bar "|."
    }
    \addlyrics { \override LyricText.font-shape = #'italic
      li ci pi pa  vo re namcu
      gi'e na du li fi'u

      ".i" li ci pi pa vo pa mu so
      lo'o na du li te'o

      ".i" lo nabypalne cu
      mutce kukte cidja xu

      ".i" ta'onai li ji'i ci
      pi pa vo re du li pai
    }
  >>
  \layout { }
% \midi { }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SPOLIERS

\markuplist { \wordwrap-lines {
\italic { .i ta'o pa glibau ku te fanva dei fu zoi .kuot. }
A short song about a long number.
3.142 is a number; it is not the golden ratio.
3.14159 is not the exponential \concat { \italic e . }
Platter bread is very tasty food, no?
Anyways, the number that is approximately 3.142 is \concat { \char ##x03C0 . }
By the way, an English translation of this utterance is \concat { \char ##x201C "this utterance" \char ##x201D }
\italic { .kuot. tu'u ".i" mi sanga lo'u pai le'u gi'e sisti .ai
} } }
}

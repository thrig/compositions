% LilyPond engraving system - http://www.lilypond.org/
%
% XXX 2nd phrase still perhaps needs some adjustments; can either repeat to
% measure two afterwards, or go directly to new 3rd phrase.

\version "2.14.0"

\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

\header {
  title       = "Motet No.1 - DRAFT"
  subtitle    = "(with a particular English folk song in mind)"
  composer    = "Jeremy Mates"
  subsubtitle = "2012-??-??"
  copyright   = "© 2012 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

tempoAndStuff = {
  \key d \dorian
  \time 3/4
  \tempo "Reflectively" 4=96
}

altoa = \relative d' {
  d4( f2 
  g4  e2) 
  a4( c4. b8
  a4  b2)			|

  b4( d4. c8
  b4 a4. b8
  g4 a2~
 \set Score.tempoHideNote = ##t
 \tempo 4=84
  a2)
 \tempo 4=96
}

altob = \relative d' {
  d4(				|

  f2 g4
  e2) a4(
  c4. b8 a4)
  b4.( a8 g4			|

  a2.)
  a8 a d4.( c8
  b8 a g e f g
  f2.		|

 \set Score.tempoHideNote = ##t
  e4 \tempo 4=84 f2) \tempo 4=96
}

altoc = \relative g' {
  R2.
}

tenora = \relative c' {
  r4 r a4~(
  a4 b c~ 
  c8 b a g a g
  f8 e g4 d--)		|

  b'8( a b4 g8 a
  g4 f4~f16. r32 a8~
  a2.)~
  a2~
}

tenorb = \relative a {
  a4

  r4 a( c~
  c4 d c8 b
  a4 a c
  d4 b) e8( d		|

  c4 b a~
  a4 b4. c8
  d4 d d~
  d4 d2		|

  cis4 d2)
}

tenorc = \relative c' {
  R2.
}

bassa = \relative c {
  r4 d2(
  c4 b a8 g
  f g a2~
  a2) r4		| 

  g'4( g e)
  d8( e8 c d e4)
  cis4( d2)~
  d2~
}

bassb = \relative c {
  d4

  d2( e4
  g2 f4
  e2.
  d2.

  f2.~
  f4 g4 a
  g2.
  a2.)

  a4( d,2)
}

bassc = \relative d {
  R2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alto = {
  \tempoAndStuff
  \altoa
  \altob
% \altoc
  \bar "||"
}

tenor = {
  \tempoAndStuff
  \tenora
  \tenorb
% \tenorc
  \bar "||"
}

bass = {
  \tempoAndStuff
  \bassa
  \bassb
% \bassc
  \bar "||"
}

themusic = {
  <<
    \new PianoStaff <<
      \new Staff <<
        \clef treble
        \new Voice = "alto" \alto
      >>
      \new Staff <<
        \clef bass
        \set Staff.printPartCombineTexts = ##f
        \partcombine
        << \tenor >>
        << \bass  >>
      >>
    >>
  >>
}

\score {
  \themusic
  \layout { }
}
\score {
  \unfoldRepeats \articulate { \themusic }
  \midi { }
}

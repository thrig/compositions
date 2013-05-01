% LilyPond engraving system - http://www.lilypond.org/
%
% So I'm not sure about the range of Organ pedals; [Niland 1968] says
% they might span CCC to D or F or G, but on another page shows some
% Bach that goes above D or F or G... might need to transpose things
% down, depending. Hence the ambitus for the pedal and left hand lines.
%
% Niland, Austin. Introduction to the Organ. London: Faber, 1968.

\version "2.16.0"
\include "articulate.ly"
\header {
  title       = "A Minor Organ Work"
  subsubtitle = "2013-04-30"
  composer    = "Jeremy Mates"
  meter       = \markup { \fontsize #2.5 "Tempo Semplice" }
  copyright   = \markup { \teeny { "© 2013 Jeremy Mates - Creative Commons Attribution 3.0 United States License" } }
  tagline     = #f
}

tempoandetc = {
  \accidentalStyle "piano"      % PORTABILITY comment out if lilypond < 2.16

  \time 4/4
  \set Score.tempoHideNote = ##t
  \tempo 4=52
}

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

sopa = \relative e'' {
  % KLUGE see partial in setup section below

  ees4( ees d f
  g2 g
  f2 ees
  d4 d d4 d

  d4 ees ees d4
  c1--)
  c4( d e e
  e4 d c2~

  c2.) b4
  c4( d) b( c)
  c4 b2 b4~
  b4 b( a g)

  c2. b4(
  a4 b2) g4
  a2 a4 b
  d4( c b) fis'(

  g2 a
  b2 a
  g2 fis4) fis
  g4 g e e

  e4 e e ees
  ees4 ees ees ees
  ees4 ees ees ees
  ees4 d d d

  d4 c c c
  c4 b b b
  b4 b b4 b
  b4 a a a(

  b4 cis d d
  d4 d cis2
  d2 c
  bes2) bes                                            \break % m.32

  bes4 bes bes( cis4)
  cis4 d a bes
  c4 d e e
  e4 d d c4~

  c2 c4 c4~(
  c4 d b b
  a4 a g g~
  g4 a b cis

  d4) d d d
  e4 e e e
  fis4 fis fis2(
  g1

  a1
  b1
}

soph = \relative c''' {
  c2~( c4 bes~
  bes4 aes2 g4~

  g4 f2 ees4~
  ees4 d2 c4~
  c4) ees2( f4
  g2 g

  aes4 g) c( bes
  aes2 g4 f
  d4 g f ees
  d2. c4~
}

sopi = \relative c'' {
  c2) d4( ees
  d4 c d2
  d4 c c c4~
  c4 c bes2

  aes4 g) c4 d~
  d4 d \tempo 4=51 ees( d
  c4) \tempo 4=50 f( ees d)
  ees2~
    \tempo 4=38
    % KLUGE otherwise fermata too close to the note
    \once \override Script #'Y-extent = #'(-1.0 . 1.0)
    ees2\shortfermata
}

altoa = \relative f' {
  % KLUGE see partial in setup section below

  g2 g4( aes4
  bes4) bes bes( c)
  aes4( bes) g( aes
  f4) f aes aes(

  g2 g4 g
  g4 f2 e4)
  a4 g2.~
  g4 f e e

  e4 a( g2
  a4) a g g
  a4 a fis2
  g2 fis4 e~

  e4 e e d
  e4 f e2~
  e4 e fis( g
  g4 a g b

  b4 e2 d4~
  d4 e) e d4
  d4 c2 c4
  b4 b b4 a

  g4 fis fis fis
  fis4 fis fis g
  g4 aes aes aes
  aes4 aes aes g

  g4 g g f
  f4 f f g
  g4 g g a
  g4 g g f

  f4 g f a
  bes4 bes a2~
  a4 g g f4
  f4 e2 e4

  e4 g4 g2~
  g4 f f g4
  a4 b c g
  g4 g f e

  e4 f g fis
  fis( fis fis4 e
  e4 d2.
  cis2 d4 e

  fis2) g4 g
  g4 g g2
  a4 a a4 a
  b4( cis d e)

  cis4( d e fis)
  d4( e fis g)
}

altoh = \relative g'' {
  g2( f
  ees2 d

  c4 c d2
  c4 g2.~
  g2.--) aes4
  bes4 bes2-- c4

  c b c2~
  c4 c bes4 aes4
  bes2 aes4 g
  aes2 g4 g
}

altoi = \relative g' {
  g2 g
  aes4 aes4 bes aes
  g4 g g4 f
  aes4 g2 g4

  f2 g4 f
  b4 g2 f4
  ees4 aes g g
  g2 g
}

tenora = \relative c' {
  \partial 2. r2 r4

  c4 c d c
  d4 d2 c4
  c4 bes bes aes4
  aes4 aes aes2(

  b4 c) g g
  g4 g g a
  a4 b c c
  c4 c2 c4

  c2 e--
  e4( fis) d( e)
  c4( dis2) dis4(
  e4) b c b

  a1
  a4 a g4 b
  c2. d4
  b4 c d d

  d4 b c d
  b4 g a b
  d4 e d2~
  d4 d d c4

  b4 a a a
  a4 aes aes g
  g4 g g f'
  f4 f f ees

  ees4 ees ees d
  d4 d d d
  d4 e e fis
  e4 c c c4

  b4 bes a f'
  f4 g e e
  d4( bes c a)
  bes4 g g bes

  bes4 bes4 bes2
  a4 d2.
  e2 e
  c4 b2 a4~

  a4 a g4 a~
  a2 d4 g,
  c4 fis, b2
  a4 a2.

  b4 b g2
  g4 g cis cis
  cis2 b4 d
  d2 d4 d

  cis2 cis
  fis2 fis
}

tenorh = \relative e' {
  e2 a,4 bes
  g'4 aes f f

  ees4 aes aes g(
  ees4 d2 c4~
  c4 c2 c4)
  d2.-- c4

  f2 g
  ees4 f g c,
  g'4 d2 c4~
  c4 d b2
}

tenori = \relative e' {
  ees2 d4 c
  c2 f4 f
  ees4 ees ees4 d~
  d4 ees4 d c~

  c4 b ees4 d
  f4 b, c2
  c4 d c b
  c2 c
}

pedala = \relative c {
  \partial 2. c4 c c

  c4 g' bes aes
  g2 f4 ees(
  f4) d( ees) c(
  d4) d d f(

  g4) c,2 b4
  c2 b4 c~
  c4 b a a
  a2 a4 e'

  g4 fis e2--
  a4 d,( g) c,(
  fis4) b, b fis'
  e2 dis4 e4

  a2 a,4( b
  c4 d e2)
  a4 a dis, g~
  g4 a b2

  e,2 a,4 fis
  g4 c2 b4~
  b4 c d d
  g4 g g a,4

  b4 c c c
  c4 c c c
  c4 c c c
  c4 bes bes bes

  bes4 aes aes aes
  aes4 g'2 f4
  f4 e2 dis4
  e4 a2 d,4

  d4 e d2
  g4 e a g
  f4( g) e( f)
  d4( e) e e

  g4 g g a
  a4 d, f e~
  e4 d c b
  a2. a'4

  g4 f e ees~
  ees4 d g, c
  fis,4 b e, e'
  a4 d, b2~

  b4 b b b
  cis2 cis4 cis
  d4 d d d
  e4 e e e

  fis4 fis fis fis
  b,4 b b b
}

pedalh = \relative e {
  e2 f4 d
  ees4 c d ees

  ees4 f d g(
  c,4) b g c~
  c2 g'4( aes
  g2) f4 ees(

  f4 g) ees2
  c4( d ees f
  g2) d4 ees
  f2 g(
}

pedali = \relative c' {
  c,4) g b c
  f2 bes,4 d
  ees2 aes,
  d2 g4 ees

  f4 d( ees f
  g2) c,4 f
  g4 d ees g
  c,4 <c g>4 <c, c'>2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% (almost) No music below here

sop = {
  \sopa
  \soph
  \sopi
}

alto = {
  \altoa
  \altoh
  \altoi
}

tenor = \new Voice
% \with { \consists "Ambitus_engraver" }
{
  \clef alto
  \tempoandetc

  \tenora
  \tenorh
  \tenori

  \cadenzaOn \textLengthOn
  \bar "|."
}

pedal = {
  \clef bass
  \tempoandetc

  \pedala
  \pedalh
  \pedali

  \bar "|."
}

upper = {
  \clef treble
  \tempoandetc

  % KLUGE workaround partcombine not showing rest above g
  \partial 2.
    r2
    << { \relative f'' { f4\rest } } \\ { \relative g' { g4-- } } >>

  \set Staff.printPartCombineTexts = ##f
  \partcombine
  << \sop   >>
  << \alto  >>

  \bar "|."
}

themusic = {
  <<
    \set Score.midiChannelMapping = #'staff
    \new PianoStaff <<
      % This selects the Flute pipes of jeux_d_orgues2.sf2 - however,
      % Baroque Plenum (reeds) also works, depending, so probably leave
      % pipe selection up to the organist.
      \set PianoStaff.midiInstrument = #"electric piano 2"
      \new Staff = "upper" \upper
      \new Staff = "lower" \tenor
    >>
    \new Staff
%     \with { \consists "Ambitus_engraver" }
    <<
      \set Staff.midiInstrument = #"electric piano 2"
      \clef bass
      \pedal
    >>
  >>
}

\book {
  \paper {
    ragged-last-bottom = ##f
  }
  \score {
    \themusic
    \layout { }
  }
  \score {
    % So this is annoying for default timidity playback, but not if add
    % in the ambience a church or other large, organ infested space a
    % proper organ would be blessed with. However, I have played around
    % with the phrasing to try to make it both logical and legato given
    % the shortened notes articulation creates.
    \articulate
      \themusic
    \midi { }
  }
  \markuplist { \paragraph {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
} }
}

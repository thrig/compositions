%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version "2.18.0"
\include "articulate.ly"

\header {
  title       = "Menuet, also in E Minor"
  subsubtitle = "2016-05-15"
  composer    = "Jeremy Mates"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

keytempoetc = {
  \accidentalStyle "modern"
  \tempo 4=168
  \time 4/4
  \key e \minor
}

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

topvoicea = {
  \partial 4 r4
}

topvoiceb = \relative d'' {
  r4 \acciaccatura { e16 fis } g4 r8 d8 c4
  b4 c e b8 a
  g4 c d b
  g4 r8 a8 b r8 g4-.

  d'4-. r8 fis,8 g a b cis
  d8 c b a g4 d'8 c
  b8 fis' e d c4 d8 c
  b8 a g g a r8 fis4-.

  g'8 fis e4-! fis8 g d a
  b8 cis d c b a r8 b8\mordent
  cis d e d cis b r8 fis8\mordent
  g4 b c8.\mordent r16 a8.\mordent r16

  e'2\mordent d8 c b a
  b2 cis8 b a g
  d'4. a8 g fis e4\mordent
}

topvoicec = \relative d' {
  \cadenzaOn
  d4\mordent r4
  \bar "|"
  \cadenzaOff
}

topvoiced = \relative d' {
  d4\mordent fis\mordent e8 fis g4
}

topvoicee = \relative d' {
  fis8 e d cis d r8 r4

  d4-! a'-! fis8 g a4
  fis8 e d4 e a-.
  g8 fis cis4 e fis
  e4 d r4 a'4-!

  fis4-! r4 a4-! d,8 e
  fis4 r4 e4 fis
  g8 r8 a4 e r4
  cis4 d\mordent r2

  r4 a'4-! fis-! r4
  r4 <b d>4-. r4 <fis d'>4
  <a d>4 <g d'>-. r4 a8 g
  a4 fis g r4
}

bottomvoicea = \relative f' {
  \partial 4 e4-!
}

bottomvoiceb = \relative f' {
  g4-! r8 b,8 c d e fis
  g8 f e d c4 g'8 fis
  e8 b' a g fis4 g8 fis
  e8 d c-. c-. d r8 b4-.

  \clef bass

  r4 \acciaccatura { b16 c } d4 r8 a8 g4
  fis4 g b fis8 e
  d4 g a fis
  b4 b8 cis d r8 d4-.

  e8 d c4-. d8 c b4-.
  e,4-. a-. c-. g-!
  fis4-. b-. d-. a-.
  b8 a g4-. a8 g fis4-.

  e8 g fis a b2\mordent
  d8 c b a a2\mordent
  b8 c g a e fis g a
}

bottomvoicec = \relative c' {
  \cadenzaOn
  b4 e-!
  \bar "|"
  \cadenzaOff
}

bottomvoiced = \relative c' {
  b4 a g fis8 g
}

bottomvoicee = \relative c' {
  a4 e8 g4 r8 d4-!

  fis4-! r4 a4-! d,8 e
  fis4 r4 e4 fis
  g8 r8 a4 e r4
  cis4 d\mordent r2

  d4-! a'-! fis8 g a4
  fis8 e d4 e a-.
  g8 fis cis4 e fis
  e4 d r4 g4-!

  b4-! r2 fis4-!
  a4-. <g b>-. r4 <a c>4
  <fis c'>4 <g b>-. r4 fis4-.
  d4-! <a' c> <g d'>-. r4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

topvoicemidi = {
  \topvoicea
  \repeat unfold 2 { \topvoiceb }
  \alternative {
    { \topvoicec }
    { \topvoiced }
  }
  \topvoicee
}
bottomvoicemidi = {
  \bottomvoicea
  \repeat unfold 2 { \bottomvoiceb }
  \alternative {
    { \bottomvoicec }
    { \bottomvoiced }
  }
  \bottomvoicee
}

themusic = {
  <<
    \set Score.midiChannelMapping = #'instrument
    \keytempoetc
    \new Staff <<
      \set Staff.midiInstrument = #"harpsichord"
      \topvoicemidi
    >>
    \new Staff <<
      \set Staff.midiInstrument = #"harpsichord"
      \bottomvoicemidi 
    >>
  >>
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Score

topvoicescore = {
  \clef treble
  \keytempoetc
  \topvoicea
  \repeat volta 2 {
    \topvoiceb
  }
  \alternative {
    { \topvoicec }
    { \topvoiced }
  }
  \topvoicee
  \bar "|."
}
bottomvoicescore = {
  \keytempoetc
  \bottomvoicea
  \repeat volta 2 {
    \bottomvoiceb
  }
  \alternative {
    { \bottomvoicec }
    { \bottomvoiced }
  }
  \bottomvoicee
  \bar "|."
}

theblackdots = {
  <<
    \new PianoStaff <<
      \new Staff << \topvoicescore >>
      \new Staff << \bottomvoicescore >>
    >>
  >>
}

\score {
  \theblackdots
}
\score {
  \unfoldRepeats \articulate { \themusic }
  \midi { }
}
\markuplist { \paragraph { \with-color #grey \tiny {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105.
} } }

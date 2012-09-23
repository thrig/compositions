% LilyPond engraving system - http://www.lilypond.org/
%
% The first phrase was derived from noodling about on the Piano (perhaps
% related to efforts learning WtK Fugue 1), and subsequent phrases from
% development of that phrase. Trills and rhythmic variety probably a
% reaction to my trill-free (fanfare1) and rhythmically bland (menuet3)
% prior works.

\version "2.16.0"

\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

\header {
  title       = "Invention No. 2"
  subsubtitle = "2012-03-22"
  composer    = "Jeremy Mates"
  copyright   = "© 2012 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

firstBitUpper = \relative c' {
  r4. c4~\mf c32 d e f
  g8 d g f e a
  a16^\markup { \italic "tr" } g32 a \times 4/5 { g a g a g } f8 g f e
  d16 e f g e g a g  c64^\markup { \italic "mord." } b c32 b16 a g |

  c8 b c e, a gis
  a8^\markup { \italic "tr" } gis32\p a gis a gis a gis a gis a gis a gis a gis a gis a gis a
  \key g \major
  g8\mf b a g fis g
  d8 g fis e a g |
}

secondBitUpper = \relative g' {
  \times 4/5 { a32^\markup { \italic "tr" } g a g a } g8 fis8 g fis e |
  c'4 b8 a d b
  \key d \major
  cis4 d64^\markup { \italic "mord." } cis d32~ d4..
  d,4~ d32 e fis g a8 e a |

  g8 fis e d cis a'
  g8 fis e g a b
  \times 4/5 { a32^\markup { \italic "tr" } g a g a } g8  fis8 g fis e
  b'8 a b d-. fis-. b-. |
}

thirdBitUpper = \relative b' {
  b4 a b4
  d,4 g fis
  \times 2/3 { g32^\markup { \italic "mord." } fis g~ } g8. cis,4 fis
  e4 \times 2/3 { fis32^\markup { \italic "mord." } e fis~ } fis8 r16  b,8-. cis-. |

  d8-. fis-. g-| b-| d-. cis-.
  b16 cis d e  fis b, a g  fis d e fis
  g16 a fis e  d cis b b'  a b cis d
  e16 d cis b  fis g a b  a g fis g |

  fis16 e d e  d cis b cis  b8 r
  d'8 g e d cis d-.
  d8 cis a d b a
  g8 fis-> r2 |
}

fourthBitUpper = \relative g' {
  \key g \major
  r4. g4~ g32 a b c
  d8 a d c b e
  e16^\markup { \italic "tr" } d32 e \times 4/5 { d e d e d } c8 d c b
  d8 e16 fis g fis g c, d e f e |

  \key c \major

  f16 c f e d g c,4~ c32 d e f |
  g8 d g f e a
  a16^\markup { \italic "tr" } g32 a \times 4/5 { g a g a g } f8 g f e |
  d8 e f g e f

  g8 a e a f b
  <e, g c>4-. r r |
}

firstBitLower = \relative c {
  R2.
  R2.
  r4. c4~\mf c32 d e f
  g8 d g f e a

  \times 4/5 { a32^\markup { \italic "tr" } g a g a } g8  f8 g f e |
  d16 e fis gis a e a gis fis e' d c
  \key g \major
  b8 b,16 c  d e b e  d c' b a
  g16 fis g e  d fis a g  fis a b c |
}

secondBitLower = \relative d' {
  d4 a d
  \times 2/3 { c32^\markup { \italic "mord." } b c~ } c8. d4 d,8 e |
  \key d \major
  fis8 g a e a g
  fis8 b e, a g16 fis e d

  e16 fis g a  g e fis b,  cis d e cis
  d16 e fis g  a8 e a g
  fis8 e   b16 cis d e fis cis fis e
  d16 e d cis  b b' a g  a g fis e |
}

thirdBitLower = \relative d {
  d16 e fis g  fis g a b    b, cis b a
  b16 cis d e  cis d e fis  d e fis g
  cis,16 d cis b  e d cis d  a d b d
  g,16 b d e  d e fis g  d g fis e

  b'16 a g fis  b8-| fis-| e16 fis g a
  b8-. r a-. r b-. r
  d,8-. r g-. r fis-. r
  g8-. r cis,-. r fis-. r |

  e8-. r fis-. r b,8 cis
  d16 e fis g a8 e a g
  a16 g fis e fis8 g16 a g b a b
  c16 d a8 d c b e |
}

fourthBitLower = \relative e' {
  \key g \major
  \clef treble
  e16^\markup { \italic "tr" } d32 e \times 4/5 { d e d e d } c8 d c b
  a16 b c d b d e d g fis e d
  c8 d e fis g d
  g8 fis e c b c

  \key c \major
  g8 a b c g' f
  e8 f16 g e g a g c b a g
  c8 b c e, a gis
  a8 c, f e c d

  \relative c' {
    e8 d c b a g
    <c, c'>4-. r r |
  }
}

upper = {
  \clef treble
  \time 6/8
  \tempo \markup {
    "Andante moderato con moto" \with-color #(x11-color 'grey55) \teeny { "(" \general-align #Y #DOWN \note #"4" #1
    = "76-96 )" }
  }
% for MIDI playback (emits spurious warnings)
  \set Score.tempoHideNote = ##t
  \tempo 4=88

  \firstBitUpper
  \secondBitUpper
  \thirdBitUpper
  \fourthBitUpper

  \bar "|."
}

lower = {
  \clef bass

  \firstBitLower
  \secondBitLower
  \thirdBitLower
  \fourthBitLower

  \bar "|."
}

theMusic = {
  \new PianoStaff <<
    \set PianoStaff.connectArpeggios = ##t
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
}

\book {
  \paper {
   % #(set-paper-size "arch a")
  }
  \score {
    \theMusic
    \layout { }
  }
  \score {
    \unfoldRepeats \articulate {
      \set Score.midiChannelMapping = #'voice
      \theMusic
    }
    \midi { }
  }
  \markuplist { \paragraph {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105.
} }
}

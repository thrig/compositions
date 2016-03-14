%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/

\version "2.18.0"
\include "articulate.ly"

\header {
  title       = "Fugue No. 2.0.1"
  subsubtitle = "2016-03-14"
  composer    = "Jeremy Mates"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

keytempoetc = {
  \accidentalStyle "modern"
  \tempo "Moderate yet lively" 4=86
  \time 4/4
  \key bes \major
}

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

topvoice = \relative d'' {
  r4 d8\mf bes16( a bes16)-- r16  d8( ees8) c16( b
  c16) r16 e8 f16( g f ees) d8-. f-. c-. f-.
  d8-. bes-. f' c-. d( f16)-- r16 g16( f e d e8) d16 f
  e8-. g-. f16( e f) d( e f g) e(

  f16 g) a8-. f-. r d( f g a)
  f8-. g-. f-. a-. bes8. r16 f8. r16
  bes,8. r16 r8 ees8 r4 r8 d8
  r4 r8 c8-. r8 d8-. r8 e8-.

  f4\f r4 r2
  R1
  e8-- c16( b c)-- r16 e8( f8) d16( c? d) r16 fis8
  g16( a g f) e8-. g-. d-. g-. e16( d c8)

  d4 f, d'( c8 e~)
  e8( d16 c b a b8) c( b16 a g f g) r
  g4(\mp a) b8-. a-. g-. f-.
  c'2\mf( f,4) bes4

  f4( c') f,( d'~)
  d8 c-. g8-. a-. bes4-. a-.
  g4-. bes8-. c~ c r8 a8 g~
  g8 r8 r8 c8-. r8 a-. bes-. r8

  g8 r8 r4 a8-. r8 b8-. r8
  c4 a8 f16( e f16)-- r16 a8( bes8) g16( f?
  g16)-- r16 b8 c16( d c bes) a8-. c-. g-. bes-.
  f16( g a8) bes8-. f-. g( bes16)-- r16 c16( bes a g)

  a8-. c16 bes c8-. d16 c d8-. e16 d e8-. c-.
  f8--\sfz r8 r4 r2
}

middlevoice = \relative a' {
  R1
  R1
  r4 a8\mf f16( e f16)-- r16 a8( bes8) g16( f
  g16)-- r16 b8 c16( d c bes) a8-. c-. g-. c-.

  f,8-. c'-. bes8 f-. g( bes16)-- r16 c16( bes a g
  a8) g16 bes a8-. c-. bes16( a bes) g( a bes) a8(
  bes8.) r16 r4 a8. r16 r4
  g8. r16 r4 f8-. r8 g8-. r8

  a8-.\f f16( e f)-- r16 a8-. bes g16( fis g) r16 b8
  c16( d c bes) a8-. c-. g-. c-. a-. c-.
  g8-. g8( a c16)-- r16 d16( c b a b) r16 a16( c)
  b8-. d-. c16( b c) a( b c d) b( c d) e,16( f

  g16 a b16 c) a16( b c d) b( a g b) e,( d c e)
  a16( g f a) d,16( c b) r g'8 d e'4
  e,4(\mp f) c8-. e-. d4(
  e4\mf ees2) d8 bes16( a

  bes16)-- r16  d8( ees8) c16( b c16) r16 e8 f16( g f ees)
  d8-. f-. c-. f-. d8-. bes-. f'-. c-.
  d( f16)-- r16 g16( f e d e8) d16( f e8 d)
  c8 e f4 d8( f16)-- r16 g16( f e d e8) d16 f

  e8-. g-. f16( e f) d( e f g) e
  c8-. f-. r8 d8-. a-. d-. bes( e16 f)
  c16( b) d( c) e8-. d-. f-. c-. e-. d-.
  bes8-. r8 d16( c d16--) r16 ees8( d8 c16--) r16 ees16 g

  f8-. e4( f4~) f16 g16 f8-. f
  bes8--\sfz r8 r4 r2
}

bottomvoice = \relative b {
  R1*4

  r4 d8\mf bes16( a bes)-- r16 d8( ees) c16( b
  c16)-- r16 e8 f16( g f ees) d8-. f-. c f16( ees)
  << {
  d8( ees16 f) ees8-. r8 c8( d16 ees) d8-. r8
  bes8( c16 d) c8-. r8 a8( bes16 c) bes8-. c8-.
  } {
    s8 s16\< s\!\> s\! s  s8 s8 s16\< s\!\> s\! s  s8
    s8 s16\< s\!\> s\! s  s8 s8 s16\< s\!\> s\! s  s8
  }  >>

  f,8(\f c' d f16)-- r16 g16( f e d e8) d16 f
  e8-. g-. f16( e f) d( e f g) e( f g f d)
  c8-. e( f8.) e16( d a b c b) r16 c8
  g8-. b-. c-. e-. b16( a g) r16 a8-. c-.

  g16( f e) r16 f8-. a-. g-. b-. e,-. g-.
  f8-. a-. d,-. f-. e-. g16( f e) r c8-.
  c'4\mp a( e4) b'4-.
  c4\mf f,8( g a4) bes

  d,4( ees8 f4) g8 bes8( d16 c
  bes4) ees8( d16 c bes a g8 f) a-.
  bes4-. c8  c-.  a4                   c4
  bes4 a8 f16( e f16)-- r16 a8( bes8) g16( fis?

  g16)-- r16 b8 c16( d c bes) a8-. c-. g-. c-.
  a8-. f f-. d8-. d( f16)-- r16 g16( f e d e8) d16 f
  e8-. g-. f16( e f) d( e f g a)
  bes8-. f8( g16 a bes8) g8-. r8 ees8-. r8

  f8( g a4) d8( c16 bes a8) c8-.
  bes8--\sfz r8 r4 r2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIDI

topvoicemidi = {
  \topvoice
}
middlevoicemidi = {
  \middlevoice
}
bottomvoicemidi = {
  \bottomvoice
}

themusic = {
  <<
    \set Score.midiChannelMapping = #'staff
    \keytempoetc
    \new Staff <<
      \set Staff.midiInstrument = #"violin"
      \topvoicemidi
    >>
    \new Staff <<
      \set Staff.midiInstrument = #"violin"
      \middlevoicemidi 
    >>
    \new Staff <<
      \set Staff.midiInstrument = #"cello"
      \bottomvoicemidi 
    >>
  >>
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Score

topvoicescore = {
  \set Staff.instrumentName = #"Violin 1"
  \clef treble
  \keytempoetc
  \topvoice
  \bar "|."
}
middlevoicescore = {
  \set Staff.instrumentName = #"Violin 2"
  \clef treble
  \keytempoetc
  \middlevoice
  \bar "|."
}
bottomvoicescore = {
  \set Staff.instrumentName = #"Cello"
  \clef alto
  \keytempoetc
  \bottomvoice
  \bar "|."
}

theblackdots = {
  <<
    \new StaffGroup <<
      % KLUGE spacing tweaks to make music not spill to third page
      \new Staff \with {
        fontSize = #-1
        \override StaffSymbol #'staff-space = #(magstep -1)
      } {
        \topvoicescore
      }
      \new Staff \with {
        fontSize = #-1
        \override StaffSymbol #'staff-space = #(magstep -1)
      } {
        \middlevoicescore
      }
      \new Staff \with {
        fontSize = #-1
        \override StaffSymbol #'staff-space = #(magstep -1)
      } {
        \bottomvoicescore
      }
    >>
  >>
}

\book {
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
  \bookpart {
    \header {
      subsubtitle = ""
    }
    \score {
      \new Staff << \topvoicescore >>
    }
  }
  \bookpart {
    \header {
      subsubtitle = ""
    }
    \score {
      \new Staff << \middlevoicescore >>
    }
  }
  \bookpart {
    \header {
      subsubtitle = ""
    }
    \score {
      \new Staff << \bottomvoicescore >>
    }
  }
}

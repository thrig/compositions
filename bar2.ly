%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% LilyPond engraving system - http://www.lilypond.org/                       %

\version "2.18.2"

\header {
  title   = "bar2"  
  subsubtitle = "2021-02-16"
  composer = "Jeremy Mates"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2021 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

tempoandetc = {
  \set Score.tempoHideNote = ##t
  \accidentalStyle "neo-modern"
  \time 2/4
  \tempo 4=168
}

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %

sopa = \relative d'' {
  R2
  r4 b4~
  b2~
  b4 a4~

  a2
  d4 e
  f1

  g2
  f4 e
  d1

  a2~
  a8 g f e
  f8 g f4~
  f4 e

  r4 c'4~
  c4 g'~
  g4 a~
  a2~

  a4 g~
  g4. d8
  e4 f~
  f8 f e4~
}

sopb = \relative d'' {
  e4 e
  d4. c8
  d4 b
  a4 b

  c4 d
  e4 f
  e4. d8
  c2~

  c2
  r4 a~
  a4 b
  c2
}

sopc = \relative d'' {
  d2
  b4 c
  b4 a
  b2

  c2
  d2
  f2
  c2~

  c4 b
  a4 g
  g4 f
  f2~
}

sopd = \relative d' {
  f2
  R2
  R2
  R2

  R2
  r4 a4
  g4 f
  a4 g

  c2
  d4 c
  d4 d
  e2

  f2
  e2
  e2~
  e4 e4

  d4 c
  d2
  c8 b a4
  g2

  a2
  bes2
  d2
  e2

  f2~
  f4 d
  e4 d
  c4 bes

  a2
  b!4 a
  g4 f
  e2

  a4 bes
  a4 a8 a
  g2
  f2
}

sope = \relative d' {
  e2
  e'4 e
  d8 c b! a
  b2

  c2
  d2
  d2
  c2

  b2
  a4 b
  c2
  d2~

  d2
  e2
  g,4 a
  b8 a g4

  f2
  a2
  b2
  d2

  e,2
  g2
  R2
  R2
}

sopf = \relative a' {
  R2
  R2
  R2
  R2

  a2
  a4 bes
  a4 f
  g4 a

  g2
  R2
  R2
  r4 e'4~

  e4 r8 e8
  d8 f e4
  R2
  d4 r8 g8

  a8 f4 e8~
  e8 d e4~
  e4 d
  r4 f8 f,

  bes4 d~
  d4 c
  e2
  e8 e, a4

  c4 b!
  a4. a8
  b8 c d c~
  c8 b4 b8
}

sopg = \relative a' {
  a4 g~
  g8 a b4
  a2
  b2

  g2
  r4 b8 e
  c4 d8 f
  e8 d f4

  g4 r4
  c,2
  e2
  d2

  g4 r4
  c,2
  e2
  d2

  g4 r4
  c,2
  e2
  d4. c8
}

soph = \relative a' {
  bes8 d c4
  d4 f
  e4. b!8
  c4 d

  b8 a g4
  c8 f, e'4
  d4 a
  c2

  c2~
  c2
  R2
  a2~

  a2~
  a2
  R2
  c2~

  c2
  b2
  R2*6
}

altoa = \relative g' {
  R2*4

  R2
  r4 a4~
  a2
  b4 e~

  e8 d d c~
  c4 c
  b4 b~
  b8 c d4~

  d4 c~
  c8 b a4
  a2~
  a4 g~

  g2~
  g8 f e4
  b'4 a
  a4 c8 b

  a4 b8 a
  g2~
  g4 f~
  f4 r4
}

altob = \relative g' {
  a2~
  a4. a8
  f4 g
  c,4 g'~

  g4. f8
  e8 a4 f8
  g2
  a2

  g4 f
  e2~
  e4 d
  e2
}

altoc = \relative g' {
  f4 f                      % TODO tweak as too slow?
  g2~
  g4 fis
  g2~

  g4 f
  a1
  g4 f

  e1
  R2
  R2
}

altod = \relative g' {
  R2
  R2
  a1

  b2~
  b4 c~
  c2
  c4 b

  a4 g
  f4. a8
  g2
  c4 a

  d2~
  d4 d
  c4 b
  a4 g

  b2~
  b4 a8 b
  a4 f~
  f4 e

  d2
  g2
  g4 f
  e4 g

  a4 bes
  c4 bes
  g2
  a4 g4

  f2~
  f2
  e2
  c2

  d2~
  d4 c
  c4 e
  d4 a'
}

altoe = \relative g' {
  c,2
  g'4 a~
  a4 g8 fis
  g2

  g4 a
  bes2~
  bes8 a g f
  e4 f

  g4 a8 b!
  c4 d
  e2
  f4 f,

  a4 g
  g4 e~
  e4 f
  f8 f e4

  R2
  f2
  g1

  R2
  e2
  f2
  a2
}

altof = \relative g' {
  g2
  f4 e
  f2
  g2

  c,4 f
  e4 g
  c,4 d
  e4 f~

  f4 e
  d4 c
  d2
  R2

  a2
  g'4 a
  f4 e
  R2

  d4. e8
  f8 g c,4~
  c4 d
  R2

  r8 d4 d8
  R2
  g2
  g4. f8

  f8 g4 e8~
  e8 d e f
  e2
  g4 d
}

altog = \relative d' {
  d4~ d8 e~
  e4 g
  r8 e8 d f
  e4 e'

  d8 c b c
  a2~
  a8 g f4
  g4 d~

  d4 g
  r4 a4~
  a4 g~
  g4 f

  r4 g4~
  g4 a4
  c4 g4~
  g4 f4

  r4 g4
  r4 g4
  c4. c8
  bes8 a g4
}

altoh = \relative a' {
  r4 a8 g
  f8 e a4~
  a8 a g4
  f2

  g8 f e d
  c4 c'8 e,
  a8 a, f'4
  e4 f

  g4 a
  g4 f
  e2
  R2

  R2
  f2
  R2
  e2~

  e2~
  e2
  R2
  R2

  r4 e4~
  e2~
  e4 r4
  R2
}

bassa = \relative d' {
  d1
  e2~
  e4 f4~

  f2
  f4 e
  d2
  d4 c

  b4 a~
  a4 g~
  g4 d
  e4 d~

  d2
  a'2~
  a2
  c2~

  c8 b a4~
  a4 g
  g4 f~
  f4 e~

  e4 e'8 f
  e4 b
  a2
  c2
}

bassb = \relative d {
  c2
  d2
  d4 e
  e4. d8

  c4 b
  c4. d8
  g,4 b
  a4 f'

  e4 d
  c2
  c'4 b
  a2
}

bassc = \relative d' {
  d,2
  e2
  b'2
  g2

  a2
  f4 e
  d2
  e2~

  e2
  R2
  c2
  d2~
}

bassd = \relative d {
  d2
  e2
  f2~
  f4 r4

  r4 e
  d4 c4~
  c4 f~
  f4 g

  a2
  d,2
  b'2
  a4. g8

  f2
  g2
  a4 b
  c2

  b2
  d,8 e f g
  a2
  c2

  R2
  bes4 a
  g2
  g2

  d2
  a'2
  R2
  c2

  d2
  d,2
  e4 f
  g4 a

  d,2
  f2
  e4 c
  d2
}

basse = \relative d {
  a'4 e
  c2
  d2
  g4 g8 f

  e4 f
  d2
  g2
  a2

  g2
  f2
  e2
  d2~

  d2
  c2
  R2
  R2

  a'1
  R2
  R2

  g1
  R2
  R2
}

bassf = \relative d {
  g2
  a2
  d,2
  c2~

  c4 d
  a4 g
  f'2
  e4 d

  g2
  f2
  d2
  R2

  R2
  R2
  a'4 g
  R2

  R2
  R2
  g2
  R2

  bes2
  f4 a
  e2
  r4 a4~
 
  a4 g
  c2
  R2
  g2~
}

bassg = \relative g {
  g2
  c4 c,
  f2
  g2~

  g4 g
  d'8 c b4
  a4 r8 a8
  g4 r8 a8

  bes2
  R2
  c2
  d2

  bes2
  c2
  a2
  d2

  bes2
  c2
  a2
  d4 r4
}

bassh = \relative c' {
  R2
  d,2
  e8 f g4
  a4 d,

  e2
  a2
  f4 d'
  c2~

  c4 r4
  e4 d
  c2~
  c2

  R2
  a2
  e2~
  e2~

  e2
  R2
  a2~
  a4 d

  c2
  r4 b4~
  b2~
  b4 r4
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% MIDI                                                                       %

msop = \new Voice {
  \set Staff.midiInstrument = #"orchestral harp"
  \tempoandetc
  \sopa
  \sopb
  \sopc
  \sopd
  \sope
  \sopf
  \sopg
  \soph
}
malto = \new Voice {
  \set Staff.midiInstrument = #"orchestral harp"
  \tempoandetc
  \altoa
  \altob
  \altoc
  \altod
  \altoe
  \altof
  \altog
  \altoh
}
mbass = \new Voice {
  \set Staff.midiInstrument = #"orchestral harp"
  \tempoandetc 
  \bassa
  \bassb
  \bassc
  \bassd
  \basse
  \bassf
  \bassg
  \bassh
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% SCORE                                                                      %

ssop = {
  \tempoandetc 
  \sopa
  \sopb
  \sopc
  \sopd
  \sope
  \sopf
  \sopg
  \soph
  \bar "|."
}

salto = {
  \tempoandetc 
  \altoa
  \altob
  \altoc
  \altod
  \altoe
  \altof
  \altog
  \altoh
  \bar "|."
}

sbass = {
  \clef bass
  \tempoandetc 
  \bassa
  \bassb
  \bassc
  \bassd
  \basse
  \bassf
  \bassg
  \bassh
  \bar "|."
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %

thescore = {
  \new StaffGroup
    \with { \override StaffGrouper.staff-staff-spacing = #'(
      (basic-distance . 0)
      (padding . 2))
    }
  <<
     \new Staff \ssop
     \new Staff \salto
     \new Staff \sbass
  >>
}

themidi = {
  <<
    \set Score.midiChannelMapping = #'staff
    \new Staff = "soprano" \msop
    \new Staff = "alto" \malto
    \new Staff = "bass" \mbass
  >>
}

\score {
  \thescore
  \layout { }
}

\score {
  \themidi
  \midi { }
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\markuplist { \paragraph { \with-color #grey \tiny {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105.
} } }

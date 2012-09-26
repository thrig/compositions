% LilyPond engraving system - http://www.lilypond.org/

\version "2.16.0"
\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?) (interpret-markup-list layout props (make-justified-lines-markup-list (cons (make-hspace-markup 4) args))))

\header {
  title       = "Four by Five"
  subtitle    = "(for Marimba(s) or similar instrumentation)"
  composer    = "Jeremy Mates"
  subsubtitle = "2012-09-25"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

keytempoetc = {
  \time 3/4
  \tempo "Sprightly" 4=164
  \key a \minor
}

codatheme = \relative c'' {
  c4 c8 c8 c8 c8 |
  aes'2 r4 |
  ees8 ees8 ees8 ees8 ees8 ees8 |
  c4 r8 c4 r8 |
  d4 d8 d8 d8 d8 |
  aes'4 aes4 aes4 |
  ees8 ees8 ees8 ees8 ees8 ees8 |
  d4 d8 d8 d4 |
  g,4 g8 g8 g8 g8 |
  b2 r4 |
  c2 r4 |
  g2 r4 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     SOPRANO     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sopranoone = \relative e'' {
  R2.\mf
  R2.
  R2.
  e8 e e g e4 |

  \repeat volta 2 {
    d2 d8 c
    d4 c a
    c4 g r
    R2. |

    g'4 e8 d e4
    g4 a8 a r4
    d,4 r2
    g4 r e |

    e8 d e4 r
    d2 r4
    a4 c4 d
    r4 g4 r4 |

    r8 e d e g r
    e8 d r2
    r4 r8 e8 d c
    a4 r4 r8 e'8 |

    e4 r2
    r8 e r2
    r4 e8 e r4
    r2 e4 |

    R2.
    e4 r2
    r2 e4
    e8 e e g e4 |
  }
}

sopranotwo = \relative e'' {
  f!2\mp^\markup{ \concat { \bold{Sakura} " [10,2,4,5,9] 2112" \bold {3} "1" }  } r4
  f2 r4
  e2 r4
  e2 r4 |

  R2.
  R2.
  r4. f8(\mf f f
  e8 f a4 a8 a |

  a8 a f2)
  R2.
  r4. g8( g g
  ees8 g a4 a8 a |

  a8 a g2)
  R2.
  r4. aes8( aes aes
  g8 aes g4 g8 g |

  g8 g ees2)
  R2.
  r4. g8( g g
  ees8 g a4 a8 a |

  a8 a g2)
  R2.
  R2.
  f2\mp r4 |

  r2 f4~
  f4 r2
  r4 e2
  R2. |

  e2 r4
  r4 f2
  f2 r8 a~
  a4. r4. |

  r4 f2
  r2 f4~
  f4 r f
  f2 f4 |
 \bar "||"
}

sopranothree = {
  R2.^\markup{ \concat { \bold { "Crab Canon" } } } R2. R2. R2.
  R2. R2. R2. R2.
  R2. R2. R2. R2.
  R2. R2. R2. R2.

  R2. R2. R2. R2.
  R2. R2. R2. R2.
  R2. R2. R2. R2.
  R2. R2. R2. R2.

  R2. R2. R2. R2.
 \bar "||"
}

sopranofour = {
  R2.
 \compressFullBarRests
 \textLengthOn
  s1*0^\markup{ \halign #6 \concat { \bold { "Improvise on " } \smaller { "F♯ G A B♭ C♯" } } }
  R2.*31
 \textLengthOff
 \expandFullBarRests
 \bar "||"
}

sopranofive = \relative d'' {
  R2.
  R2.
  r2 d4
  d4^\markup{ \concat \bold { "Spiral Canon" } } d d

  \key d \minor
  \transpose c d { \codatheme }
  \key cis \minor
  \transpose c cis { \codatheme }
  \key c \minor
  \transpose c c { \codatheme }
  \key b \minor
  \transpose c b, { \codatheme }

  R2.
  R2.
  R2.
  R2.

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      ALTO       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

altoone = \relative d'' {
  R2.\mf
  R2.
  d8 d d e d4
  c2 c8 a

  \repeat volta 2 {
    c4 a g
    a4 e r
    R2.
    e'4 d8 c d4 |

    e4 g8 g r4
    c,4 r2
    e4 r d
    d8 c d4 r |

    c2 r4
    g4 a4 c
    r4 e4 r4
    r8 d c d e r |

    d8 c r2
    r4 r8 d8 c a
    g4 r4 r8 d'8
    d4 r2 |

    r8 d r2
    r4 d8 d r4
    r2 d4
    R2. |

    d4 r2
    r2 d4
    d8 d d e d4
    c2 c8 a |
  }
}

altotwo = \relative d'' {
  d2\mp r4
  d2 r4
  d2 r4
  d2 r4 |

  r4. e8(\mf e e
  d8 e f4 f8 f
  f8 f e2)
  R2. |

  r4. bes8( bes bes
  a8 bes d4 d8 d
  d8 d bes2)
  R2. |

  r4. d8( d d
  bes8 d ees4 ees8 ees
  ees8 ees d2)
  R2. |

  r4. bes8( bes bes
  a8 bes d4 d8 d
  d8 d bes2)
  R2. |

  r4. d8( d d
  bes8 d e4 e8 e
  e8 e d2)
  d2\mp r4 |

  r2 d4~
  d4 r2
  r4 d2
  R2. |

  d2 r4
  r4 e2
  d2 r8 d~
  d4. r4. |

  r4 d2
  r2 d4~
  d4 r d
  d2 d4 |
 \bar "||"
}

altothree = \relative a' {
  R2.
  a4(\mp r2
  R2. |

  d,4 r2
  a'4) r4 g4(\mf
  f4 e8 d8 e4
  a4 g4) r4 |

  a4( d4 c4
  bes8 a8 g8 a8 g8 f8
  d4 e4 f4
  g8 e8 f4 d4 |

  f4 e4 d4
  c4 b4 a4)
  d4( cis4 r4
  e4) r2 |

  r4 f4(\mp r4
  R2.
  R2.
  d4\p)( r2 |

  R2.
  r2 f4\mp)
  R2.
  e4(\mf r4 cis4 |

  d4) a4( b4
  c4 d4 e4
  f4 d4 f4
  e8 g8 f4 e4 |

  d4 f8 g8 a8 g8
  a8 bes8 c4 d4
  a4) r4 g4(
  a4 e4 d8 e8 |

  f4 g4) r4
  a4(\mp r2
  d,4 r2
  R2. |

  a'4) r2
 \bar "||"
}

altofour = \relative e' {
 \compressFullBarRests
  R2.*31
  ees2 r4
 \expandFullBarRests
 \bar "||"
}

altofourmidi = \relative b' {
  r4. bes4~
  bes4.~ bes16 a r32 bes16 a8 g32~ 
  g8. fis16~ fis8. g16~ g8. a16~ 
  a2.~ 

  \times 2/3 { a8 cis bes } a16 bes16. a16 bes32 a8 g 
  r32 fis32~ fis16~ fis8 g8.~ g32 fis~ fis4~ 
  fis2~ fis8~ fis32 g32~ g16 
  a16. bes16 a32 bes a r32 bes16~ bes32 cis16~ cis8~ cis32 bes~ bes8~ 

  bes8. a16~ a4 bes4~ 
  bes4.~ bes16 a r32 a8 a32 r16 
  a16. a a16 r32 g16~ g32 fis16~ fis16~ fis4 
  g4 a r32 g32~ g16~ g8~ 

  g4.~ g8 cis8. r32 cis32~ 
  cis8. r32 cis32 r16 cis16 cis16. cis32 r16 cis16 bes8 
  r32 a16~ a32 g16~ g8 fis8~ fis8 g8.~ 
  g8 a r8 a16. a32 r16 a16. a32 r16 

  a16 a32 bes16. a16 r16 g8. r32 fis8. g32~ 
  g8.~ g32 fis~ fis2~ 
  fis4~ fis16. g32~ g8~ g16. a32~ a8 
  \times 2/3 { r8 a8 a8 } a16. bes16 a32 cis16~ cis16 bes8 a16 

  r16 bes8~ bes32 a32~ a16 g16~ g8 a4 
  r32 g32~ g16~ g8~ g16 fis16~ fis8~ fis8~ fis32 g32~ g16~ 
  g4~ g16 bes16~ bes8~ bes4~ 
  bes4. a8~ a4~ 

  a2~ a8~ a32 cis32~ cis16 
  cis16. cis16. bes16 r32 cis32 bes16. a32~ a16 r16 g8~ g32 fis~ 
  fis8 r32 g32~ g16 r16 a8 a16 r16 a16. a16 a32 
  \times 2/3 { r8 a bes } a8 g16. fis32 \times 2/3 { r8 g a } 

  bes16. cis16. cis16 r32 cis16. cis32 bes16 a32~ \times 2/3 { a16 bes a~ } a16. g32 
  r16 fis32~ fis8 r32 g32~ g16.~ g8~ g4~ 
  g16. fis32~ fis8~ fis2 
  r32 ees2~ ees8~ ees16~ ees8~ ees32 |
}

altofive = \relative d' {
  d2 r4
  d2 r4
  d4 r8 d4 r8
  d4 r8 d4 r8

  d4 d4 d4
  d2 r4
  R2.
  R2.

  R2.
  R2.
  R2.
  R2.

  R2.
  R2.
  R2.
  R2.

  R2.
  R2.
  R2.
  R2.

  R2.*32

  R2.*4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      TENOR      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tenorone = \relative c' {
  R2.\mf
  c8 c c d c4
  a2 a8 g
  a4 g e |

  \repeat volta 2 {
    g4 d r
    R2.
    d'4 c8 a c4
    d4 e8 e r4 |

    a,4 r2
    d4 r c
    c8 a c4 r
    a2 r4 |

    e4 g4 a
    r4 d4 r4
    r8 c a c d r
    c8 a r2 |

    r4 r8 c8 a g
    e4 r4 r8 c'8
    c4 r2
    r8 c r2 |

    r4 c8 c r4
    r2 c4
    R2.
    c4 r2 |

    r2 c4
    c8 c c d c4
    a2 a8 g
    a4 g e |
  }
}

tenortwo = \relative a {
  R2.
  r4. a4.\mp~
  a8 r8 r2
  r4. bes8(\mf bes bes |

  a8 bes d4 d8 d
  d8 d bes2)
  R2.
 \clef treble
  r4. d8( d d |

  bes8 d e4 e8 e
  e8 e d2)
  R2.
  r4. ees8( ees ees |

  d8 ees g4 g8 g
  g8 g ees2)
  R2.
  r4. d8( d d |

  c8 d ees4 ees8 ees
  ees8 ees d2)
  R2.
  r4. e8( e e |

  d8 e f4 f8 f
  f8 f d2)
  R2.
  R2. |

  R2.
  R2.
  R2.
  R2. |

  R2.
  r4 d2\mp
  d2 r8 d~
  d4. r4. |

  r4 d2
  r2 e4~
  e4 r f
  e2 d4( |
 \bar "||"
}

tenorthree = \relative d' {
  R2.
  R2.
  r4 f4) r4 |

  r2 e4(\mf
  r4 cis4 d4)
  a4( b4 c4
  d4 e4 f4 |

  d4 f4 e8 g8
  f4 e4 d4
  f8 g8 a8 g8 a8 bes8
  c4 d4 a4) |

  r4 g4( a4
  e4 d8 e8 f4
  g4) r4 a4(\mp
  r2 d,4 |

  R2.
  r2 a'4)
  R2.
  R2. |

  r4 a4( r4
  R2.
  r4 d,4 r4
  r4 a'4) r4 |

  g4(\mf f4 e8 d8
  e4 a4 g4)
  r4 a4( d4
  c4 bes8 a8 g8 a8 |

  g8 f8 d4 e4
  f4 g8 e8 f4
  d4 f4 e4
  d4 c4 b4 |

  a4) d4( cis4
  r4 e4) r4
  r2 f4(\mp
  R2. |

  R2.
 \bar "||"
}

tenorfour = \relative d' {
 \compressFullBarRests
  r4 d4) r4 R2.*31
 \expandFullBarRests
 \bar "||"
}

tenorfive = \relative d' {
  \clef treble

  R2.*7
  \key d \minor
  \transpose c f, { \codatheme }
  \key cis \minor
  \transpose c e, { \codatheme }
  \key c \minor
  \transpose c ees, { \codatheme }
  \key b \minor
  \transpose c d, { \codatheme }
  R2.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      BASS       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bassone = \relative a {
  a8\mf a a
   c_\markup{ \concat { \bold { "Canonic Pentatonic Minor " } "(mostly)" } }
   a4
  g2 g8 f!
  g4 e d
  e4 c r |

  \repeat volta 2 {
    R2.
    c'4 a8 g a4
    c4 d8 d r4
    g,4 r2 |

    c4 r a
    a8 g a4 r
    g2 r4
    d4 e4 g |

    r4 c4 r4
    r8 a g a c r
    a8 g r2
    r4 r8 a8 g e |

    d4 r4 r8 a'8
    a4 r2
    r8 a r2
    r4 a8 a r4 |

    r2 a4
    R2.
    a4 r2
    r2 a4 |

    a8 a a c a4
    g2 g8 f!
    g4 e d
    e4 c r |
  }
}

basstwo = \relative d' {
  d2\mp r4
  d2 r4
  d2 r4
  d2 r4 |

  R2.
  r4. a8(\mf a a
  f8 a bes4 bes8 bes
  bes8 bes a2) |

  R2.
  r4. a8( a a
  f8 a bes4 bes8 bes
  bes8 bes a2) |

  R2.
  r4. g8( g g
  ees8 g aes4 aes8 aes
  aes aes bes2) |

  R2.
  r4. a8( a a
  g8 a bes4 bes8 bes
  bes8 bes a2) |

  R2.
  r4. a8( a a
  g8 a bes4 bes8 bes
  bes8 d e e e f |

  e8 e d d bes4)
  r4 a2
  r4 d2\mp
  R2. |

  d2 r4
  r4 a2
  a2 r8 a~
  a4. r4. |

  r4 bes2
  r2 bes4~
  bes4 r a
  a2 a4 |
 \bar "||"
}

bassthree = {
  R2. R2. R2. R2.
  R2. R2. R2. R2.
  R2. R2. R2. R2.
  R2. R2. R2. R2.

  R2. R2._\markup{ \concat { \bold { "nonaC barC" } } } R2. R2.
  R2. R2. R2. R2.
  R2. R2. R2. R2.
  R2. R2. R2. R2.

  R2. R2. R2. R2.
 \bar "||"
}

bassfour = {
 \compressFullBarRests
  R2.*32
 \expandFullBarRests
 \bar "||"
}

bassfive = \relative bes {
  R2.*4

  R2.
  bes4 r8 bes4 r8
  bes2 r4
  R2.

  R2.*8

  R2.
  a4 r8 a4 r8
  R2.
  R2.

  R2.*8

  R2.
  aes4 r8 aes4 r8
  R2.
  R2.

  R2.*8

  R2.
  g4 r8 g4 r8
  R2.
  R2.

  R2.*8

  R2.
  R2.
  R2.
  \relative d {
    d2 r4
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     voices      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

soprano = {
  \set Staff.midiInstrument = #"marimba"

  \keytempoetc
  \clef treble

  \sopranoone
  \break
  \sopranotwo
  \sopranothree
  \sopranofour
  \sopranofive

  \bar "|."
}

alto = {
  \set Staff.midiInstrument = #"marimba"

  \keytempoetc
  \clef treble

  \altoone
  \break
  \altotwo
  \altothree
  \altofour
% \altofourmidi
  \altofive

  \bar "|."
}
altomidi = {
  \set Staff.midiInstrument = #"marimba"

  \keytempoetc
  \clef treble

  \altoone
  \altotwo
  \altothree
  \altofourmidi
  \altofive

  \bar "|."
}

tenor = {
  \set Staff.midiInstrument = #"marimba"

  \keytempoetc
  \clef alto

  \tenorone
  \break
  \tenortwo
  \tenorthree
  \tenorfour
  \tenorfive

  \bar "|."
}

bass = {
  \set Staff.midiInstrument = #"marimba"

  \keytempoetc
  \clef bass

  \bassone
  \break
  \basstwo
  \bassthree
  \bassfour
  \bassfive

  \bar "|."
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     misc.     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

theblackdots = {
  <<
    \new StaffGroup <<
%     \override Score.BarNumber #'break-visibility = #'#(#t #t #t)
%     \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)

      \new Staff = "soprano" \soprano
      \new Staff = "alto" \alto
      \new Staff = "tenor" \tenor
      \new Staff = "bass" \bass
    >>
  >>
}

themusic = {
  <<
    \new PianoStaff <<
      \set Score.midiChannelMapping = #'instrument

      \new Staff = "soprano" \soprano
      \new Staff = "alto" \altomidi
      \new Staff = "tenor" \tenor
      \new Staff = "bass" \bass
    >>
  >>
}

\score {
  \theblackdots
  \layout { }
}
\score {
  \unfoldRepeats \articulate { \themusic }
  \midi {
    \context {
      \Score midiMinimumVolume = #0.3 midiMaximumVolume = #0.9
    }
  }
}

\markuplist { \vspace #1 \paragraph {
Marimba or instruments with low sustain times should be used; the longer notes mostly eliminate rest clutter, and do not indicate that the note should actually be held that long. Dynamics are left to the whim of the performer(s), though these likely should favor subtle changes over dramatic contrasts. The improvise section should last around 32 measures, or otherwise balance with the earlier "Sakura" section. There might be suitable pedal notes or other accompaniment from other performers, or just a solo. Improvisation should be more expressive than rhythmic (listen to the Oud or similar Arabian music for ideas) though if you can make something else work for the five notes, go for it. For a larger improvisation space, consider from highest note down, D C♯ B♭ A G F♯ E♭ D C B A♭ G F E (a series of overlapping maqam).
} }

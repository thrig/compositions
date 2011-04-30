% LilyPond engraving system - http://www.lilypond.org/
%
% Harpsichord soundfonts (usable via "soundfont /path/to/foo.sf2" in the
% timidity configuration and some fiddling with the lilypond MIDI instrument
% or other methods to adjust the MIDI channels):
%
% http://www.schristiancollins.com/generaluser.php
% http://www.realmac.info/hpschd2.htm

\version "2.12.3"

% http://www.mail-archive.com/lilypond-user@gnu.org/msg38823.html
\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

\header {
  title = "Tocatta in C — DRAFT"
  composer = "Jeremy Mates"
  subsubtitle = "2011-??-??"
  copyright = "© 2011 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
}

firstBitUpper = \relative c'' {
  \key c \major
  \time 3/4

  \partial 8 e8 |

  \acciaccatura b32 c4 b8\( a <g b>4 |
  <f c'>4\) d'8[\( e]\) f,\( g\) |
  a4-. e d8\( c\) |
  a''[\( g]\) c,[\( d]\) g,\( f\) |

  \repeat volta 2 {
    e4 d8\( c\) <b g'>4 |
    << { a' } \\ { c, } >> d'8\( c b4\) |
    d8\( c d4\) c8\( b |
    c4\) e8\( d e4\) |
  
    d8\( c b a\) e'\( f |
    e d\) g,\( a b c |
    d\) b\( a g f e\) |
    f4\( g\) a-. |
  
    g8\( f\) a4\( b\) |
    c4-. b8\( a\) e4 |
    f4-. g-. a |
    c,8[\( b]\) f'[\( e]\) d'[\( c]\) |
  
    a'8[\( g]\) c,[\( d]\) g,[\( f]\) |
  }
}

firstBitLower = \relative c {
  \key c \major
  \partial 8 r8_\markup { \italic "Lebhaft" }

  < c g' c >2 d'4\( |
  c8 b\) a4-. g |
  c8[\( d]\) g,\( a\) b4\( |
  c4 b\) \tieDown b,\( |

  \repeat volta 2 {
    <c g'> d\) e-. |
    <f, c'>4 r8 b\( c d |
    e8 f g e d c |
    b a g b c d |
  
    c b a4\) a'8\( g |
    a4\) c,8\( d c4\) |
    f8\( e f4\) g |
    a4-. g8\( f\) c4\( |
  
    d\) e-. d8[\( c |
    b a]\) d4-. e-. |
    d4 b8[\( a]\) g'\( f\) |
    e4 d-. <b' c>-. |
  
    <f g>4-. <c d>-. <b f'> |
  }
}

secondBitUpper = \relative c' {
  \time 4/4
 
  <b g'>4 g''8[ r16 g g8] b,, g''[ r16 g |
  g8] c,, f'[   r16 f f8] b,, f''[ r16 f |
  f8] a,, a''[  r16 a a8] b,, a''[ r16 a |
  a8] c,, g''[  r16 g g8] b,, g''[ r16 g] |

  \key bes \major

  ees8\( d16  c d8 bes\) << { s4 s8 s16 a' } \\ { c,8\( bes16 a bes8 g\) } >> |
  f'8\( ees16 d ees8 c\) << { s4 s8 s16 d }  \\ { d8\( c16 bes c8 g\) } >> |
  bes8\( a16  g a8  f\) d'\( c\) bes16\( c d ees\) |
  g8\( f16  ees f8  d\) ees\( c\)  d16\( c bes f\) |

  a8\( g16  fis g8  d\) f\( ees\) d16\( ees d c\) |
  d8\( ees16 f   a8 g f\) g16   a   <d g,>8\( <c a>8 |
  <bes bes'>4\) <a f'>8-. r <bes d>-. r <g ees'>\( <f c'> |
  <d bes'>4\) <ees a>8-. r <g d'>-. r << { <e c'>\( <d g> } \\ { s4 } >> |

  << { c'1\) } \\
     { c,4.. r8 <d aes'>4.. } >> |
}

secondBitLower = \relative c {
  \time 4/4

  <g' d>4 r8_\markup { \italic "Mäßig" } c,\( d4\) r8 b\( |
  c4\) r8 a\( b4\) r8 g\( |
  a4\) r8 c\( d4\) r8 b\( |
  c4\) r8 a\( b4\) r8 c |

  \key bes \major

  << { <f a>4_\markup { \italic "Kräftig" } g a ees }
  \\ { s8 bes' s ees, s d  s c } >> |
  << { <bes d>4 g' f ees } \\ { s8 ees  s c    s d  s c } >> |
  <d f>4 ees8\( d\) <bes f'>4 d8\( ees\) |
  <f a>4 ees8\( d\) <c g'>4 d8\( ees |

  <d f>4\) <ees g>-. <f a>-. <g, g'>8\( <a' ees> |
  <bes, bes'>4\) <ees f>-. <d a'>-. <ees g>8\( a, |
  <bes f'>8\) c16 d f8 ees d ees16 f <ees g>8\( a |  
  <bes bes,>8\) fis16 f fis8 ees8 bes' g16 fis g8\( b, |

  <c g'>4..\) r8 <d f>4.. |
}

thirdBitUpper = \relative c' {
  << { g'2 } \\ { c,8\( d ees d\)  g\( aes bes aes\) } >> |
  f8\( g aes g\)  ees\( f g f\) |
  d8\( ees f ees\)  d\( aes' g f\) |
  ees8\( f ees d\)  f\( aes f ees |
  g8 bes d bes  g f aes c |
  aes8 f ees g  bes g ees d |
  f8 aes f d    ees g bes g |
  f8 aes c aes  g bes d b\) |

  \set Score.tempoHideNote = ##t

  \time 3/4
  <ees, c'>4 r16
  \tempo 4=144 f32[\(_\markup { \italic "gliss." } g a b c d e f]~\)
  \tempo 4=192 f16 ees8 |
  \time 4/4
  d4  f8\( ees f4\)  ees8\( d | 
  ees4\)  g8\( f g4\)  aes8\( g |
  f4\)  g8\( aes bes4\)  aes8\( bes |
  c4\)  bes8\( aes g4\)  ees8\( f |
  g4\)  aes8\( g f4\)  d8\( ees |
  f4\)  d8\( c bes4\)
  \tempo 4=186 aes8\(_\markup { \italic "rit." } bes |

  \tempo 4=180 c4\) bes8\( aes c4 d\) |
  ees4-. d8\( c g4 aes |
  bes4.\) r8  ees,8[\( d]\) aes'[\( g]\) |
  f'8[\( ees]\) c'[\( bes]\) ees,[\( f]\)_\markup { \italic "accel." }
  \tempo 4=186 bes,\( aes |
  \tempo 4=192 g4\)  bes8\( aes bes4\)  aes8\( g |
  aes4\)  c8\( bes c4\)  d8\( c |
  bes4\)  c8\( d ees4\)  f8\( ees |
  d4\)  ees8\( d c4\)
  \tempo 4=186 aes8\(_\markup { \italic "rit." } bes |

  \tempo 4=180 c4.\) r8  d,8[\( c]\) g'\( f\) |
  ees'8[\( d]\) bes'8[\( aes]\) d,[\( ees]\)_\markup { \italic "accel." }
  \tempo 4=186 aes,\( g | 
  \tempo 4=192 f4\)  aes8\( g aes4\)  g8\( f |
  g4\)  bes8\( aes bes4\)
  \tempo 4=186 c8\(_\markup { \italic "rit." } d |
  \tempo 4=180 ees4\) d8\( c  ees4 f\) |
  g4-. f8\( ees\) bes4 c-. |
  d4-. ees f8[\( g]\) aes,\( bes\) |
  c4-. g f8[\( ees]\) c''[\( bes]\) |
  ees,8[\( f]\) bes,\( aes g aes bes d\) |
  <ees aes,>4 g,8\( f ees f g bes\) |
  <ees, c'>4 aes8\( g f g ees d\) |

  \set Score.tempoHideNote = ##f
}

thirdBitLower = \relative c' {
  << { g8 g4. } \\ { ees2_\markup { \italic "Bewegt" } } >>  bes8 bes4. |
  d8 d4.  c8 c4. |
  g'8 g4. f8  f4. |
  \clef treble c''8 c4.  b8 b4. |
  f'8 f4.  e8 e4. |
  ees8 ees4.  d8 d4. |
  c8 c4.  \clef bass c,,4. c8 |
  d4. d8  <c ees>4-. <b ees>4-. |

  <c g'>4  <d f>4.  ees8[\( |   % gliss lower
  f8 g aes g]  f g aes bes |
  \clef treble c8 d ees f  ees d c bes |
  d8 c bes c  d ees f g |
  aes8 bes g f  ees d c bes |
  c8 ees f g  f ees d c |
  d8 ees g aes  g f ees d |

  \clef bass c4\)  f,4-. g-. f8[\( ees |
  d8 c]\) f4\( g f\) |
  d8[\( c]\) bes'\( aes\)  r2 |
  r2 r4 g,8[\( aes |
  bes8 c d c]  bes c d ees |
  f8 g aes bes  aes g f ees |
  g8 f ees f  g aes bes c |
  d8 ees c bes  aes[ g f ees |

  c8 bes]\) aes'[\( g]\)  r2 |
  r2 r4 b,8[\( c |
  d8 ees f ees]  d c ees f |
  ees8 d c d  ees[ f ees d |
  c8 bes]\)  aes'4-. g f8[\( ees |
  d8 c] d4\) ees-. c8[\( bes |
  aes8 g]\) g'4-. f-. d'-. |
  ees8[\( f]\) bes,\( c\) d4\( ees |
  d4\) d,4-. <c ees>\( <bes f'> |
  <c ees>4\) ees8\( f g aes bes d |
  <g, c>4\)  c,-. <d aes'> <ees g> |
}

fourthBitUpper = \relative c' {
  <c ees>2~ \set Score.tempoHideNote = ##t
    \tempo 4=96 <c ees>4\shortfermata \tempo 4=126
% TODO cannot use [] as previously, as rendering runs off egde of page :(
                                  ees'8 r16 ees |
  ees8  f,  ees'  r16 ees ees8 ees, f'  r16 f  |
  f8    d,  f'    r16 f   f8   ees, d'  r16 d |
  d8    ees, d'   r16 d   d8   g,   g'  r16 g |

  g8    f,  g'    r16 g   g8   ees, f'  r16 f |
  f8    d,  f'    r16 f   f8   c,   c'  r16 c |
  c8    d,  c'    r16 c   c8   ees, d'  r16 d  |
  d8    f,  d'    r16 d   d8   g,  ees' r16 ees |

  ees8  aes, ees' r16 ees ees8 f,   d'  r16 d  |
  \time 3/4 \key c \major
  d8    g,  d'    r16 d  d8 f, |
  <e c'>2.~ |
  <e c'>2 r4

  \set Score.tempoHideNote = ##f
}

fourthBitLower = \relative c {
  <c g'>2~ <c g'>4 r8_\markup { \italic "Mäßig" }
    \clef treble aes''8\( |
  g4\)    r8 c,\(  d4\) r8 f\(   |
  ees4\)  r8 c\(   d4\) r8 g\(   |
  f4\)    r8 ees\( f4\) r8 bes,\( |

  d4\)    r8 g\(   f4\) r8 aes,\( |
  ees'4\) r8 bes\( d4\) r8 g,\(   |
  b4\)    r8 c\(   d4\) r8 aes'\( |
  g4\)    r8 ees\( f4\) r8 b,\(  |

  c4\)    r8 f,8\( g4\) r8 d'\( |
  \time 3/4 \key c \major
  c4\)    r8 b\(   c4\) \clef bass |
  <c, c'>2.~ |
  <c c'>2 r4
}

upper = {
  \clef treble

  % tempo choices via http://bachscholar.com/table_3a.html
  \tempo "Allegro" 4=128
  \firstBitUpper

  \set Score.tempoHideNote = ##t
  \tempo 4=126
  \secondBitUpper
  \set Score.tempoHideNote = ##f

  \key c \minor
  \tempo "Presto" 4=192
  \thirdBitUpper

  \tempo "Allegro" 4=126
  \fourthBitUpper
  \bar "||"
  \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark "D.C. al Fine"
}

lower = {
  \clef bass

  \firstBitLower
  \secondBitLower
  \key c \minor
  \thirdBitLower
  \fourthBitLower
  \bar "||"
}

theMusic = {
  \new PianoStaff <<
    \set PianoStaff.instrumentName = #"Harpsichord"
    \set PianoStaff.midiInstrument = #"Harpsichord"
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
}

\book {
  \paper {
    oddHeaderMarkup = \markup \fill-line {
      "" \fromproperty #'page:page-number-string }
    evenHeaderMarkup = \markup \fill-line {
      "" \fromproperty #'page:page-number-string }
  }
\score {
  \theMusic
  \layout {
    % as otherwise long instrument name clipped by margin
    indent = 2.3\cm
  }
}
\score {
  \unfoldRepeats \articulate {
    \theMusic
  }
  \midi { }
}
  \markuplines { \paragraph { \tiny     {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
} } }
}

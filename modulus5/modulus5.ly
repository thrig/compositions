% LilyPond engraving system - http://www.lilypond.org/
%
% Experiments with pitch sets generated by my Music::Chord::Positions
% perl module.
%
% https://github.com/thrig/compositions
% http://soundcloud.com/thrig

\version "2.14.0"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

\header {
  title       = "Modulus No.5"
  subtitle    = "Music::Chord::Positions"
  composer    = "Jeremy Mates"
  subsubtitle = "2011-11-23"
  copyright   = "© 2011 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
}

glockenspiel = {
  \clef treble
  \time 4/4
  \tempo "Tempo semplice" 4=54

  \override Hairpin #'circled-tip = ##t

  R1 |
  R1 |

  r16 ais\mf ais c'8 dis'16 f' dis'
  f' g' c' dis' f' dis' f' g' 
  dis' f' g' f' g' ais' g' ais' c'' c' dis' f' dis' f' g' dis' 
  f' g' f' g' ais' g' ais' c'' 
  f' g' ais' g' ais' c'' ais' c'' 
  dis' f' g' f' g' ais' g' ais' 
  c'' f' g' ais' g' ais' c'' ais' 
  ais ais ais' g' ais' ais'' g'' f' 
  f'' ais' ais'' f'' g' g'' f'' g'' 
  ais' ais'' g'' ais'' f'' ais'' g'' dis' 
  dis'' ais' ais'' dis'' g' g'' dis'' g'' 
  ais' ais'' g'' ais'' dis'' ais'' g'' f' 
  f'' dis'' f'' ais' ais'' f'' ais'' dis'' 
  ais'' f'' g' g'' f'' g'' dis'' g'' 
  f'' g'' ais' ais'' g'' ais'' f'' ais'' 
  g'' ais'' dis'' ais'' g'' ais'' f'' ais'' 
  ais8\p c' dis'16 f' dis' f' 
  g' c' dis' f' dis' f' g' dis' 
  f' g' f' g' ais' g' ais' c'' 
  c' dis' f' dis' f' g' dis' f' 
  g' f' g' ais' g' ais' c'' f' 
  g' ais' g' ais' c'' ais' c'' dis' 
  f' g' f' g' ais' g' ais' c'' 
  f' g' ais' g' ais' c'' ais' c'' 
  ais8\mf ais'16 g' ais' ais'' g'' f' 
  f'' ais' ais'' f'' g' g'' f'' g'' 
  ais' ais'' g'' ais'' f'' ais'' g'' dis' 
  dis'' ais' ais'' dis'' g' g'' dis'' g'' 
  ais' ais'' g'' ais'' dis'' ais'' g'' f' 
  f'' dis'' f'' ais' ais'' f'' ais'' dis'' 
  ais'' f'' g' g'' f'' g'' dis'' g'' 
  dis' f' g' f' g' ais' g' ais' c'' f' g' ais' g' ais' c'' ais'
  g'' ais' ais'' g'' ais'' f'' ais'' g'' 
  ais'' dis'' ais'' g'' ais'' f'' ais'' f'' |

  ais'' r8. r4 r2 

  R1 |
  R1 |

  r16 ais\p ais c'8 dis'16 f' dis'
  f' g' c' dis' f' dis' f' g' 
  dis' f' g' f' g' ais' g' ais' c'' c' dis' f' dis' f' g' dis' 
  f' g' f' g' ais' g' ais' c'' 
  f' g' ais' g' ais' c'' ais' c'' 
  dis' f' g' f' g' ais' g' ais' 
  c'' f' g' ais' g' ais' c'' ais' 
  ais\mf ais ais' g' ais' ais'' g'' f' 
  f'' ais' ais'' f'' g' g'' f'' g'' 
  ais' ais'' g'' ais'' f'' ais'' g'' dis' 
  dis'' ais' ais'' dis'' g' g'' dis'' g'' 
  ais' ais'' g'' ais'' dis'' ais'' g'' f' 
  f'' dis'' f'' ais' ais'' f'' ais'' dis'' 
  ais'' f'' g' g'' f'' g'' dis'' g'' 
  f'' g'' ais' ais'' g'' ais'' f'' ais'' 
  g'' ais'' dis'' ais'' g'' ais'' f'' ais'' 
  ais8\p c' dis'16 f' dis' f' 
  g' c' dis' f' dis' f' g' dis' 
  f' g' f' g' ais' g' ais' c'' 
  c' dis' f' dis' f' g' dis' f' 
  g' f' g' ais' g' ais' c'' f' 
  g' ais' g' ais' c'' ais' c'' dis' 
  f' g' f' g' ais' g' ais' c'' 
  f' g' ais' g' ais' c'' ais' c'' 
  ais8 ais'16 g' ais' ais'' g'' f' 
  f'' ais' ais'' f'' g' g'' f'' g'' 
  ais' ais'' g'' ais'' f'' ais'' g'' dis' 
  dis'' ais' ais'' dis'' g' g'' dis'' g'' 
  ais' ais'' g'' ais'' dis'' ais'' g'' f' 
  f'' dis'' f'' ais' ais'' f'' ais'' dis'' 
  ais'' f'' g' g'' f'' g'' dis'' g'' 
  dis'\mf f' g' f' g' ais' g' ais' c'' f' g' ais' g' ais' c'' ais'
  g'' ais' ais'' g'' ais'' f'' ais'' g'' 
  ais'' dis'' ais'' g'' ais'' f'' ais'' f'' |

  g'' r8. r4 r2 

 \bar "||"
}

vibraphone = {
  \clef treble

  R1

<< {
  s1

\repeat unfold 2 {
  g8 g g ais 
  g' g' ais' ais 
  ais f' f' ais' 
  f' f' g' f'' 
  g' g' ais' g'' 
  ais' f'' f'' ais 
  ais dis' dis' ais' 
  dis' dis' g' dis'' 
  g' g' ais' g'' 
  ais' dis'' dis'' dis' 
  dis' f' dis'' f' 
  f' ais' f'' ais' 
  dis'' dis'' f' f' 
  g' f'' g' dis'' 
  dis'' f'' g' g' 
  ais' g'' ais' f'' 
  f'' g'' ais' dis'' 
  dis'' g'' dis'' f'' |
}
  s1


} \\ {
  g'2\rest g'4.\rest g8\mf |

  f f f f
  f f f g 
  g g g g 
  ais ais ais ais 
  f' f' f' f' 
  g' g' ais' g 
  g g g g 
  ais ais ais ais 
  dis' dis' dis' dis' 
  g' g' ais' ais 
  ais ais ais dis' 
  dis' dis' dis' f' 
  f' ais' dis' dis' 
  dis' dis' f' f' 
  g' dis'' f' f' 
  f' f' g' g' 
  ais' f'' g' g' 
  ais' dis'' ais' dis'' |

  f\mp f f f
  f f f g 
  g g g g 
  ais ais ais ais 
  f' f' f' f' 
  g' g' ais' g 
  g g g g 
  ais ais ais ais 
  dis' dis' dis' dis' 
  g' g' ais' ais 
  ais ais ais dis' 
  dis' dis' dis' f' 
  f' ais' dis' dis' 
  dis' dis' f' f' 
  g' dis'' f' f' 
  f' f' g' g' 
  ais' f'' g' g' 
  ais' dis'' ais' dis'' |

  dis''
  b'8\rest b'4\rest b'2\rest

} >>

  R1

<< {
  s1

\repeat unfold 2 {
  g8 g g ais 
  g' g' ais' ais 
  ais f' f' ais' 
  f' f' g' f'' 
  g' g' ais' g'' 
  ais' f'' f'' ais 
  ais dis' dis' ais' 
  dis' dis' g' dis'' 
  g' g' ais' g'' 
  ais' dis'' dis'' dis' 
  dis' f' dis'' f' 
  f' ais' f'' ais' 
  dis'' dis'' f' f' 
  g' f'' g' dis'' 
  dis'' f'' g' g' 
  ais' g'' ais' f'' 
  f'' g'' ais' dis'' 
  dis'' g'' dis'' f'' |
}
  dis'' s8 s4 s2


} \\ {
  g'2\rest g'4.\rest g8\mp |

  f f f f
  f f f g 
  g g g g 
  ais ais ais ais 
  f' f' f' f' 
  g' g' ais' g 
  g\mf g g g 
  ais ais ais ais 
  dis' dis' dis' dis' 
  g' g' ais' ais 
  ais ais ais dis' 
  dis' dis' dis' f' 
  f' ais' dis' dis' 
  dis' dis' f' f' 
  g' dis'' f' f' 
  f' f' g' g' 
  ais' f'' g' g' 
  ais' dis'' ais' dis'' |

  f\mf f f f
  f f f g 
  g g g g 
  ais ais ais ais 
  f' f' f' f' 
  g' g' ais' g 
  g g g g 
  ais ais ais ais 
  dis' dis' dis' dis' 
  g' g' ais' ais 
  ais ais ais dis' 
  dis' dis' dis' f' 
  f' ais' dis' dis' 
  dis' dis' f' f' 
  g' dis'' f' f' 
  f' f' g' g' 
  ais' f'' g' g' 
  ais' dis'' ais' dis'' |

  c''
  b'8\rest b'4\rest b'2\rest

} >>

 \bar "||"
}

cello = {
  \clef bass
  \override Hairpin #'circled-tip = ##t

  R1
  << dis1 { s4\< s s s\! } >>

  dis1\mf(
  dis2 dis 
  dis dis 
  dis4 dis dis dis 
  dis dis dis dis 
  \override Hairpin #'circled-tip = ##f
  dis dis << dis) { s8\> s\! } >> f4\mp( 
  f f f f 
  f f f f 
  f f f f 
  f f << f) { s8\> s\! } >> g4\mf( 
  g g g g 
  g g g g 
  g << g) { s8\> s\! } >> ais4(\mp ais 
  ais ais ais ais 
  ais << ais) { s8\> s\! } >>
 \clef treble 
  dis'4(\mf dis' dis' dis' 
  dis' dis' dis' << dis') { s8\> s\! } >>
  f'4(\mp f' f' << f') { s8\> s\! } >>
  g'2(\mf |

  dis'1~)

  << dis'1( { s4\> s s s8 s16 s\! } >>

 \clef bass
  << dis1~) { s4\< s s s\! } >>

  dis1\mp(
  dis2 dis 
  dis dis 
  dis4 dis dis dis
  dis dis dis dis 
  \override Hairpin #'circled-tip = ##f
  dis dis << dis) { s8\> s\! } >> f4\mp( 
  f f f f 
  f f f f 
  f f f f 
  f f << f) { s8\> s\! } >> g4\mf( 
  g g g g 
  g g g g 
  g << g) { s8\> s\! } >> ais4(\mp ais 
  ais ais ais ais 
  ais << ais) { s8\> s\! } >>
 \clef treble 
  dis'4(\mp dis' dis' dis' 
  dis' dis' dis' << dis') { s8\> s\! } >>
  f'4(\mp f' f' << f') { s8\> s\! } >>
  g'2\f |

  c'2. r4

 \bar "||"
}

urb = {
  \clef bass
  \override Hairpin #'circled-tip = ##t

  \relative c, {
    << c1~ { s4\< s s s\! } >>
    c1\mf |
   \override Hairpin #'circled-tip = ##f
    c~ c c~ c c c c( |
    c'2) c c c c c c1~\mp c c\mf c c2 c c c c c c c( |

    << c,1~) { s8 s\> s4 s s8 s\! } >>

    << c1~ { s4\< s s s\! } >>
    c1\mp |
    c~ c c~ c c c c( |
    c'2\mf) c |
    c c |
    c c |
    c1~\mp c c\mf c c2 c c c c c << c { s4 s8\< s\! } >> c2\f |

    c2. r4
  }

 \bar "||"
}

\book {
 \paper {
   #(set-paper-size "letter")
 }
\bookpart {
\score {
 \new StaffGroup <<
  \new Staff <<
    \set Staff.instrumentName = #"Glock."
    \set Staff.shortInstrumentName = #"Gl."
    \set Staff.midiInstrument = #"glockenspiel"

    \set Staff.keySignature = #`((1 . ,SHARP)(5 . ,SHARP))

    \glockenspiel
  >>
  \new Staff <<
    \set Staff.instrumentName = #"Vibe."
    \set Staff.shortInstrumentName = #"Vb."
    \set Staff.midiInstrument = #"vibraphone"

    \set Staff.keySignature = #`((1 . ,SHARP)(5 . ,SHARP))

    \vibraphone
  >>
  \new Staff <<
    \set Staff.instrumentName = #"Cello"
    \set Staff.shortInstrumentName = #"Ce."
    \set Staff.midiInstrument = #"cello"

    \set Staff.keySignature = #`((1 . ,SHARP)(5 . ,SHARP))

    \cello
  >>
  \new Staff <<
    \set Staff.instrumentName = #"Bass"
    \set Staff.shortInstrumentName = #"Cb."
    \set Staff.midiInstrument = #"contrabass"
    \urb
  >>
 >>
  \layout { }
  \midi { }
}
  \markuplines { \paragraph {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105.
} }
}
\bookpart {
  \header {
    title = "Modulus No.5 – Glockenspiel"
    subtitle = ""
    subsubtitle = ""
    composer = " "
  }
  \score {
   <<
    \override Score.SystemStartBar #'collapse-height = #1
    \new Staff <<
      \set Staff.instrumentName = #"Glock."
      \set Staff.keySignature = #`((1 . ,SHARP)(5 . ,SHARP))
      \glockenspiel
    >>
   >>
  }
}
\bookpart {
  \header {
    title = "Modulus No.5 – Vibraphone"
    subtitle = ""
    subsubtitle = ""
    composer = " "
  }
  \score {
   <<
    \override Score.SystemStartBar #'collapse-height = #1
    \new Staff <<
      \set Staff.instrumentName = #"Vibes."
      \set Staff.keySignature = #`((1 . ,SHARP)(5 . ,SHARP))
      \vibraphone
    >>
   >>
  }
}
\bookpart {
  \header {
    title = "Modulus No.5 – Cello"
    subtitle = ""
    subsubtitle = ""
    composer = " "
  }
  \score {
   <<
    \override Score.SystemStartBar #'collapse-height = #1
    \new Staff <<
      \set Staff.instrumentName = #"Cello"
      \set Staff.keySignature = #`((1 . ,SHARP)(5 . ,SHARP))
      \cello
    >>
   >>
  }
}
\bookpart {
  \header {
    title = "Modulus No.5 – Contrabass"
    subtitle = ""
    subsubtitle = ""
    composer = " "
  }
  \markuplines { \paragraph {
< holstein> the problem with most of the popular music today, and most ambient and video game music is that the harmonic analysis looks like this...
  } }
  \score {
   <<
    \override Score.SystemStartBar #'collapse-height = #1
    \new Staff <<
      \set Staff.instrumentName = #"Bass"
      \urb
    >>
   >>
  }
}

}

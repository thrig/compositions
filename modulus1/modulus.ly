% LilyPond engraving system - http://www.lilypond.org/
%
% http://soundcloud.com/thrig

\version "2.13.40"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

marimbaOne = \relative c {
  \set Staff.midiInstrument = #"Marimba"

  \clef bass
  \key c \major
  \time 4/4
  \tempo 4=90

a8\f a a c a a b f |
  a a a c a b a f |
  a a a c b a a f |
  a a a e a a a f |
  a a b c a a a f |
  a b a c a a a f |
  b a a c a a a e |
  a a a c a a b f |
  a a a c a b a f |
  a a a c b a a f |
  a a a e a a a f |
  a a b c a a a f |
  a b a c a a a f |
  b a a c a a a e |
  a a a c a a b f |
  a a a c a b a f |
  a a a c b a a f |
  a a a e a a a f |
  a a b c a a a f |
  a b a c a a a f |
  b a a c a a a e |
  a a a c a a b f |
  a a a c a b a f |
  a a a c b a a f |
  a a a e a a a f |
  a a b c a a a f |
  a b a c a a a f |
  b a a c a a a e |
  a a a c a a b f |
  a a a c a b a f |
  a a a c b a a f |
  a a a e a a a f |
  a a b c a a a f |
  a b a c a a a f |
  b a a c a a a e |
  a a a c a a b f |
  a a a c a b a f |
  a a a c b a a f |
  a a a e a a a f |
  a a b c a a a f |
  a b a c a a a f |
  b a a c a a a e |
  a a a c a a b f |
  a a a c a b a f |
  a a a c b a a f |
  a a a e a a a f |
  a a b c a a a f |
  a b a c a a a f |
  b a a c a a a e |
  a a a c a a b f |
  a a a c a b a f |
  a a a c b a a f |
  a a a e a a a f |
  a a b c a a a f |
  a b a c a a a f |
  b a a c a a a e |
  a a a c a a b f |
  a a a c a b a f |
  a a a c b a a f |
  a a a e a a a f |
  a a b c a a a f |
  a b a c a a a f |
  b a a c a a a e |
  a a a c a a b f |
  a a a c a b a f |
  a a a c b a a f |
  a a a e a a a f |
  a a b c a a a f |
  a b a c a a a f |
  b a a c a a a e |
  a a a c a a b f |
  a a a c a b a f |
  a a a c b a a f |
  a a a e a a a f |
  a a b c a a a f |
}

marimbaTwo = \relative c, {
  \set Staff.midiInstrument = #"Marimba"

  \clef bass
  \key c \major
  \time 4/4
  \tempo 4=90

f8\f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
  f e a e f f f e |
  a e f f f e a e |
  f f f e a e f f |
}

vibraphoneOne = \relative c' {
  \set Staff.midiInstrument = #"Vibraphone"

  \clef treble
  \key c \major
  \time 4/4
  \tempo 4=90

e8\mp r e r f r b r |
  b r f r e r b r |
  f r b r e r c r |
  e r e r c r b r |
  e r f r e r f r |
  f r e r e r c r |
  b r e r f r b r |
  e r c r e r b r |
  f r e r b r c r |
  e r e r f r f r |
  e r f r e r b r |
  c r e r e r c r |
  e r b r f r b r |
  e r f r b r b r |
  f r e r e r a r |
  e r e r f r b r |
  b r f r e r b r |
  f r b r e r c r |
  e r e r c r b r |
  e r f r e r f r |
  f r e r e r c r |
  b r e r f r b r |
  e r c r e r b r |
  f r e r b r c r |
  e r e r f r f r |
  e r f r e r b r |
  c r e r e r c r |
  e r b r f r b r |
  e r f r b r b r |
  f r e r e r a r |
  e r e r f r b r |
  b r f r e r b r |
  f r b r e r c r |
  e r e r c r b r |
  e r f r e r f r |
  f r e r e r c r |
  b r e r f r b r |
  e r c r e r b r |
  f r e r b r c r |
  e r e r f r f r |
  e r f r e r b r |
  c r e r e r c r |
  e r b r f r b r |
  e r f r b r b r |
  f r e r e r a r |
  e r e r f r b r |
  b r f r e r b r |
  f r b r e r c r |
  e r e r c r b r |
  e r f r e r f r |
  f r e r e r c r |
  b r e r f r b r |
  e r c r e r b r |
  f r e r b r c r |
  e r e r f r f r |
  e r f r e r b r |
  c r e r e r c r |
  e r b r f r b r |
  e r f r b r b r |
  f r e r e r a r |
  e r e r f r b r |
  b r f r e r b r |
  f r b r e r c r |
  e r e r c r b r |
  e r f r e r f r |
  f r e r e r c r |
  b r e r f r b r |
  e r c r e r b r |
  f r e r b r c r |
  e r e r f r f r |
  e r f r e r b r |
  c r e r e r c r |
  e r b r f r b r |
  e r f r b r b r |
  f r e r e r a r |
}

vibraphoneTwo = \relative c' {
  \set Staff.midiInstrument = #"Vibraphone"

  \clef treble
  \key c \major
  \time 4/4
  \tempo 4=90

c8\mp c r f c r c f |
  r b c r a c r c |
  f r c b r f c r |
  c a r c c r e c |
  r c f r c c r a |
  b r c f r c c r |
  f c r b a r c c |
  r f c r c e r c |
  c r a c r c f r |
  b c r f c r c a |
  r c b r f c r c |
  f r c c r f c r |
  c f r c c r f b |
  r c a r c c r f |
  c r b f r c c r |
  a c r c e r c c |
  r f c r c a r b |
  c r f c r c f r |
  c b r a c r c f |
  r c c r e c r c |
  a r c c r f b r |
  c f r c c r a c |
  r b f r c c r f |
  c r c f r c c r |
  f c r c f r b c |
  r a c r c f r c |
  b r f c r c a r |
  c c r e c r c f |
  r c c r a b r c |
  f r c c r f c r |
  b a r c c r f c |
  r c e r c c r a |
  c r c f r b c r |
  f c r c a r c b |
  r f c r c f r c |
  c r f c r c f r |
  c c r f b r c a |
  r c c r f c r b |
  f r c c r a c r |
  c e r c c r f c |
  r c a r b c r f |
  c r c f r c b r |
  a c r c f r c c |
  r e c r c a r c |
  c r f b r c f r |
  c c r a c r b f |
  r c c r f c r c |
  f r c c r f c r |
  c f r b c r a c |
  r c f r c b r f |
  c r c a r c c r |
  e c r c f r c c |
  r a b r c f r c |
  c r f c r b a r |
  c c r f c r c e |
  r c c r a c r c |
  f r b c r f c r |
  c a r c b r f c |
  r c f r c c r f |
  c r c f r c c r |
  f b r c a r c c |
  r f c r b f r c |
  c r a c r c e r |
  c c r f c r c a |
  r b c r f c r c |
  f r c b r a c r |
  c f r c c r e c |
  r c a r c c r f |
  b r c f r c c r |
  a c r b f r c c |
  r f c r c f r c |
  c r f c r c f r |
  b c r a c r c f |
  r c b r f c r c |
  a r c c r e c r |
}

\book {
  \paper {
    between-system-space = 1.5\cm
    between-system-padding = #1
    ragged-bottom=##f
    ragged-last-bottom=##f

    oddHeaderMarkup = \markup \fill-line {
      "" \fromproperty #'page:page-number-string }
    evenHeaderMarkup = \markup \fill-line {
      "" \fromproperty #'page:page-number-string }
  }
  \bookpart {
    \header {
      title = "Modulus No.1"
      subtitle = "A Composition of Four Scripts"
      subsubtitle = "2010-12-30"
      composer = "Jeremy Mates"
      copyright = "© 2010 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
    }
    \score {
      \new StaffGroup <<
        \new Staff << \set Staff.instrumentName = #"Vibraphone 1" \vibraphoneOne >>
        \new Staff << \set Staff.instrumentName = #"Vibraphone 2" \vibraphoneTwo >>
        \new Staff << \set Staff.instrumentName = #"Marimba 1" \marimbaOne >>
        \new Staff << \set Staff.instrumentName = #"Marimba 2" \marimbaTwo >>
      >>
      \layout {
        indent = 2.5\cm
      }
      \midi { }
    }
  \markuplines { \paragraph { \tiny {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
} } }
  }
  \bookpart {
    \header {
      title = "Vibraphone No.1"
    }
    \score {
      \new Staff << \vibraphoneOne >>
    }
  }
  \bookpart {
    \header {
      title = "Vibraphone No.2"
    }
    \score {
      \new Staff << \vibraphoneTwo >>
    }
  }
  \bookpart {
    \header {
      title = "Marimba No.1"
    }
    \score {
      \new Staff << \marimbaOne >>
    }
  }
  \bookpart {
    \header {
      title = "Marimba No.2"
    }
    \score {
      \new Staff << \marimbaTwo >>
    }
  }
}

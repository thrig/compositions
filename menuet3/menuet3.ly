% LilyPond engraving system - http://www.lilypond.org/
%
% Experiment in rounded binary form, original theme from noodling many
% many months ago, somehow turned chromatic and quirky so went with the
% "mad clown" theme.
%
% This work is licensed under the Creative Commons Attribution 3.0 United
% States License. To view a copy of this license, visit
% http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
% Creative Commons, 171 Second Street, Suite 300, San Francisco,
% California, 94105.

\version "2.14.0"

\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

\header {
  title       = "Mad Clown Minuet"
  subtitle    = "(Alternate scoring w/ Bicycle Horn has been lost)"
  composer    = "Jeremy Mates"
  subsubtitle = "2011-11-29"
  copyright   = "© 2011 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

theviolin = \relative d'' {
  \key g \major
  \clef treble
  \tempo "Vivace un poco squilibrato" 4=144

  \time 6/8
  % but do not like the default 3+3 beaming that implies 2/4 time
  \set Timing.beatStructure = #'(6 6)

  \partial 4 d4 |

  \repeat volta 2 {
    g8(\mf fis\< g a\!\> g fis\! |
    e8\< c' b c\! a\> fis |
    g8 f e d\! ais\< b |
    c8 b c d dis e\! |

    fis8\> e d c b a\!) |
    g4-- r d'8(\mp g |
    fis8\< g a\! ais b) b,( |
    c8[ d e]) g( fis e) |

    a8 aes g e b(\< c |
    d8 e\!\> d c\!) fis( e |
    fis8\< g b ais b c\! |
    d8 c\> b bes a aes\!) |

    g4\f b,8-.\mp r d-. r |
    g8[( fis e]) c( d e |
    f8 fis g fis e cis) |
    d8 c!-. a-. fis-. b d |
  }

  \repeat volta 2 {
    c8[( b g]) e( g cis) |
    \key d \minor
    d8-.[ c-. bes-.] d( g bes) |
    c8( a g a) e( c |
    d8) bes g fis g c |

    d8-.\< d-. d-.\! d-.\> d-. d-.\! |
    e( g c, e g e) |
    d8( c bes c) \slurUp f,(\< fis\! |
    g8 gis a g e\> d\!) |
    \slurNeutral

    e8( a g f a) e( |
    f8 g a g) d'( c |
    bes8) b c cis d e |
    \key g \major
    g8(\mf fis\< g a\!\> g fis\! |

    e8\< c' b c\! a\> fis |
    g8 f e d\! ais\< b |
    c8 b c d dis e\! |
    fis8\> e d c b\!) d\! |
  }

  \relative g' { g2\f r4 }
  \bar "|."
}

% KLUGE copy of violin part, plus piano fingerings I use
upper = \relative d'' {
  \key g \major
  \clef treble
  \tempo "Vivace un poco squilibrato" 4=144

  \time 6/8
  % but do not like the default 3+3 beaming that implies 2/4 time
  \set Timing.beatStructure = #'(6 6)

  \partial 4 d4 |

  \repeat volta 2 {
    g8(\mf fis\< g a\!\> g fis\! |
    e8\< c' b c\! a\> fis |
    g8-3 f e-1 d\!-3 ais\<-2 b |
    c8 b c d-1 dis-3 e\! |

    fis8\> e d c b a\!) |
    g4-- r d'8(\mp g |
    fis8\< g-1 a\!-3 ais b)-5 b,( |
    c8[ d-1 e]) g( fis e) |

    a8 aes g e b(\< c |
    d8 e\!\> d-2 c\!) fis( e |
    fis8\< g-1 b-3 ais b c\! |
    d8 c\> b bes a aes\!) |

    g4\f b,8-.\mp r d-. r |
    g8[( fis e]) c( d e-1 |
    f8-3 fis g fis e cis-2) |
    d8-4 c!-. a-. fis-. b-2 d-1 |
  }

  \repeat volta 2 {
    c8[( b g]) e( g cis) |
    \key d \minor
    d8-.[ c-. bes-.] d( g bes) |
    c8( a g a) e( c |
    d8) bes g fis g c |

    d8-.\< d-. d-.\! d-.\> d-. d-.\! |
    e( g c, e g e) |
    d8( c bes c) \slurUp f,(\< fis\! |
    g8 gis a g e\> d\!) |
    \slurNeutral

    e8( a g f a) e( |
    f8 g a g) d'( c |
    bes8) b c cis d e |
    \key g \major
    g8(\mf fis\< g a\!\> g fis\! |

    e8\< c' b c\! a\> fis |
    g8 f e d\! ais\< b |
    c8 b c d dis e\! |
    fis8\> e d c b\!) d\! |
  }

  \relative g' { g2\f r4 }
  \bar "|."
}

thecello = \relative g {
  \key g \major
  \clef bass

  \partial 4 g4 |

  \repeat volta 2 {
    b8(\mf d g, d' b d) |
    a8( c e  c  e a,) |
    b8( d g, d' b d) |
    c8( e g, e c' e,) |

    d8( fis a fis a fis) |
    g8-.\< g-. g-.\! g-.\> g-. g-.\! |
    b8(\mf d a d b d) |
    c8( b c g c e) |

    c8( a c e c g) |
    a8( c fis, c' fis, a) |
    b8( d g, d' b d) |
    fis,8( a c a c fis, ) |

    g8-.\< g-. g-.\! g-.\> g-. g-.\! |
    c,8(\mp e g e g e) |
    c8( a' e a e a) |
    d,8( fis a c a g) |
  }

  \repeat volta 2 {
    e8( g c g c e,) |
    \key d \minor
    g8( d g bes g d) |
    a'8( c e c e a,) |
    bes8( d des c ces bes) |

    a4 f8-. r d'-. r |
    c( bes a g d e) |
    f8( a c a c a) |
    e8( g bes g bes g) |

    a8( c e, a c a) |
    d,8[( a' f]) e( g a) |
    bes8( g d e g c) |
    \key g \major
    b8(\mf d g, d' b d) |

    a8( c e  c  e a,) |
    b8( d g, d' b d) |
    c8( e g, e c' e,) |
    d8( fis a fis a fis) |
  }

  g2\f r4
  \bar "|."
}

% KLUGE copy of cello part, plus piano fingerings I use
lower = \relative g {
  \key g \major
  \clef bass

  \partial 4 g4 |

  \repeat volta 2 {
    b8(\mf d g, d' b d) |
    a8( c e  c  e a,) |
    b8( d g, d' b d) |
    c8( e g, e c' e,) |

    d8( fis a fis a fis) |
    g8-.\<-2 g-.-1 g-.\! g-.\> g-. g-.\!-5 |
    b8(\mf d a d b d) |
    c8( b c g c e) |

    c8( a-4 c e c g) |
    a8( c fis, c' fis, a-3) |
    b8( d g, d' b d) |
    fis,8( a c a c fis,-2 ) |

    g8-.\< g-. g-.\! g-.\> g-. g-.\! |
    c,8(\mp e g e g e) |
    c8( a' e a e a) |
    d,8( fis a c a-4 g) |
  }

  \repeat volta 2 {
    e8( g c g c e,) |
    \key d \minor
    g8( d g bes g d) |
    a'8( c e c e a,) |
    bes8( d des c ces bes) |

    a4 f8-. r d'-. r |
    c( bes a g d e) |
    f8( a c a c a) |
    e8( g bes g bes g) |

    a8( c e, a c a) |
    d,8[( a' f]) e( g a) |
    bes8( g d e g c) |
    \key g \major
    b8(\mf d g, d' b d) |

    a8( c e  c  e a,) |
    b8( d g, d' b d) |
    c8( e g, e c' e,) |
    d8( fis a fis a fis) |
  }

  g2\f r4
  \bar "|."
}
asStrings = {
  \new StaffGroup <<
    \new Staff <<
      \set Staff.instrumentName = #"Violin"
      \set Staff.midiInstrument = #"violin"
      \theviolin
    >>
    \new Staff <<
      \set Staff.instrumentName = #"Cello"
      \set Staff.midiInstrument = #"cello"
      \thecello
    >>
  >>
}

asPiano = {
  \new PianoStaff <<
    \set PianoStaff.midiInstrument = #"honky-tonk"
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
}

\book {
  \bookpart {
    \score {
      \asStrings
      \layout { }
    }
  }
  \bookpart {
    \header {
      title = "Mad Clown Minuet"
      subtitle = "w/ Piano Fingerings"
      subsubtitle = ""
      composer = " "
    }
    \score {
      \asPiano
      \layout { }
    }
    \score {
      \unfoldRepeats \articulate {
        \asPiano
      }
      \midi { }
    }
  }
}

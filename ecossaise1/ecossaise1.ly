% LilyPond engraving system - http://www.lilypond.org/
%
% Mostly based on a study of Ecossaise in E Flat by B. and noodling around
% on the piano, plus to learn how to do the 1. / 2. repeat in LilyPond.
%
% MIDI -> mp3 conversion via the "harmo_bjf.SF2" soundfont:
% http://www-gmm.insa-toulouse.fr/~guillaum/PIANO/voiced_sfbank.html
%
% http://soundcloud.com/thrig

\version "2.14.0"

% http://www.mail-archive.com/lilypond-user@gnu.org/msg38823.html
\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

\header {
  title = "Ecossaise in A Flat"
  composer = "Jeremy Mates"
  subtitle = "(Mostly just a study of WoO 86)"
  subsubtitle = "2011-06-24"
  copyright = "© 2011 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
}

firstBitUpper = \relative c'' {

  aes8-.\f aes-. bes-. bes-. |

  \repeat volta 2 {
    ees4 c8-. c-. |
    ees4 bes8-. bes-. |
    ees4 aes, |
    bes4 des\mordent |

    c4 aes8-. aes-. |
    % this needed c des to lead nicely to the E, d4 out of place in rhythm
    bes8-. bes-. c des |
    ees4 g,8-. g-. |
  }
  \alternative {
    { aes4. bes8-. | }
    { bes4. des8-. | }
  }
}

firstBitLower = \relative c' {

  R2 |

  \repeat volta 2 {
    % Double counterpoint at 12th, roughly following upper voice
    aes4\f c |
    aes4 des |
    % 6-5 motion on f-ees as felt like it
    aes4 f'8-. ees-. |
    des8 c bes4 |

    % worked out harmonically, boring I6 ii6 V I
    c4 ees |
    des4 f |
    ees4 c |
  }
  \alternative {
    { aes4 ees'8-. g,-. | }
    { ees'4  bes4 | }
  }
}


secondBitUpper = \relative c'' {

  \set Score.tempoHideNote = ##t

  \repeat volta 2 {
    aes8\( bes\) c-| des-| |
    ees4 g,8\( f\) |
    g8\( aes\) bes-| c-| |
    des4 bes\mordent |

    ees4 g,\mordent |
    aes4 bes8-. bes-. |
    c4 bes8-| bes-| |
  }
  \alternative {
    { c8[\( bes aes g]\) | }
    { \tempo 4=108 aes4_\markup { \italic "rit." } \tempo 4=96 bes |
      \tempo 4=72 aes4 r
       \bar "|." }
  }
}

secondBitLower = \relative c' {
  \repeat volta 2 {
    ees4 g,8 aes |
    bes8\( aes\) c-| des-| |
    ees4 g,8 f |
    ees8\( des\) ees-| f-| |

    g4 bes4 |
    c4 ees, |
    g4 ees |
  }
  \alternative {
    { aes4 c | }
    { aes4 ees |
      aes4 r
       \bar "|." }
  }
}

upper = {
  \clef treble
  \key aes \major
  \time 2/4
  \tempo "Allegro" 4=126

  \firstBitUpper
  \secondBitUpper
}

lower = {
  \clef bass
  \key aes \major
  \time 2/4
 
  \firstBitLower
  \secondBitLower
}

theMusic = {
  \new PianoStaff <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
}

\book {
\score {
  \theMusic
  \layout { }
}
\score {
  \unfoldRepeats \articulate {
    \set Score.midiChannelMapping = #'instrument
    \theMusic
  }
  \midi { }
}
  \markuplines { \paragraph \tiny { {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105.
} } }
}

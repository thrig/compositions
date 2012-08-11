%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      MMD      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% LilyPond engraving system - http://www.lilypond.org/                    %
%                                                                         %
%  No Markov chains were harmed during the construction of this work.     %

\version "2.14.0"

\header {
  title       = "Musical Mismatch: Doodle - DRAFT"
  subtitle    = "http://millieho.net/2012/08/06/doodle-musical-mismatch/"
  composer    = "Jeremy Mates"
  subsubtitle = "2012-??-??"
% copyright   = "© 2012 CC Attribution 3.0 United States License"
  tagline     = ##f
}

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

\include "articulate.ly"

%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Upper     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %

voiceoneone = {
  \set Score.tempoHideNote = ##t
  \tempo "Moderato con rubato" 4=121

  \repeat volta 2 {
    r128 g'8....\mp f'2 \tempo 4=119 r4 |
    g'2 ges'4 d'4\mf |
    a'4\p \tempo 4=116 r2 \tempo 4=86 r128 b'8....~ |
    b'4 \tempo 4=108 f'4\mp f'2 |

    \tempo 4=80 d'2 \tempo 4=108 g'2~ |
    \tempo 4=116 g'2 \tempo 4=119 r128 g'8....\mf g'4~ |
    g'2. \tempo 4=108 r4 |
    r4 \tempo 4=136 r128 bes'8....\mp( ges'4 \tempo 4=123 d'4)~ |

    \tempo 4=96 d'2. \tempo 4=88 bes'4~\mf |
    bes'4 \tempo 4=119 d'4 a'4\p r128 a'8....~ |
    a'2. ges'4~\mf^( |
    ges'4 a'2.~ |

    a'4 \tempo 4=72 f'2.\mp) |
  }
  \tempo 4=109 d'4(\p \tempo 4=71 g'2.) |
  \bar "||"
}

voiceonetwo = {
  \set Score.tempoHideNote = ##f

  \tempo "Tempo semplice" 4=120 g'4\mf d' des' g'~ |
  g'4 a' r2 |
  r4 c'4 g'2 |
  aes'4 d'4 aes'4( f'4 |

  g'4) c'4 g'4 r4 |
  r2 c'4 e'4 |
  e'1 |
  f'2 d'4 b'4 |

  d'2 a'4 ees'4~ |
  ees'4 b'4 g'2 |
  g'4 g'4 r4 a'4~ |
  a'4 c'2 c'4 |

  e'4 r4 des'4 g'4~ |
  g'4 f'4 d'4( d'4) |
  g'4( a'4) c'2 |
  a'4 a'4 a'2 |

  b'2 a'4 e'4 |
  d'4 a'4 ges'4 r4 |
  des'1 |
  g'4 r4 r2 |
}

%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Lower     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %

voicetwoone = {
  \repeat volta 2 {
    g4\mp r4 g4\p g4~ |
    g4 d2\mf r4 |
    r4 f2\mp des4~\mf |
    des4 r2. |

    r128 a8....\mp r2 e4 |
    bes2\mf g4 e4 |
    f2 aes2\p( |
    b4\mf f4\p aes4 r128 g8....~) |

    g4 f4 a4 r128 a8....~ |
    a2. f4~\mf |
    f4 ees2 r128 b8.... |
    aes2 g2 |

    R1
  }
  R1
  \bar "||"
}

voicetwotwo = {
  g4\mf^"1" g4 r4 a4~ |
  a4 c2 c4 |
  e4 r4 des4 g4~ |
  g4 f4 d4( d4) |

  g4( a4) c2 |
  a4 a4 a2 |
  b2 a4 e4 |
  d4 a4 ges4 r4 |

  des1 |
  g4 r2. |
  g4^"2" d des g~ |
  g4 a r2 |

  r4 c4 g2 |
  aes4 d4 aes4( f4 |
  g4) c4 g4 r4 |
  r2 c4 e4 |

  e1 |
  f2 d4 b4 |
  d2 a4 ees4~ |
  ees4 b4 g2 |
% XXX these were added, truncate if have a better extension
% r4\sustainOff\sustainOn d4\sustainOff\sustainOn g2~ |
% g2 c2
}

%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Pedal     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %

pedalone = {
  \repeat volta 2 {
    s4\sustainOn s4\sustainOff\sustainOn s2 |
    s2. s4\sustainOff\sustainOn |
    s4\sustainOff\sustainOn s2\sustainOff\sustainOn s4\sustainOff |
    s1 |

    s128\sustainOn s8.... s2. |
    s2\sustainOff\sustainOn s2\sustainOff\sustainOn |
    s2\sustainOff s2 |
    s1 |

    s4\sustainOn s4\sustainOff\sustainOn s4 s128 s8....\sustainOff |
    s2. s4\sustainOn |
    s2. r128 s8....\sustainOff |
    s1\sustainOn |

    s1
  }
  s4 s2.\sustainOff\sustainOn
}

pedaltwo = {
  % 1
  s4\sustainOff s4 s2\sustainOn |
  s4 s2\sustainOff\sustainOn s4 |
  s4 s4\sustainOff\sustainOn s2 |
  s4\sustainOff s2. |

  s2 s2\sustainOn |
  s4\sustainOff s4 s2\sustainOn |
  s2\sustainOff\sustainOn s2 |
  s4\sustainOff\sustainOn s2 s4\sustainOff |

  s1\sustainOn |
  s4 s4\sustainOff\sustainOn s4\sustainOff\sustainOn s4 |
  % 2
  s4\sustainOff s4 s2\sustainOn |
  s4 s2\sustainOff\sustainOn s4 |

  s4 s4\sustainOff\sustainOn s2 |
  s4\sustainOff s2. |
  s2 s2\sustainOn |
  s1\sustainOff\sustainOn |

  s2\sustainOff\sustainOn s2 |
  s4\sustainOff\sustainOn s2 s4\sustainOff |
  s1\sustainOn |
  s4 s4\sustainOff\sustainOn s4\sustainOff\sustainOn s4 |
}

%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Misc.     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %

voiceone = {
  \clef treble
  \voiceoneone
  \voiceonetwo
  \bar "|."
}

voicetwo = {
  \clef bass
  \voicetwoone
  \voicetwotwo
  \bar "|."
}

pedal = {
  \pedalone
  \pedaltwo
}

theblackdots = {
  <<
    \new PianoStaff <<
      \override Score.BarNumber #'break-visibility = #'#(#t #t #t)
      \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)

      \set PianoStaff.pedalSustainStyle = #'bracket

      \new Staff = "upper" \voiceone
      \new Staff = "lower" \voicetwo
      \new Dynamics = "pedal" \pedal
    >>
  >>
}

themusic = {
  <<
    \new PianoStaff <<
      \set Score.midiChannelMapping = #'instrument
      \new Staff = "upper" \voiceone
      \new Staff = "lower" \voicetwo
    % as otherwise dynamics are not picked up on by player
      \new Staff = "pedal" \pedal
    >>
  >>
}


\score {
  \theblackdots
  \layout { }
}
\score {
  \unfoldRepeats \articulate { \themusic }
  \midi { }
}
  \markuplines { \paragraph {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105.
} }

%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      FIN      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

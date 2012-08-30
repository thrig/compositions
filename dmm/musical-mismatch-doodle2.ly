%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      MMD      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %
% LilyPond engraving system - http://www.lilypond.org/
%
% Built from doodle-interval-gen* scripts (intervals derived from the
% note probabilities in base-odds.json).

\version "2.14.0"

\header {
  title       = "Musical Mismatch: Doodle 2"
  subtitle    = "(by intervals)"
  composer    = "Jeremy Mates"
  subsubtitle = "2012-08-28"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

\include "articulate.ly"

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Upper     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

voiceoneone = {
  \set Score.tempoHideNote = ##t
  \tempo "Moderato" 4=116

  r4
  \repeat volta 2 {
    \tempo 4=116
    r4 a'8(\mf a'8 a'8 a'8) |
    r2 g'4( g'8 g'8 |
    g'8) r2 d'8( d'4 |
    d'8 d'8) r2 bes'8( bes'8 |

    bes'4 bes'8) r2 des'8( |
    des'8 des'8 des'4) r2 |
    aes'8( aes'8 aes'8 aes'4) r4. |
    r8 ees'8( ees'8 ees'8 ees'8) r8 r4 |

    r8 aes'8( aes'4 aes'8 aes'8) \tempo 4=108 r4 |
  }
}

voiceonetwo = {
  \repeat volta 2 {
    \tempo 4=112
    g'1~ |
    g'2-- r4 bes'4~ |

    bes'4.-- r8 r2 |
    a'2. g'4( |
    a'2) r4 f'8( aes'8 |
    ges'4 ees'8) r8 r2 |

    bes'2. a'4( |
    bes'2) r4 g'8( e'8 |
    bes'2.) a'4( |
    g'1) |

    g'2 r4 ees'8( ges'8 |
    e'4 des'4.) r4. |
    ees'1 |
    ees'2 r4 f'4( |

    d'2. c'4 |
    f'1) |
    f'2 r4 g'8( bes'8 |
    aes'4 \tempo 4=108 f'2.) |
  }

  g'1~ |
  \tempo 4=114
  g'2~ \tempo 4=116 g'2 |

  r4
  \repeat volta 2 {
    \tempo 4=116
    r4 a'8( a'8 a'8 a'8) |
    r2 g'4( g'8 g'8 |
    g'8) r2 d'8( d'4 |
    d'8 d'8) r2 bes'8( bes'8 |

    bes'4 bes'8) r2 des'8( |
    des'8 des'8 des'4) r2 |
    aes'8( aes'8 aes'8 aes'4) r4. |
    r8 ees'8( ees'8 ees'8 ees'8) r8 r4 |

    r8 aes'8( aes'4 aes'8 aes'8) \tempo 4=96 r4 |
  }

  g'1\fermata\p |
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Lower     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

voicetwoone = {
  r4
  \repeat volta 2 {
    d2\mf d4 |
    g4 g4 ees2 |
    ees4 a,4 a,4 bes,4~ |
    bes,4 bes,4 e,4 e,4 |

    ges,2 ges,4 g,4 |
    g,4 f,2 f,4 |
    des,4 des,4 g,2 |
    g,4 ees,4 ees,4 e,4~ |

    e,4 e,4 d,4 d,4--_\markup { \italic "poco rit." } |
  }
}

voicetwotwo = {
  \repeat volta 2 {
    g,1-- |
    g,2-- g2 |

    d1-- |
    r2 e4-- r4 |
    ees2-- ees2 |
    r2 f4-- r4 |

    g2-- g2 |
    r2 d4-- r4 |
    e2-- e2 |
    r2 d4-- r4 |

    bes,2-- bes,2 |
    r2 g,4-- r4 |
    b,2-- b,2 |
    r2 ges,4-- r4 |

    bes,2-- bes,2 |
    r2 aes,4-- r4 |
    f,2-- f,2 |
    r2 d,4-- r4 |
  }

  g,1~ |
  g,4_\markup { \italic "unrit." } d2 d4~ |

  d4
  \repeat volta 2 {
    d2 d4 |
    g4 g4 ees2 |
    ees4 a,4 a,4 bes,4~ |
    bes,4 bes,4 e,4 e,4 |

    ges,2 ges,4 g,4 |
    g,4 f,2 f,4 |
    des,4 des,4 g,2 |
    g,4 ees,4 ees,4 e,4~ |

    e,4 e,4 d,4 d,4--_\markup { \italic "poco rit." } |
  }

  g,1\p |
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Pedal     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

pedalone = {
  s4
  \repeat volta 2 {
    s4 s2\sustainOn |
    s2.\sustainOff s8\sustainOn s16 s32 s64 s128 s128\sustainOff |
    s2. s4\sustainOn |
    s8 s8 s4\sustainOff s4 s8 s8 |

    s4. s8 s4. s8\sustainOn |
    s8 s8\sustainOff s8 s8 s2 |
    s4.\sustainOn s8\sustainOff s2 |
    s4 s4\sustainOn s8 s8\sustainOff s4 |
    s1 |
  }
}

pedaltwo = {
  \repeat volta 2 {
    s1 |
    s8\sustainOn s s s  s s\sustainOff s s |

    s8 s s s  s s s s |
    s8 s s\sustainOn s  s s s\sustainOff s |
    s8 s s s  s s s s |
    s8 s s\sustainOn s  s s s\sustainOff s |

    s8 s s s  s\sustainOn s s s |
    s8 s s s  s s s\sustainOff s |
    s8 s s s  s\sustainOn s s s |
    s8 s s s  s s s\sustainOff s |

    s8 s s s  s s s s |
    s8 s s\sustainOn s  s s s\sustainOff s |
    s8 s s s  s\sustainOn s s s |
    s8 s s s  s s s\sustainOff s |

    s8 s s s  s\sustainOn s s s |
    s8 s s s  s s s\sustainOff s |
    s8 s s s  s s s s |
    s8 s s\sustainOn s  s s s\sustainOff s |
  }

  s1 |
  s1 |

  s4
  \repeat volta 2 {
    s4 s2\sustainOn |
    s2.\sustainOff s8\sustainOn s16 s32 s64 s128 s128\sustainOff |
    s2. s4\sustainOn |
    s8 s8 s4\sustainOff s4 s8 s8 |

    s4. s8 s4. s8\sustainOn |
    s8 s8\sustainOff s8 s8 s2 |
    s4.\sustainOn s8\sustainOff s2 |
    s4 s4\sustainOn s8 s8\sustainOff s4 |
    s1 |
  }

  s1 |
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Misc.     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

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
%     \override Score.BarNumber #'break-visibility = #'#(#t #t #t)
%     \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)

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
    % as otherwise Dynamics are not picked up on by player
      \new Staff = "pedal" \pedal
    >>
  >>
}

\score {
  \theblackdots
  \layout { }
}
\score {
% DBG
  \unfoldRepeats \articulate { \themusic }
% \articulate { \themusic }
  \midi { }
}

%  \markuplines { \paragraph {
%This work is licensed under the Creative Commons Attribution 3.0 United
%States License. To view a copy of this license, visit
%http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
%Creative Commons, 171 Second Street, Suite 300, San Francisco,
%California, 94105.
%} }

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      FIN      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

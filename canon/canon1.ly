% LilyPond engraving system - http://www.lilypond.org/
%
%% timidity --config-file=organ.cfg

\version "2.14.0"
\include "articulate.ly"

\header {
  title       = "A Simple Canon"
  composer    = "Jeremy Mates"
  subsubtitle = "2012-09-03"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Upper     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

keytempoetc = {
  \set Score.tempoHideNote = ##t
  \tempo 4=120
  \key a \dorian
  \time 2/4
}

voiceone = \relative e' {
  \keytempoetc
  \clef treble

  R2 R2
  \repeat volta 2 {
    e4( fis8 g
    fis8 e d4->)
    e4-. c-.
    fis4( e)
    d2->
  }
  e2~
  e2
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Lower     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

voicetwo = \relative a {
  \keytempoetc
  \clef alto

  a4( b8 c
  b8 a g4->)
  \repeat volta 2 {
    a4-. fis-.
    b4( a)
    g2->
    a4( b8 c
    b8 a g4->)
  }
  a2~
  a2
}

timpani = \relative a {
  \set Staff.instrumentName = #"Timpani"
  \set Staff.midiInstrument = #"timpani"

  \keytempoetc
  \clef bass

  a4 a8 a a a a4
  \repeat volta 2 {
    e4 e8 e e e e4
    e4 a4
    a4 a8 a a a a4
  }
  a4 a8 a a a a a

  \bar "|."
}

tambourine = {
  \set RhythmicStaff.instrumentName = #"Tambourine"

  \drummode {
    \keytempoetc
    maracas8 maracas8 r4 R2
    \repeat volta 2 {
      maracas8 maracas8 r4 R2
      maracas4 maracas8 maracas8
      maracas8 maracas8 r4 R2
    }
    maracas4 maracas8 maracas8 maracas8 maracas8 maracas8 maracas8 
  }

  \bar "|."
}

%                                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Misc.     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                           %

upper = {
  \set Staff.instrumentName = #"Oboe"
  \set Staff.midiInstrument = #"oboe"
  \voiceone

  \bar "|."
}

lower = {
  \set Staff.instrumentName = #"Bassoon"
  \set Staff.midiInstrument = #"bassoon"
  \voicetwo

  \bar "|."
}

theblackdots = {
  <<
    \new StaffGroup <<
      \override Score.BarNumber #'break-visibility = #'#(#t #t #t)
      \set Score.barNumberVisibility = #(every-nth-bar-number-visible 2)

      \new Staff = "upper" \upper
      \new Staff = "lower" \lower
      \new RhythmicStaff = "tambourine" \tambourine
      \new Staff = "timpani" \timpani
    >>
  >>
}

themusic = {
  <<
    \new PianoStaff <<
      \set Score.midiChannelMapping = #'instrument
      \new Staff = "upper" \upper
      \new Staff = "lower" \lower
      \new Staff = "timpani" \timpani
      \new DrumStaff = "tambourine" \tambourine
    >>
  >>
}

\score {
  \theblackdots
  \layout { indent = 2\cm }
}
\score {
  \unfoldRepeats \articulate { \themusic }
  \midi { }
}

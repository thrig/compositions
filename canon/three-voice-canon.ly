%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% LilyPond engraving system - http://www.lilypond.org/                       %
%                                                                            %

\version "2.18.2"

\header {
  title = "Canon in Three Voices"
  subsubtitle = "2014-11-22"
  composer    = "Jeremy Mates"
  copyright   = \markup { \teeny {
"© 2014 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline     = ##f
}

keytempoetc = {
  \set Score.tempoHideNote = ##t
  \tempo "Fast" 4=166
  \key g \minor
  \time 4/4
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %

principal = \relative g' {
  \keytempoetc
  \clef treble

  g2
  f2
  ees1
  d2
  f2
  ees2
  c2~
 \repeat volta 2 {
  c1
  d2
  bes'2
  a2
  g2
  d2
  bes2
  g'1
  c2
  d2
  g,2
  f2
  ees1
  d2
  c2
  b2
  c2
  a'1
  bes2
  g2
  aes1
  aes2
  g2~
  g2
  c,2
  a2
  f'2
  ees2
  g2~
  g2
  fis2
  g2
  d'2
  ees2
  ees,2
  d1
  bes'1
  a2
  c2
  bes2
  f2
  g1
  f4
  g4
  a2
  g4
  f4
  ees2
  f4
  g4
  a2
  bes1
  a2
  g2
  fis2
  g2
  ees4
  f4
  g2
  a2
  g2~
  g2
  f2
  ees2
  d2
  d'4
  bes4
  c4
  d4
  bes4
  c4
  a4
  bes4
  c1
  g1
  c1
  d1
  g,2
  bes2
  f2
  a2
 }
 \alternative {
  {
    g2
    f2
    ees1
    d2
    f2
    ees2
    c2
  }
  {
    \relative b' {
      bes1~
      bes2
      r2
    }
  }
 }
}

responseone = \relative b' {
  \keytempoetc
  \clef treble

  R1*2
  bes2
  a2
  g1
 \repeat volta 2 {
  f2
  a2
  g2
  ees2~
  ees1
  f2
  d'2
  c2
  bes2
  f2
  d2
  bes'1
  ees2
  f2
  b,2
  a2
  g1
  f2
  ees2
  d2
  ees2
  c'1
  d2
  b2
  c1
  c2
  bes2~
  bes2
  ees,2
  c2
  a'2
  g2
  bes2~
  bes2
  a2
  bes2
  f'2
  g2
  g,2
  f1
  d'1
  c2
  ees2
  d2
  a2
  bes1
  a4
  bes4
  c2
  bes4
  a4
  g2
  a4
  b4
  c2
  d1
  c2
  bes2
  a2
  bes2
  g4
  a4
  bes2
  c2
  bes2~
  bes2
  a2
  g2
  f2
  f'4
  d4
  ees4
  f4
  d4
  ees4
  c4
  d4
  ees1
  bes1
  ees1
  f1
 }
 \alternative {
  {
    bes,2
    d2
    a2
    c2
    bes2
    a2
    g1
  }
  {
    \relative g'' {
      g1~
      g2
      r2
    }
  }
 }
}

responsetwo = \relative c {
  \keytempoetc
  \clef bass

  g1 c1 bes1 ees1
 \repeat volta 2 {
  d2
  c2
  bes1
  a2
  c2
  bes2
  g2~
  g1
  a2
  f'2
  ees2
  d2
  a2
  f2
  d'1
  g2
  a2
  d,2
  c2
  bes1
  aes2
  g2
  f2
  g2
  ees'1
  f2
  d2
  ees1
  ees2
  d2~
  d2
  g,2
  ees2
  c'2
  bes2
  d2~
  d2
  c2
  d2
  a'2
  bes2
  bes,2
  a1
  f'1
  ees2
  g2
  f2
  c2
  d1
  c4
  d4
  ees2
  d4
  c4
  b2
  c4
  d4
  ees2
  f1
  ees2
  d2
  c2
  d2
  bes4
  c4
  d2
  ees2
  d2~
  d2
  c2
  bes2
  a2
  a'4
  f4
  g4
  a4
  f4
  g4
  ees4
  f4
  g1
  d1
 }
 \alternative {
   {
     g1
     a1
     d,2
     f2
     c2
     ees2
   }
   {
     \relative c {
       g1~
       g2
       r2
     }
   }
 }
}

topv = {
  \set Staff.midiInstrument = #"fx 4 (atmosphere)"
  \responseone

  \bar "|."
}

midv = {
  \set Staff.midiInstrument = #"fx 4 (atmosphere)"
  \principal

  \bar "|."
}

botv = {
  \set Staff.midiInstrument = #"fx 4 (atmosphere)"
  \responsetwo

  \bar "|."
}

theblackdots = {
  <<
    \new StaffGroup <<
      \new Staff = "voice1" <<
        \topv
      >>
      \new Staff = "principal" <<
        \midv
      >>
      \new Staff = "voice2" <<
        \botv
      >>
    >>
  >>
}

themusic = {
  <<
    \new StaffGroup <<
      \set Score.midiChannelMapping = #'staff
      \new Staff = "voice1" \topv
      \new Staff = "principal" \midv
      \new Staff = "voice2" \botv
    >>
  >>
}

\score {
  \theblackdots
  \layout { }
}
\score {
  \unfoldRepeats { \themusic }
  \midi { }
}

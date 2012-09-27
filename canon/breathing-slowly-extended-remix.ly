% LilyPond engraving system - http://www.lilypond.org/
%
% Inverse Canon (plus a Clarinet). Probably too long, compared to the
% shorter version, without redeeming modulation or other interest in the
% middle. However, variations on the shorter version could be made by
% picking different Clarinet lines from this one.

\version "2.16.0"
\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?) (interpret-markup-list layout props (make-justified-lines-markup-list (cons (make-hspace-markup 4) args))))

\header {
  title       = "Breathing Slowly - Extended Remix"
  subtitle    = "Inverse Canon (plus Clarinet)"
  subsubtitle = "2012-09-23"
  composer    = "Jeremy Mates"
  copyright   = "© 2012 Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

keytempoetc = {
  \tempo "Adagio Tranquillamente" 4=70
  \time 4/4
}

voiceone = \relative g' {
  \keytempoetc
  \key g \major
  \clef treble

  g1->\mf
  \bar "||"
  a->\mp d-> c-> e-> g-> a-> g,->
  \bar "||"
  a-> d-> c-> e-> g-> a-> g,->
  \bar "||"
  a-> d-> c-> e-> g-> a-> g,->
  \bar "||"
  a-> d-> c-> e-> g-> a-> g,->

  \bar "||"
  a-> b-> a\p g--\pp
}

voicetwo = \relative c' {
  \keytempoetc
  \key g \major
  \clef bass

  R1
  \bar "||"
  c->\p b-> fis-> g-> e-> c-> b->
  \bar "||"
  c'-> b-> fis-> g-> e-> c-> b->
  \bar "||"
  c'-> b-> fis-> g-> e-> c-> b->
  \bar "||"
  c'-> b-> fis-> g-> e-> c-> b->

  \bar "||"
  fis'-> g-> d\pp g--\ppp
}

voicethree = \relative a' {
  % for Clarinet
  \transposition bes
  \keytempoetc
  \key a \major
  \clef treble

  R1

  \bar "||"
  b1->\pp cis-> b-> cis-> cis-> d-> e->

  \bar "||"
  fis,1-> cis'-> b-> cis-> cis-> b-> cis->

  \bar "||"
  fis,1-> a-> b-> cis-> d-> d-> e->

  \bar "||"
  d1-> a-> b-> cis-> fis-> fis-> e->

  \bar "||"
  d1-> cis-> gis\ppp a--\pppp
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

middle = {
  \set Staff.instrumentName = \markup { Clarinet B\flat }
  \set Staff.midiInstrument = #"clarinet"
  \voicethree

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
      \new Staff = "middle" \middle
      \new Staff = "lower" \lower
    >>
  >>
}

themusic = {
  <<
    \new PianoStaff <<
      \set Score.midiChannelMapping = #'instrument
      \new Staff = "upper" \upper
      \new Staff = "middle" \middle
      \new Staff = "lower" \lower
    >>
  >>
}

\score {
  \theblackdots
  \layout { indent = 2.3\cm }
}
\score {
  \articulate { \themusic }
  \midi { }
}

\markuplist { \vspace #1 \paragraph {
The Oboe melodic peak may need dynamic reduction to avoid drowing out the other voices; aim for simplicity and balance (and the Basson a slight increase on the C to B descent before the barline?). Notes should be attacked very softly, and show a slight <> dynamic, probably longer on the increase, as one does when breathing. Avoid a fermata on the final note; holding it and the penultimate note slightly longer than the previous notes should suffice.
} }

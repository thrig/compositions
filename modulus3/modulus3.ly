% LilyPond engraving system - http://www.lilypond.org/
%
% http://soundcloud.com/thrig

\version "2.16.0"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

keyTempoEtc = {
  \clef treble
  \key c \major
  \time 12/4
  \tempo 4=216
}

voiceOne = {
  \include "voice1.ly"
  e'4 e'4 e'8 e'8 e'4 e'4 e'4 e'8 e'8 e'8 e'8 e'4 e'8 e'8 e'2\ff
  \bar "||"
}

voiceTwo = {
  \include "voice2.ly"
  a'8 a'8 a'8 a'8 a'8 a'8
  a'8 a'8 a'8 a'8 a'8 a'8
  a'8 a'8 a'8 a'8 a'8 a'8
  a'8 a'8 g'2\ff
  \bar "||"
}

voiceThree = {
  \include "voice3.ly"
  ais'4 ais'4 ais'4 ais'8 ais'8 ais'4 ais'8 ais'8 ais'4 ais'8 ais'8 ais'8 ais'8 ais'4 b'2\f
  \bar "||"
}

voiceFour = {
  \include "voice4.ly"
  e''4 e''4 e''4 e''4 e''8 e''8 e''4 e''4 e''4 e''8 e''8 d''8 d''8 e''2\f
  \bar "||"
}

\book {
  \paper {
    #(set-paper-size "arch a")
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
      title = "Modulus No.3"
      subsubtitle = "2011-07-30"
      composer = "Jeremy Mates"
      copyright = "© 2011 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
    }
    \score {
      \new StaffGroup <<
        \new Staff <<
          \set Staff.instrumentName = #"Xylophone"
          \set Staff.midiInstrument = #"xylophone"

          \keyTempoEtc
          \voiceFour
        >>
        \new Staff <<
          \set Staff.instrumentName = #"Xylophone"
          \set Staff.midiInstrument = #"xylophone"

          \keyTempoEtc
          \voiceThree
        >>
        \new Staff <<
          \set Staff.instrumentName = #"Xylophone"
          \set Staff.midiInstrument = #"xylophone"

          \keyTempoEtc
          \voiceTwo
        >>
        \new Staff <<
          \set Staff.instrumentName = #"Xylophone"
          \set Staff.midiInstrument = #"xylophone"

          \keyTempoEtc
          \voiceOne
        >>
      >>
      \layout { indent = 2.5\cm }
      \midi { }
    }
  \markuplist { \paragraph { \tiny {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
} } }
  }
}

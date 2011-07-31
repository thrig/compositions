% LilyPond engraving system - http://www.lilypond.org/
%
% https://secure.wikimedia.org/wikipedia/en/wiki/Istrian_scale
%
% So will be trying E-F-G-Ab-Bb-Cb via some modulus math related code;
% interval pattern 1, 2, 1, 2, 1. Wacky.
%
% Instruments in GeneralUser_GS_SoftSynth_v1.43.sf2 set of interest:
%
% tenor sax - A
%   * maybe (use right register) - hmmm - good harmonics
%   * good at 96 tempo
%   * TODO transposing instrument, fix for that
%
% shanai - B+
%   * hmm! - hmmm. (Indian, so very close but so very wrong?)
%   * loud, relative to others, so would have to adjust if mixing
%   * lower score if want to get U.S.A. folks to play? (or use notes
%     this instrument may not be capable of?)
%
% clarinet - B
%   * interesting - good harmonics, brash
%   * 96 fine, etc.
%   * TODO would have to mark as Bflat or whatever type Clarinet
%     required (though I don't think the range will vary too much?)
%
% oboe - B
%   * hmmm (sounds diff in diff registers? test) - laid back harmonics
%   * 96 fine, prolly easily could go faster
%
% viola - B
%   * nice darker sound, bit smooth in mod#1 pattern, likely good
%     contrast if add multiple instruments?
%
% bassoon - B-
%   * maybe - harmonics ok - harmonics mushy?
%   * tested in too high a register? Hmm in lower. Might have tempo problem?
%
% muted trumpet - C-
%   * curious, exotic - harmonics a little disturbing :)
%   * did not like with mod#1 pattern.
%
% Only two voices, or could have multiple instruments that swap places with
% one another so one two sounding at one time?
%
% http://soundcloud.com/thrig

\version "2.12.3"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

keyTempoEtc = {
  \clef treble
  \key c \major
  \time 2/4
  \tempo 4=144
}

voiceOne = {
  \include "voice1.ly"
  \bar "||"
}

voiceTwo = {
  \include "voice2.ly"
  \bar "||"
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
      title = "Modulus No.2"
      subtitle = "“Istrian”"
      subsubtitle = "2011-05-05"
      composer = "Jeremy Mates"
      copyright = "© 2011 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
    }
    \score {
      \new StaffGroup <<
        \new Staff <<
          \set Staff.instrumentName = #"Muted Trumpet"
          \set Staff.midiInstrument = #"muted trumpet"

          \keyTempoEtc
          \voiceOne
        >>
        \new Staff <<
          \set Staff.instrumentName = #"Clarinet"
          \set Staff.midiInstrument = #"clarinet"

          \keyTempoEtc
          \voiceTwo
        >>
      >>
      \layout {
        indent = 3\cm
      }
      \midi { }
    }
%  \markuplines { \paragraph { \tiny {
%This work is licensed under the Creative Commons Attribution 3.0 United
%States License. To view a copy of this license, visit
%http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
%Creative Commons, 171 Second Street, Suite 300, San Francisco,
%California, 94105, USA.
%} } }
  }
  \bookpart {
    \header {
      title = "Modulus No.2 – Muted Trumpet"
    }
    \score {
      \new Staff <<
        \keyTempoEtc
        \voiceOne
      >>
    }
  }
  \bookpart {
    \header {
      title = "Modulus No.2 – Clarinet"
    }
    \score {
      \new Staff <<
        \keyTempoEtc
        \voiceTwo
      >>
    }
  }
}

% LilyPond engraving system - http://www.lilypond.org/

\version "2.16.0"

\include "articulate.ly"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

\header {
  title       = "Invention No. 3"
  subsubtitle = "2013-02-23"
  composer    = "Jeremy Mates"
  tagline     = ##f
}

keytempoetc = {
  \tempo "Allegro con Sparkles" 4=80
  \key aes \major
  \accidentalStyle "piano"
}

upperfirst = \relative f' {
  R1
  ees16\mf g bes-. aes-.
    b ees ges-. ees-.
    aes,8-| ees'-| g,-| c-|
  aes8-. r r r r f'-| aes16-. f-. ees des
  aes16 c ees-. des-.
    e16 aes b-. aes-.
    des,8-| aes'-| c,-| ees-|
  bes8-| ees-| aes,-| ees'-|
    c8-| aes-| ees'-. c16 aes
  c8-| r g-| r  des'-| r ees-| r
}

uppersecond = \relative b' {
  c8-| r8 r4 r2
  des,16 f aes-. ges-.
    a16 des e-. des-.
    ges,8-| des'-| aes-| bes-|
  ees,8-| aes-| e-| aes-|  f16 ees des c-.
    ees16 g bes-. aes-.
  b16 ees ges-. ees-.  f,16 a c-. bes-. des f aes-. f-. g, b d-. c-.
  ees16 g bes-. aes-. b ees ges f e ees des c bes aes g f
  ees8-| r des-| r c-| r4. |
}

lowerfirst = \relative a {
  aes16\mf c ees-. des-.
    e16 aes b-. aes-.
    des,8-| aes'-| c,-| f-|
  bes,8-| ees-| aes,-| ees'-|
    c8-| aes'-| ees-| c-|

  des16 f aes-. ges-.
    a16 des e-. des-.
    ges,8-| des'-| f,-| bes-|
  ees,8-| aes-| e-| aes-|  f-| des-| aes-| f-|

  \clef bass
  ees16 g bes-. aes-.
    b ees ges-. ees-.
    aes,8-| ees'-| g,-| c-|
  f,8-| bes-| ees,-| bes'-| g-| ees'-| b-| g-|
}

lowersecond = \relative a {
  \clef treble
  aes16 c ees-. des-.
    e16 aes b-. aes-.
    des,8-| aes'-| c,-| f-|
  aes,8-| r r r  r f'-| des-| bes-|
  c8-| aes-| b-| c-| aes-| f-| bes8-| ees-|
  aes,-| ees'-| c8-| f-| des-| f-| ees-| g-|
  c,8-| ees-| aes,-| ees'-| aes-| r ees-| r
  aes8-| r ees-| r aes-| r4. 
}

upper = {
  \clef treble
  \keytempoetc

  \upperfirst
  \uppersecond

  \bar "|."
}

lower = {
  \clef treble
  \keytempoetc

  \lowerfirst
  \lowersecond

  \bar "|."
}

theMusic = {
  \new PianoStaff <<
%   \set PianoStaff.connectArpeggios = ##t
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
}

\book {
  \paper {
   % #(set-paper-size "arch a")
  }
  \score {
    \theMusic
    \layout { }
  }
  \score {
    \unfoldRepeats \articulate {
%     \set Score.midiChannelMapping = #'voice
      \theMusic
    }
    \midi { }
  }
  \markuplist { \paragraph {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105.
} }
}

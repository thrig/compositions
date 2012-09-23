% LilyPond engraving system - http://www.lilypond.org/
%
% Sequence based on rising minor 6ths, a permitted leap in Fux-style
% Counterpoint (though more often than not lacking the necessary step
% resolution here), using only white keys - EC AF BG. This also forms a
% "Sakura" pentatonic scale.
%
% http://en.wikipedia.org/wiki/Phrygian_mode#Modern_Phrygian_mode
% http://en.wikipedia.org/wiki/Aeolian_mode
% http://en.wikipedia.org/wiki/Locrian_mode
%
% Volumes for different instruments mostly dictated by making the MIDI
% playback sound reasonable, so may not be reasonable for real life
% applications.

\version "2.16.0"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 0) args))))

\header {
  title       = "Wet Paint Steps - DRAFT"
  composer    = "Jeremy Mates"
  subsubtitle = "201?-??-??"
  copyright   = "© 201? Creative Commons Attribution 3.0 United States License"
  tagline     = ##f
}

tempoAndStuff = {
  \time 4/4
  \tempo "Briskly" 4=180
}


licorice = {
  \clef treble
  \tempoAndStuff

  e2(\mf c'
  a f'
  b, g'~
  g4 f e2->)

  b,( g'
  e c'
  fis, d'~
  d4 c b2->)

  \times 2/3 { b,4( a g) } r2
  \times 2/3 { e'4( d c) } r2
  \times 2/3 { \slurDown b4( c d e f g 
    a4 g f } e2->) \slurNeutral

  \times 2/3 { b4( c d) b-| r2 }
  \times 2/3 { c4( d e) c-| r2 }
  \times 2/3 { c'4( b a fis' e d 
    c4 b a) } b2->

  e,2( c'
  a2 f'
  b,2 g'2
  e2.) r4

  b,2 g'4.( f8
  e2) c'4.( a16 g
  fis2) d'(~ 
  d4 c b4 a) 

  b1->
  e,4. gis16 b c2
  a4. g16 ges f2
  fis4. gis16 a b4 r8 c8

  d4-. dis-. e4 r
  b,4-. r g-. r
  e4-. r c'-. r
  a4-. b4-. \acciaccatura c16 fis4 d |

  g4-| r2.

}

vibraphone = {
  \clef treble
  \tempoAndStuff

  \relative b' {

  \times 2/3 { b4\mf( a g } a g)
  \times 2/3 { e'4( d c } d a)
  \times 2/3 { d4( c b g a b }
  <b c>4 <a d> <e e'>2\sustainOn)

  \times 2/3 { d'4(\sustainOff e f } e d)
  \times 2/3 { c4( b a } c d)
  << {
    \times 2/3 { b4( a g fis g a }
    b4 a b2)
  } \\ {
    s1
    s2 \times 2/3 { r4 c, d }
  } >>

  e2\sustainOn <e c'>
  a\sustainOff\sustainOn <a f'>
  b\sustainOff\sustainOn <b g'>
  \times 2/3 { <b g'>4\sustainOff c d } e4-| e,-|

  b2\sustainOn <b g'>
  e2\sustainOff\sustainOn <e c'>
  fis2\sustainOff\sustainOn <fis d'>~
  <fis d'>4\sustainOff c' \times 2/3 { fis4 e \slurUp d }

  \times 2/3 {
    c4( b a b a gis)
    e'4( d c d e f
    g4 f e d c d)
  }
  <e e,>4-| b-| e,-| r8 g16 a

  \slurNeutral

  b4 g r2
  c4 a r2
  d4( c d e
  fis4) r2 d4

  fis4 g2.\sustainOn
  e,2\sustainOff\sustainOn <c' e,>2
  a2\sustainOff\sustainOn <f' a,>2
  b,2\sustainOff\sustainOn <g' b,>2

  <g, g'>4\sustainOff f e2
  b2\sustainOn <b g'>
  e2\sustainOff\sustainOn <e c'>
  fis2\sustainOff\sustainOn <fis d'> |

  <b, b'>2 r

  }
}

urb = {
  \clef bass
  \tempoAndStuff

  \relative c' {
  e4\p d c b
  c b a g
  b a g f
  e d e c'

  b a g f
  g a ais b
  c c, d e
  b' a g f              % 8

  e d e g
  a g f e
  g f e d
  e d c e

  b' a g f
  e c e g
  a g fis g
  a ais b d             % 16

  e d c b
  a g f a
  b a g a
  e d c d

  b a g d'
  e d c e
  fis e d c
  d e f fis             % 24

  g e d dis
  e d c b
  c b a g
  d' c b g'

  b a g fis
  g a b c
  e d c b
  a g fis g             % 32

  b a g f

  }
}

banging = {        % on the drums - generic rhythm support
  \tempoAndStuff

  \new DrumVoice { \voiceOne \drummode {

    ridecymbalb16\p r r8 ridecymbalb8. ridecymbalb16 ridecymbalb4 <ridecymbalb pedalhihat>8. ridecymbalb16 |
    \repeat unfold 3 {
      ridecymbalb4 <ridecymbalb pedalhihat>8. ridecymbalb16 ridecymbalb4 <ridecymbalb pedalhihat>8. ridecymbalb16 |
    }
   % too stock or obvious?
   %ridecymbalb8. pedalhihat16 ridecymbalb8. ridecymbalb16 ridecymbalb8. pedalhihat16 \times 2/3 { ridecymbalb8 snare acousticbassdrum } |

    \repeat unfold 29 {
      ridecymbalb4 <ridecymbalb pedalhihat>8. ridecymbalb16 ridecymbalb4 <ridecymbalb pedalhihat>8. ridecymbalb16 |
    }
    
  } }
}

theMusic = {
  <<
   % helps synth playback, but makes imports into GarageBand or Finale annoying
   %\set Score.midiChannelMapping = #'instrument

    \override Score.BarNumber #'break-visibility = #'#(#t #t #t)
    \set Score.barNumberVisibility = #(every-nth-bar-number-visible 8)

    \new Staff <<
      \set Staff.instrumentName = #"Clarinet"
      \set Staff.midiInstrument = #"clarinet"
      \relative c' { \licorice }
    >>
    \new Staff <<
      \set Staff.instrumentName = #"Vibes"
      \set Staff.midiInstrument = #"vibraphone"

      \set Staff.pedalSustainStyle = #'mixed

      \vibraphone
    >>
    \new Staff <<
      \set Staff.instrumentName = #"Bass"
      \set Staff.midiInstrument = #"acoustic bass"
      \urb
    >>
    \new DrumStaff << \banging >>
  >>
}

\book {
  \paper {
    #(set-paper-size "arch a")
  }

  \bookpart {
    \score {
      \theMusic
      \layout { }
      \midi { }
    }

    \markuplist { \paragraph {
This work is licensed under the Creative Commons Attribution 3.0 United
States License. To view a copy of this license, visit
\with-url #"http://creativecommons.org/licenses/by/3.0/us/" { http://creativecommons.org/licenses/by/3.0/us/ } or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105.
} }

  }

%\bookpart {
%  \header {
%    title = "B♭ Clarinet - DRAFT"
%  }
%  \score {
%    \new Staff <<
%      \override Score.BarNumber #'break-visibility = #'#(#t #t #t)
%      \set Score.barNumberVisibility = #(every-nth-bar-number-visible 8)
%
%      \key d \major
%
%      \transpose bes c { \relative c'' { \licorice } }
%    >>
%  }
%}

%\bookpart {
%  \header {
%    title = "Vibraphone - DRAFT"
%  }
%  \score {
%    \new Staff <<
%      \override Score.BarNumber #'break-visibility = #'#(#t #t #t)
%      \set Score.barNumberVisibility = #(every-nth-bar-number-visible 8)
%
%      \set Staff.pedalSustainStyle = #'mixed
%      \vibraphone
%    >>
%  }
%}

%\bookpart {
%  \header {
%    title = "Bass - DRAFT"
%  }
%  \score {
%    \new Staff <<
%      \override Score.BarNumber #'break-visibility = #'#(#t #t #t)
%      \set Score.barNumberVisibility = #(every-nth-bar-number-visible 8)
%
%      \urb
%    >>
%  }
%}

}

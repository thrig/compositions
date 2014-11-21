%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% LilyPond engraving system - http://www.lilypond.org/                       %
%                                                                            %

\version "2.18.2"
\include "articulate.ly"

\header {
  title       = "Chorale No. 2"
  subtitle    = "barlines left as exercise to reader"
  subsubtitle = "2014-11-21"
  composer    = "Jeremy Mates"
  copyright   = \markup { \teeny {
"© 2014 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

tempoandetc = {
  \set Score.tempoHideNote = ##t
  \tempo "Moderately" 4=84

  \key c \major               % lies! but every note is literal

  \cadenzaOn
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %

sopa = \relative a' {
  bes4 bes a bes
  c4~ c b cis8[( d]
  e4) e f~ f8[( ees
  d8 c] bes4) aes g
  a4
    \bar "|" \break

    b4 c~ c8[ d]
  ees4( ees des) c8[^( bes
  aes8 bes] c4) b c
  f,4( f g~ g)
  g4 aes bes8[ aes] bes4
  c8[ f,]
    \bar "|" \break

    aes4 aes g
  aes4 bes c d
  ees4~ ees bes bes8[^( aes]
  g4) des' des8[^( ces] bes4)
  c4 c8[^( bes] a4) bes4.
    \bar "|."
}

altoa = \relative d' {
  f4 g fis g~
  g4 a gis a
  gis4 a8[( g f g] a4~)
  a8[ ees] g4 f8[ d] ees4~
  ees8[ c]
    \bar "|" \break

    g'4~ g8[ d] aes'8[ g~]
  g4( aes f) ees8[_( d
  c8 f] g4) f ees
  c4( des~ des ees
  ees4) f8[ ees] f4 g8[ f]
  ees8[ des]
    \bar "|" \break

    ees4 f e
  f4 g aes b
  g8[( f] ees4) g g8[_( f]
  ees4) bes' bes8[_( aes] ges4)
  a4 a8[_( g] f4) f4.
    \bar "|."
}

tenora = \relative b {
  d8[( c] bes4) d~ d
  e8[( d] c4) e4~ e8[ d]
  b4 c d c
  d4 g,8[( a] bes4) bes8[ g]
  c4
    \bar "|" \break

    d4 c c
  c4 c aes g
  aes4 bes~ bes c
  aes4~ aes bes c
  c4 c des~ des
  aes8[ bes]
    \bar "|" \break

    c8[ bes] aes4 c
  c4 ees ees f
  ees4 c bes ees
  bes4 des ges des
  c4 f c d4.
    \bar "|."
}

bassa = \relative c {
  bes4 ees d8[( c] bes4)
  c4 f8[ a] e[ b'] a4
  e4 a, bes' f
  bes,4 ees d ees
  a4
    \bar "|" \break

    g8[( f] ees4) f
  c4 f bes, c
  f4 e g c,
  f4 bes, ees aes,
  c4 f bes, ees
  c8[ bes]
    \bar "|" \break

    aes4 des c
  f4 ees aes g
  c,4 aes' g8[_( f] ees4)
  g4 bes8[_( aes] ges4) bes
  a8[_( g] f4) a d,4.
    \bar "|."
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% SCORE                                                                      %
%                                                                            %

ssop = {
  \tempoandetc
  \sopa
}

salto = {
  \tempoandetc
  \altoa
}

stenor = {
  \tempoandetc
  \tenora
}

sbass = {
  \tempoandetc
  \bassa
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% MIDI                                                                       %
%                                                                            %

msop = { \articulate {
  \tempoandetc
  \sopa
} }

malto = { \articulate {
  \tempoandetc
  \altoa
} }

mtenor = { \articulate {
  \tempoandetc
  \tenora
} }

mbass = { \articulate {
  \tempoandetc
  \bassa
} }

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %

\score {
  \new PianoStaff <<
    \new Staff <<
      \accidentalStyle "forget"
      \clef treble

      \set Staff.printPartCombineTexts = ##f
      \partcombine
      << \ssop    >>
      << \salto   >>
    >>
    \new Staff <<
      \accidentalStyle "forget"
      \clef bass

      \set Staff.printPartCombineTexts = ##f
      \partcombine
      << \stenor >>
      << \sbass  >>
    >>
  >>
  \layout { }
}

\score {
  \new Staff <<
    \set Score.midiChannelMapping = #'staff
    \new Staff << \msop   >>
    \new Staff << \malto  >>
    \new Staff << \mbass  >>
    \new Staff << \mtenor >>
  >>
  \midi { }
}

%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

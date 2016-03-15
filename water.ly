%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LilyPond engraving system - http://www.lilypond.org/
%
% This work is licensed under the Creative Commons Attribution 3.0
% United States License. To view a copy of this license, visit
% http://creativecommons.org/licenses/by/3.0/us/ or send a letter to
% Creative Commons, 171 Second Street, Suite 300, San Francisco,
% California, 94105, USA.

\version "2.18.0"
\include "articulate.ly"

\header {
  title       = "Water"
  composer    = "Jeremy Mates"
  subsubtitle = "2016-03-15"
  copyright   = \markup { \with-color #grey \teeny {
    \char ##x00A9
    "2016 Jeremy Mates - Creative Commons Attribution 3.0 United States License"
  } }
  tagline = #f
}

normtempo = {
  \tempo 4=96
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Music

uppera = \relative d' {
  e8^(\<\p c e c\!   e8\> c e c\!)
  d8\<^(  b d b\!    d\> b d b\!)
  f'8\<^( d f d\!    f\> d f d\!)
  e8\<^( c e c\!     e\> c e c\!)
}

upperab = \relative c' {
<< {
  s2 g'2^\pp s2 f2^\pp s2 a2^\pp s2 g2^\pp
} \\ {
  e8^(\p\< c e c\!   e8\> c e c\!)
  d8^(\p\< b d b\!   d\> b d b\!)
  f'8^(\p\< d f d\!  f\> d f d\!)
  e8^(\p\< c e c\!   e c e c) } >> 
}

upperb = \relative a' {
  a8^(\<\mp e a e\!        a\> e a e\!)
  g8^(\< e g e\!           g\> e g e\!)
  b'8^(\< e, b' e,\! b'\>  e, b' e,\!)
  c'8^(\< e, c' e,\! c'\>  e, c' e,\!)

  c'8^(\< e, c' e,\!       c' e, c' e,)
  d'8^(\< e, d' e,\!       d' e, d' e,)
  e'8^( e, e' e,           e'\> e, e' e, 
  e'8 e, e' e, e'          e, e' e,\!)
}

upperc = \relative e'' {
  e8\mp e,( a e)    e' e,( a e)
  c'8 f,( a c)      e  e,_( a e)
  g'8 g,_( c a)     a' a,_( c g)
  e'8 e,( a d,)     b''( g  e) f

  e8( f a) f        d( e c d)
  e8\<( c e c\!)    e\>( c e c\!)
  d8\<( b d b\!)    d\>( b a) e'\!
  f8( d g) g,       e'( c f) f,

  d'8( b e) c       a( f d) f
  a8  f( a c)       e  e,^( a e)
  g'8 g,( c a)      a' a,( c g)
  e'8 e,( a d,)     b''8( g e c)

  <a c g'>2~\mp  <a c g'>4.    f8(
  <g b d g>2)~   <g b d g>4.    r8
  <a c f>1
  <a c e a>2     e'8(\> a f a\!)
}

upperd = \relative e'' {
  e8\p\<(  a f   a\!)  e\>( a)  a, f'\!
  c'8\<( a c  a\!)     c\>( a  c  a\!)
  b8\<(  g  b  g\!)    b\>( g  b  g\!)
  d'8\<( b  d  b\!)    d( b  d  b)  |

  c8 r c( a         c->) r c( a
  a8->) r f( a      f->) r f( e)
  gis8 b-> gis( e   gis) r gis( e)
  <a, c e a>2\p     <f a d>
}

uppere = \relative e' {
  << { e'4 c d2 } { <a e>2 <b d,> } >>
  cis8\mp\<( a e') a,\!       cis8\> a a' a,\!
  b8\<( gis) d' gis,\!     b8\>( gis) fis' b,\!
  e8\<( cis) gis' cis,\!   e\>( cis) b'-> b,\!
    
  cis8\<( a) fis' a,\!     cis\>( a) a'-> cis,\!
  fis8\<( d) a'-> d,\!     fis\>( d) b'-> fis\!
  gis8\<( e gis e\!        gis8\> e gis e\!)
  fis8\<( d fis d\!        fis8\> d fis d\!)

  e8\<( cis e cis\!        e8\> cis e cis\!)
  d8\<^( b d b\!            d8\> b d b\!)
  c8\<^( a c a\!            c8\> a c a\!)
  b8\<^( g b g\!            b8\> g b g\!)

  a8\<^( f a f\!            a8\> f a f\!)
  g8\<^( e g e\!            g8\> e g e\!)
  f8\<^( d f d\!            f8\> d f d\!)
  e8\p\<^( c e c\!          e8\> c e c\!)

  d8\pp\<^( b d b\!            d8\> b d b\!)
}

upperf = \relative e' {
  e1\ppp
}

lowera = \relative c {
  <c e g>1\p
  <b d g>1 
  <d f a>2~ <d f a>4. fis8(
  <c e g>1)
}

lowerab = \relative c {
  <c e g>2~\p    <c e g>4. f16( f
  <b, d g>2)~  <b d g>4. cis16( cis
  <d f a>2)~   <d f a>4. fis16( fis
  <c e g>1)
}

lowerb = \relative a, {
  <a e' a>2(\mp <a e' a>4\> <c e a>\!)
  <c g' c>2(\mp <c g' c>4\>  <b e b'>\!)
  <a e' a>2(\mp <b e  b'>4\> <c e c'>\!)
  <c g' c>2(\mp <c f c'>4\>  <e a c>\!)

  <c f a>2(\mp   <a e' a>4\>  <a f' a>)\!
  <g d' g>2^(\mp <f d' g>4\>  <g d' g>)\!
  <a d a'>2~\p   <a d a'>4.  f'8(\pp\>
  <a, e' a>1\!)
}

lowerc = \relative a, {
  a8\mp c'( a   f)    c    a  c'( a
  f8)   c(  a   f)    g'(  e  c)  g
  e8    g'( e   c)    e'(  c  a)  e
  c8    a   c'( g     e)   c' g   e

  a8   c,( e  c)      g' c,( e  c)
  a8(  e'  c  f)      e(  a   f  c')
  d,8(  b' g  d)      e(  g  c, d)
  d'8  f,( g  e)      g(  a   c)  a

  f8(  g)   e  a(     f  d)  f   a
  f8 c(   a f)        g'( e  c)  g
  e8) g'( e  c)       e'( c  a)  e(
  c8  a) c'( g        e)  c'( a c)

  e8(\< c e c\!)      e\>( c e c\!)
  d8(\< b d b\!)      d\>( b d b\!)
  f'8(\< d f d\!)     f\>( d f d\!)
  e8(\< c e c\!)      e\>( c e c\!)
}

lowerd = \relative c' {
  e8(\<\p c  e c\!)   e\>( c  e c\!)
  a8 e'( c a          e) c'( a e
  d8) b'( g d         b) d'( b g
  e8) e'( b g         e) d'( b g

  e8 c) e'( c         a) e'( c a)
  c8( a c a)          c( a c a)
  b8( gis b gis)      b( gis b gis)
  a4 c f, b,\pp
}

lowere = \relative c {
  c4\<( e f gis\!)
  <e a>2\mp a
  <gis b>2 gis
  cis2 cis4( b

  a2) fis4( cis'
  d,2.) dis4(
  e1)
  d2. fis4

  a2 gis4( cis
  b2) gis
  a2 f4( d
  g2) e

  f2 c4( d
  e2) b'
  <b b,>2 a
  g1\mf

  <d g>1\mp
}

lowerf = \relative c {
  <c g'>1\ppp
}

pedala = {
  s1\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
}

pedalab = {
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
}

pedalb = {
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn

  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn s1\sustainOff\sustainOn
}

pedalc = {
  s8 s8\sustainOff s4 s2
  s1
  s1
  s1
  s1
  s1
  s1
  s1
  s1 s1 s1 s2 s8\sustainOn s8 s8 s8
  s1\sustainOff
  s1
  s1
  s1
}

pedald = {
  s1
  s1
  s1
  s1

  s1
  s1
  s1
  s1\sustainOn
}

pedale = {
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn

  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn

  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn

  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn
  s1\sustainOff\sustainOn

  s1\sustainOff\sustainOn
}

pedalf = {
  s1\sustainOff\sustainOn
}


midiupper = {
  \normtempo
  \uppera
  \repeat unfold 2 {
    \upperab
    \upperb
    \upperc
    \upperd
    \uppere
  }
  \upperf
}
midilower = {
  \lowera
  \repeat unfold 2 {
    \lowerab
    \lowerb
    \lowerc
    \lowerd
    \lowere
  }
  \lowerf
}
midipedal = {
  \pedala
  \repeat unfold 2 {
    \pedalab
    \pedalb
    \pedalc
    \pedald
    \pedale
  }
  \pedalf
}

scoreupper = {
  \accidentalStyle "neo-modern"
  \clef treble
  \normtempo
% \set Score.tempoHideNote = ##t
  \override Hairpin #'to-barline = ##f

  \uppera
  \repeat volta 2 {
    \upperab
    \upperb
    \upperc
    \upperd
    \uppere
  }
  \upperf
  \bar "|."
}

scorelower = {
  \accidentalStyle "neo-modern"
  \clef bass
  \override Hairpin #'to-barline = ##f

  \lowera
  \repeat volta 2 {
    \lowerab
    \lowerb
    \lowerc
    \lowerd
    \lowere
  }
  \lowerf
  \bar "|."
}

scorepedal = {
  \pedala
  \repeat volta 2 {
    \pedalab
    \pedalb
    \pedalc
    \pedald
    \pedale
  }
  \pedalf
}

\book {
% \paper {
%   #(set-paper-size "letter")
% }
  \score {
    \new PianoStaff = "PianoStaff_pf" <<
      \set PianoStaff.pedalSustainStyle = #'bracket
      \new Staff = "Staff_pfUpper" << \scoreupper >>
      \new Staff = "Staff_pfLower" << \scorelower >>
      \new Dynamics = "pedal" \scorepedal
    >>
    \layout { }
  }
  \score {
    \unfoldRepeats \articulate {
      \new PianoStaff <<
        \set Score.midiChannelMapping = #'instrument
        \new Staff = "upper" \midiupper
        \new Staff = "lower" \midilower
        \new Staff = "pedal" \midipedal
      >>
    }
    \midi { }
  }
}

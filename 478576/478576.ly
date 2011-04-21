
\version "2.12.3"
% automatically converted from 478576.xml

\header {
    encodingsoftware = "Finale 2009 for Macintosh"
    tagline = "Finale 2009 for Macintosh"
    encodingdate = "2010-06-06"
    title = "478576"
    composer = "Jeremy Mates"
    }

#(set-global-staff-size 20.5767485433)
\paper {
    paper-width = 21.59\cm
    paper-height = 27.93\cm
    top-margin = 1.59\cm
    botton-margin = 1.59\cm
    left-margin = 1.9\cm
    right-margin = 1.9\cm
    between-system-space = 2.57\cm
    page-top-space = 1.27\cm
    }
\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative f' {
    \clef "treble" \key c \major \time 6/8 | % 1
    f8 \mf ( b8 c8 g8 ) _| b8 ^. a8 _. | % 2
    f8 ( bes8 c8 <g d'>8 ) bes8 ^. a8 _. | % 3
    <a bes d>8 ( bes8 c8 <g c es>8 ) c8 ^. d8 ^. | % 4
    <g, c es>8 ( c8 bes8 <g d' es>8 ) bes8 ^. as8 _. | % 5
    <f as c>8 ( c'8 c8 <f, as des>8 ) as8 _. g8 _. | % 6
    <f c' des>8 ( des'8 c8 <ges as es'>8 ) as8 _. bes8 ^. | % 7
    <f bes ces>8 ( ces'8 ces8 <ges bes des>8 ) as8 _. bes8 ^. | % 8
    \key b \major <gis ais cis e>8 ais8 _. cis8 ^. <gis ais cis e>8 (
    cis8 gis8 | % 9
    <e a cis>8 ) b'8 ^. gis8 _. <e b' e>8 ( gis8 dis'8 | \barNumberCheck
    #10
    <e, cis' e>8 ) b'8 ^. fis8 _. <gis b d>8 ( gis8 e'8 | % 11
    \key d \major <e, a cis>8 ) e'8 ^. a,8 _. <g b d>8 ( b8 e8 | % 12
    <fis, a c>8 ) a8 _. b8 ^. <e, c'>8 ( a8 g8 | % 13
    <fis c'>8 b8 c8 d8 e8 c8 ) | % 14
    \key c \major b8 ^\mordent c2 ~ c8 \bar "|."
    }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>


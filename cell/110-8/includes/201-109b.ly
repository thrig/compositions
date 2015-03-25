\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  tagline = #f
}

\score {
  \header { piece = "201-109b" }
  <<
    \new Voice = "melody" \relative f' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      e4 d4. e16 d c4. a4 a4. c16 d e4 d8. f16 e d4 d4. c16 d c d e f g4 a a4. g16 f g2 a g2. a
      \cadenzaOff
      \bar ""
      \cadenzaOn
      d,4 e4. f8 e16 d g4 f8 g g a16 g f4. e8 d e a, d4. e16 f g e a8 a g16 f g8 g a4. g2
      \cadenzaOff
      \bar "k"
    }
  >>
  \layout {
    indent = 0.0\cm
    short-indent = 0.0\cm
    ragged-right = #f
  }
  \midi { }
}


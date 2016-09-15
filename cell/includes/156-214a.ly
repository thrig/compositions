\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  tagline = #f
}

\score {
  \header { piece = "156-214a" }
  <<
    \new Voice = "melody" \relative c' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      e8 d4. f8 e4 d4. f8 g a a a, a' e a g e f e d4 a8 a'16 g f g a8 g f
      \cadenzaOff
      \bar ""
      \cadenzaOn
      a8 a g16 f e8 d e g a g d c d e f16 g a8 a e4 a8 a g f g g a g2
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


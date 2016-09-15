\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  tagline = #f
}

\score {
  \header { piece = "114-91a" }
  <<
    \new Voice = "melody" \relative c' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      f4. g8 f4. g8 a a bes a a g e f e d d4. e8 e f e a a g f g g a g2
      \cadenzaOff
      \bar ""
      \cadenzaOn
      d4 f8 g f e f g f g a a a a16 g f4 e8 f g a bes a a g f g a4 g8 a2
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

\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  tagline = #f
}

\score {
  \header { piece = "78-107b" }
  <<
    \new Voice = "melody" \relative d' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      d4. f8 e g a4. g8 f4 g d d c8 e d4 e8 f g4 a a g8 f g4 g a g2
      \cadenzaOff
      \bar ""
      \cadenzaOn
      a8. bes16 a g8 f d f e c f c4 e d4. e8 f g f a a g f g g a g2
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


\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  tagline = #f
}

\score {
  \header { piece = "39-181b" }
  <<
    \new Voice = "melody" \relative f' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      e8 g16 f e8 a a bes16 a g8 f e4 c8 c d a a' a, e'16 d c8 a' a g16 f g8 a16 g f4
      \cadenzaOff
      \bar ""
      \cadenzaOn
      d8 c8. e16 d e8 f16 e g8 f a g bes a16 a g8 f16 e f8 a a g f16 g a8 g f e d2
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


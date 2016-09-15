\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  tagline = #f
}

\score {
  \header { piece = "78-107a" }
  <<
    \new Voice = "melody" \relative c' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      f4. a8 a bes16 a g8 f4 d4. c8 e f g a bes a d,4 e8 a4 a g8 f g g a g8. r4
      \cadenzaOff
      \bar ""
      \cadenzaOn
      d4. e8 f g16 g a a f8 f e f g a f bes a bes g a16 g a8 a g f g a4 g a2
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


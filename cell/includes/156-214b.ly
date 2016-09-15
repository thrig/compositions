\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  tagline = #f
}

\score {
  \header { piece = "156-214b" }
  <<
    \new Voice = "melody" \relative d' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      d8 c c4 d8 d e8 f g a f f e4 d8 c a4 c8 d c4 f8 a8 a g f g a4 g8 f e d2
      \cadenzaOff
      \bar ""
      \cadenzaOn
      f4 g8 a a g8 a16 g f8 d c4 d8 e f e4 e4 f8 f e f d e f a8 a g16 f g a g4 a2
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


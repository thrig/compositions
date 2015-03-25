\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  tagline = #f
}

\score {
  \header { piece = "114-91b" }
  <<
    \new Voice = "melody" \relative d' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      f4 g a g8 f d4 d8 d e4 c8 e f e g a g4 f a8 a g f g4 g8 a g4
      \cadenzaOff
      \bar ""
      \cadenzaOn
      e8 e f g e4 f8 e f d g g16 a a g f8 g e f e e f g e a16 a g f g8 g a g2
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


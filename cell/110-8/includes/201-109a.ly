\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  tagline = #f
}

\score {
  \header { piece = "201-109a" }
  <<
    \new Voice = "melody" \relative c' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      d8 e f g f e16 d c4. a8 d16 e d8 a' g4. g16 f a8 a16 g f8 g a g f e d2
      \cadenzaOff
      \bar ""
      \cadenzaOn
      c4. d8 a a' g16 bes a8 f16 e f8 d16 e f g e f d8 e16 d e8 a a16 g f g a8 g16 f e4 d2
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


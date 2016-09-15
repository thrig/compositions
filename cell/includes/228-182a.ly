\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  tagline = #f
}

\score {
  \header { piece = "228-182a" }
  <<
    \new Voice = "melody" \relative f' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      a16 a a a a g f8 a g e4 d8 e f e g f e4 a8 a g16 f g8 a g f4
      \cadenzaOff
      \bar ""
      \cadenzaOn
      e8 d f e f d4 d16 e f g f8 a16 g a8 f16 g a a a8 a g16 f g g a8 g4
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


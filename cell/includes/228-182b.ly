\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  tagline = #f
}

\score {
  \header { piece = "228-182b" }
  <<
    \new Voice = "melody" \relative f' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      d8 d d16 e f8 e g f8. g16 f e d8 d d d16 e f e f8 f d f a a g16 f g8 a16 g a8
      \cadenzaOff
      \bar ""
      \cadenzaOn
      bes16 a g8 a f g g a16 g f8 f g16 f g8 e16 f g8 g a a g16 f e8 f16 e f8 f a a g16 f g8 a g f16 e d2
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


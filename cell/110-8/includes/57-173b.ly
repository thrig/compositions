\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  tagline = #f
}

\score {
  \header { piece = "57-173b" }
  <<
    \new Voice = "melody" \relative d' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      a8 d4. d8 c4. e8 f a e16 e a a g f e8 d4 d8 d a a' g16 f g8 a16 g f8
      \cadenzaOff
      \bar ""
      \cadenzaOn
      d8 c4 e8 d e a a g16 f d8 e d e f d g f g a16 a g f g8 a g16 f e4 d2
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


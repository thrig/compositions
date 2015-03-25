\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  piece = "39-181a"
  tagline = #f
}

\score {
  <<
    \new Voice = "melody" \relative c' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      d4 d c4. d8 e d c a8 r c4 d8 e16 f g8 e a a, a' a g f g16 a g8 a4.
      \cadenzaOff
      \bar ""
      \cadenzaOn
      e8 d4. c8 d r8 d8 a a' a16 g f8 g a bes a e a a g f g a g16 f e4 d2
      \cadenzaOff
      \bar "k"
    }
  >>
  \layout {
    indent = 0.0\cm
    short-indent = 0.0\cm
    ragged-right = #f
    ragged-bottom = #f
  }
  \midi { }
}

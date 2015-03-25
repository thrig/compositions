\version "2.18.2"

#(set! paper-alist (cons '("music" . (cons (* 15 cm) (* 4.5 cm))) paper-alist))

\paper {
  #(set-paper-size "music")
}

\header {
  tagline = #f
}

\score {
  \header { piece = "147-218b" }
  <<
    \new Voice = "melody" \relative d' {
      \set Staff.midiInstrument = #"dulcimer"
      \override Staff.TimeSignature #'stencil = ##f
      \override NoteHead.style = #'petrucci
      \override Accidental.glyph-name-alist = #alteration-kievan-glyph-name-alist
      \accidentalStyle forget
      \clef "hufnagel-do1"
      \cadenzaOn
      d32 e f g e16 d c8. a16 a d32 e f e g f e f d8. a16 a c32 d e d f e g a16 a g32 f g a16 g f e d4
      \cadenzaOff
      \bar ""
      \cadenzaOn
      d8. e16 f g32 e g16 f e d32 e f g a16 a32 a f g e f d f e8 e16 d32 e f e a a g f g16 a4 g8. a4
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


\version "2.16.0"

#(define-markup-list-command (paragraph layout props args) (markup-list?)
 (interpret-markup-list layout props
   (make-justified-lines-markup-list (cons (make-hspace-markup 2) args))))

\header {
  title    = "Pitch set: 0 3 5 7 10"
  subtitle = "Music::Chord::Positions v.0.05"
}

upper = {
  \clef treble

  << {
ais1 ais ais' g' ais' ais'' g'' f' f'' ais' ais'' f'' g' g'' f'' g'' ais' ais'' g'' ais'' f'' ais'' g'' dis' dis'' ais' ais'' dis'' g' g'' dis'' g'' ais' ais'' g'' ais'' dis'' ais'' g'' f' f'' dis'' f'' ais' ais'' f'' ais'' dis'' ais'' f'' g' g'' f'' g'' dis'' g'' f'' g'' ais' ais'' g'' ais'' f'' ais'' g'' ais'' dis'' ais'' g'' ais'' f'' ais''
} \\ {
g1 g g ais g' g' ais' ais ais f' f' ais' f' f' g' f'' g' g' ais' g'' ais' f'' f'' ais ais dis' dis' ais' dis' dis' g' dis'' g' g' ais' g'' ais' dis'' dis'' dis' dis' f' dis'' f' f' ais' f'' ais' dis'' dis'' f' f' g' f'' g' dis'' dis'' f'' g' g' ais' g'' ais' f'' f'' g'' ais' dis'' dis'' g'' dis'' f''
} \\ {
f1 f f f f f f g g g g g ais ais ais ais f' f' f' f' g' g' ais' g g g g g ais ais ais ais dis' dis' dis' dis' g' g' ais' ais ais ais ais dis' dis' dis' dis' f' f' ais' dis' dis' dis' dis' f' f' g' dis'' f' f' f' f' g' g' ais' f'' g' g' ais' dis'' ais' dis''
} >>

}

lower = {
  \clef bass

  << {
dis1 dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis f f f f f f f f f f f f f f f f g g g g g g g g g g g ais ais ais ais ais ais ais ais dis' dis' dis' dis' dis' dis' dis' dis' f' f' f' f' g' g'
} \\ {
c1 c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c
} >>

}

\markuplist { \paragraph {
mcp2ly voc 0 3 5 7 10
} }

\score {
  \new PianoStaff <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
  \layout { }
  \midi { }
}

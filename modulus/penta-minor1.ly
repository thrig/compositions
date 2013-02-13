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
ais1 ais c' c' dis' f' dis' f' g' c' dis' f' dis' f' g' dis' f' g' f' g' ais' g' ais' c'' c' dis' f' dis' f' g' dis' f' g' f' g' ais' g' ais' c'' f' g' ais' g' ais' c'' ais' c'' dis' f' g' f' g' ais' g' ais' c'' f' g' ais' g' ais' c'' ais' c''
} \\ {
g1 g g ais ais ais c' c' c' ais ais ais c' c' c' c' c' c' dis' dis' dis' f' f' f' ais ais ais c' c' c' c' c' c' dis' dis' dis' f' f' f' dis' dis' dis' f' f' f' g' g' c' c' c' dis' dis' dis' f' f' f' dis' dis' dis' f' f' f' g' g'
} >>

}

lower = {
  \clef bass

  << {
f1 f f f f f f f f g g g g g g ais ais ais ais ais ais ais ais ais g g g g g g ais ais ais ais ais ais ais ais ais c' c' c' c' c' c' c' c' ais ais ais ais ais ais ais ais ais c' c' c' c' c' c' c' c'
} \\ {
dis1 dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis dis f f f f f f f f f f f f f f f f f f f f f f f g g g g g g g g g g g g g g g g g
} \\ {
c1 c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c c
} >>

}

\markuplist { \paragraph {
mcp2ly -p interval_adj_max=7 -p no_limit_doublings=1 -p no_limit_uniq=1 -p root_lock=1 voc 0 3 5 7 10
} }

\score {
  \new PianoStaff <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
  \layout { }
  \midi { }
}

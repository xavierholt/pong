# Pong

## Overview

This is a stylized version of [Pong][pong] built for the [Godot Engnine][godot].
You play  in a circle.  My primary goal  was to make  everything  as simple  and
smooth as possible.

The smoothness comes from custom physics:

- The control keys  add acceleration  to the paddles,  rather than setting their
  velocities, so they glide instead of starting and stopping abruptly.
- Hitting the ball with a moving paddle causes it to spin, curving its path.
- Moving paddles elongate, making it slightly easier to hit the ball (and making
  the paddles, in my opinion, quite satisfying to move).
- Hitting  a paddle  increases  the ball's speed  slightly,  and hitting  a wall
  decreases it.  This is intended to scale  the difficulty to match the players'
  abilities.

The art style is intentionally minimalist, with a few embellishments:

- The paddles emit a faint glow outside the cirle.  This makes them a bit easier
  to find, and does make them look a little more "polished."
- The ball  leaves a short translucent trail  behind as it moves.  This makes it
  easier to determine its path - particularly when it's spinning.
- When the ball bounces, it emits a small splash. This serves as an indicator of
  what it bounced off of - a player's paddle if colored, or the wall if black.


## Challenges

In no particular order...

- Since I wrote my own  rendering functions,  none of my objects  show up in the
  editor.  This made positioning things a bit of a trial-and-error process.
- Trigonometric functions  are hard to think about  when your origin  is the top
  left of the screen.  I often ended up just guessing until things worked.
- Getting particle effects (the bounce splashes) to show up was hard - there are
  lots of simple errors that will prevent them from rendering.
- Making decent-sounding sound effects was even harder!
- The hardest part of playing the game  is remembering that  the controls aren't
  left and right,  but clockwise and widdershins.  This messed me up a lot while
  playtesting against myself.  Hopefully it's easier when you only have a single
  paddle to keep track of...


## Assets

Almost all of the graphics are generated programmatically. The text is generated
from lines  and segments  of circles  on startup  (see `*Text.gd`).  The various
filled circles - including the ball and its blur trail - are produced by Godot's
`draw_circle()` function. The paddles are also drawn as circle segments, and the
paddle glow with colored quadrilaterals (set into additive blending mode, so the
paddles turn magenta when overlapping).

The only pixels included with the game  are the translucent circles used for the
splash effect on bounces - the particle system required a texture.  I made these
in Photoshop.

I made  the sound effects  in [Audacity][audacity].  The musical notes  are pure
tones with a fade out applied.  The "bad bounce"  sound effect is also generated
in Audacity, which refers to it as a [Risset Drum][drum].


[pong]:     https://en.wikipedia.org/wiki/Pong
[godot]:    https://godotengine.org/
[audacity]: https://www.audacityteam.org/
[drum]:     https://manual.audacityteam.org/man/risset_drum.html

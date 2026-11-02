#import "@preview/cetz:0.4.2"
#import cetz.draw: *

/// Draws one train marker inside `#cetz.canvas({ … })`.
#let train(
  train-nose-x,
  track-y,
  row-index,
  train-length: 3,
  nose-length: 0.2,
  y-offset: 0.05,
  body-height: 0.4,
  fill: white,
  stroke: 1pt,
  name-prefix: "train-",
) = {
  let train-tail-x = train-nose-x - (train-length - nose-length)
  let center-y = track-y + y-offset + body-height / 2
  let top-y = center-y + body-height / 2
  let bottom-y = center-y - body-height / 2

  line(
    (train-tail-x, bottom-y),
    (train-nose-x - nose-length, bottom-y),
    (train-nose-x, center-y),
    (train-nose-x - nose-length, top-y),
    (train-tail-x, top-y),
    close: true,
    fill: fill,
    stroke: stroke,
    name: name-prefix + str(row-index),
  )
}

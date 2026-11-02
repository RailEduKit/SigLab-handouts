#import "@preview/cetz:0.4.2"
#import cetz.draw: *

/// Simple dynamics model (speed positions and permitted moves). Call inside `#cetz.canvas({ … })`.
#let simple-dynamics-model(
  figure-scale: 1.0,
  origin: (0.0, 0.0),
  name-prefix: "",
  with-outline: false,
  arrow-paint: green,
  fields-fill: blue,
  label-font: "Menlo",
  label-scale: 1.0,
  field-labels: ("field", "fields"),
) = {
  let su(value) = value * figure-scale
  let spt(value) = value * figure-scale * 1pt
  let (origin-x, origin-y) = origin

  let xy(x, y) = (su(x), su(y))
  let arrow-stroke = (paint: arrow-paint, thickness: spt(1.5))
  let box-stroke = (paint: black, thickness: spt(0.6))

  let draw-box-unit(lever-id, center-x, speed, fields, next-center-x: none) = {
    group(name: lever-id, {
      if next-center-x != none {
        bezier(
          xy(center-x + 0.5, 0),
          xy(next-center-x - 0.5, 0),
          xy(center-x + 1.0, -0.5),
          xy(next-center-x - 1.0, -0.5),
          stroke: arrow-stroke,
          mark: (end: ">>", scale: figure-scale),
        )
        bezier(
          xy(next-center-x - 0.5, 2),
          xy(center-x + 0.5, 2),
          xy(next-center-x - 1.0, 2.5),
          xy(center-x + 1.0, 2.5),
          stroke: arrow-stroke,
          mark: (end: ">>", scale: figure-scale),
        )
      }

      rect(
        xy(center-x - 1, 0),
        xy(center-x + 1, 2),
        fill: white,
        stroke: box-stroke,
        name: "body",
      )

      let field-word = if fields == 1 { field-labels.at(0) } else { field-labels.at(1) }
      content(xy(center-x, 1.6), text(font: label-font, size: spt(8.5 * label-scale))[km/h], anchor: "center", name: "label-unit")
      content(xy(center-x, 1.0), text(font: label-font, size: spt(12 * label-scale))[#speed], anchor: "center", name: "label-speed")
      content(
        xy(center-x, 0.3),
        text(font: label-font, size: spt(9 * label-scale), fill: fields-fill)[#fields #field-word],
        anchor: "center",
        name: "label-fields",
      )
      // Hidden anchor for placing the physical lever exactly at box centre.
      hide(
        content(
          xy(center-x, 1.0),
          [],
          anchor: "center",
          name: lever-id + "-slot-center",
        )
      )
    })
  }

  let boxes = (
    (center-x: 1, speed: 0, fields: 0),
    (center-x: 4, speed: 40, fields: 1),
    (center-x: 7, speed: 80, fields: 2),
    (center-x: 10, speed: 120, fields: 3),
  )

  group(name: name-prefix + "control-lever", {
    translate(x: origin-x, y: origin-y)
    for i in range(0, boxes.len()) {
      let box = boxes.at(i)
      let next-center = if i + 1 < boxes.len() {
        boxes.at(i + 1).center-x
      } else {
        none
      }
      draw-box-unit(
        name-prefix + str(box.speed),
        box.center-x,
        box.speed,
        box.fields,
        next-center-x: next-center,
      )
    }
    if with-outline {
      rect-around(
        name-prefix + "0",
        name-prefix + "120",
        padding: su(0.15),
        radius: su(0.2),
        stroke: (paint: black, thickness: spt(0.8)),
      )
    }
  })
}

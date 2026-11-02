#import "@preview/cetz:0.4.2"
#import cetz.draw: *

#let control-lever(
  figure-scale: 0.18,
  origin: (0, 0),
  show-cap-lighting: false,
  stroke-scale: 1.0,
) = {
  let su(value) = value * figure-scale
  let spt(value) = value * figure-scale * 1pt

  // OpenSCAD dimensions from speed_controller.scad
  let cyl-height = 20.0
  let cyl-bottom-d = 10.0
  let cyl-top-d = 12.0
  let sphere-d = 22.0
  let sphere-r = sphere-d / 2.0

  // Sphere intersection depth used in the OpenSCAD model.
  let sphere-intersect = sphere-r - calc.sqrt(sphere-r * sphere-r - (cyl-top-d / 2.0) * (cyl-top-d / 2.0))
  let sphere-center-z = cyl-height - sphere-intersect

  let iso(x, y, z) = (
    rel: (
      su((x - y) * 0.866),
      su(z + (x + y) * 0.35),
    ),
    to: origin,
  )

  // Horizontal circular sections appear as ellipses in this projection.
  let ellipse-rx(radius) = su(radius * 0.95)
  let ellipse-ry(radius) = su(radius * 0.40)
  let shift(point, dx, dy) = (rel: (dx, dy), to: point)

  let body-stroke = (paint: black, thickness: spt(5.2 * stroke-scale))
  let body-fill = luma(86%)
  let highlight-fill = luma(100%)
  let highlight-fill-mid = luma(98%)
  let shadow-fill = luma(82%)

  let base-center = iso(0, 0, 0)
  let top-center = iso(0, 0, cyl-height)

  let r-base = cyl-bottom-d / 2.0
  let r-top = cyl-top-d / 2.0

  // Frustum body
  merge-path({
    arc(
      shift(base-center, -ellipse-rx(r-base), 0),
      radius: (ellipse-rx(r-base), ellipse-ry(r-base)),
      start: 180deg,
      stop: 360deg,
    )
    line(
      shift(base-center, ellipse-rx(r-base), 0),
      shift(top-center, ellipse-rx(r-top), 0),
    )
    line(
      shift(base-center, -ellipse-rx(r-base), 0),
      shift(top-center, -ellipse-rx(r-top), 0),
    )},
    stroke: body-stroke,
    close: true,
    fill: body-fill,
  )

  // Spherical cap with simple shading + specular highlight
  let cap-center = iso(0, 0, sphere-center-z)
  let cap-shadow-center = shift(cap-center, su(1.2), -su(1.0))
  let cap-main-center = shift(cap-center, -su(0.7), su(0.6))
  let cap-shine-center = shift(cap-main-center, -su(2.5), su(2.2))
  let cap-fill = if show-cap-lighting {
    gradient.linear((shadow-fill, 0%), (body-fill, 100%), angle: 140deg)
  } else {
    body-fill
  }

  if show-cap-lighting {
    circle(
      cap-shadow-center,
      radius: su(sphere-r),
      fill: shadow-fill,
      stroke: none,
    )
  }
  circle(
    cap-main-center,
    radius: su(sphere-r),
    fill: cap-fill,
    stroke: body-stroke,
  )
  if show-cap-lighting {
    circle(
      cap-shine-center,
      radius: su(sphere-r * 0.24),
      fill: gradient.linear((highlight-fill, 0%), (highlight-fill-mid, 100%), angle: 140deg),
      stroke: none,
    )
  }
}

#set page(
  width: auto,
  height: auto,
  margin: 0pt,
  numbering: none,
)
#set page(header: none, footer: none)
#set text(font: "Menlo", size: 9pt)

#cetz.canvas({
  import cetz.draw: *
  control-lever()
})
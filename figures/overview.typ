#import "@preview/cetz:0.5.3"
#import "../cetz-templates/tracks.typ": *


#cetz.canvas({
  import cetz.draw: *
  /* 
    draw a track.
    the position of left connector is 0,0
   */
  straight-track((0,0))
})

#cetz.canvas({
  import cetz.draw: *
  /* 
    series of tracks (empty bracket () uses a prevoious coordinate - if there is none it uses 0,0)
    add a name
    name of previous track as position for the next track
    add label, which is shown at the center of the track
   */
  straight-track((), name: "track-1", label: [1])
  straight-track("track-1", name: "track-2", label: [2])
  straight-track("track-2", name: "track-3", label: [3])

})

#cetz.canvas({
  import cetz.draw: *
  /* 
    fill a track
    change stroke of track (use on-layer to have the west connector beneath the previous)
    change stroke of gauge
    disable gauge by setting the stroke to 0pt

   */
  straight-track((0,0), name: "track-1", track-fill: navy)
  straight-track("track-1", name: "track-2", track-stroke:(thickness: 0.7pt, paint: red))
  straight-track("track-2", name: "track-3", gauge-stroke:  (thickness: 2.1pt, paint: purple, dash: "dashed"))
    straight-track("track-3", name: "track-4", gauge-stroke: 0pt)
})

#cetz.canvas({
  import cetz.draw: *
  /* 
    draw a dashed track
    use this to indicate a large amout of straigth tracks
    default length is the length of one track
   */
  dashed-track(()) 
})

#cetz.canvas({
  import cetz.draw: *

  /* 
    use a loop to have less work
    change the langth of the dashed segment 
   */

  for i in range(1, 8){
    if i == 1 {
      straight-track((0,0), name: "track-"+str(i), label: [#i])
    }
    else if i==4 {
      dashed-track(
        "track-"+str(i - 1),
        length: 4, 
        name: "track-"+str(i), label: [L: 5])
    }
    else {
      let j = i+4
      straight-track("track-"+str(i - 1), name: "track-"+str(i), label: 
      if i > 4 {[#j]}
      else {[#i]}
      )
    }
  }
})

#cetz.canvas(
  {
    import cetz.draw: *
    /* 
      standard anchors of typst
     */
    straight-track((), name: "track-1")

    let anchors = ("north", "north-east", "east", "south-east", "south", "south-west", "west", "north-west", "center")

    for name in anchors {
      content("track-1."+name, box(inset: 1pt, fill: white, text(8pt, [#name])), angle: -30deg)
    }
  }
)

#cetz.canvas(
  {
    import cetz.draw: *
    /* 
      special anchors
      forward and backward can be used to place signals and so on
     */
    straight-track((), name: "track-1")

    let anchors = ("start", "end", "forward", "backward")

    for name in anchors {
      content("track-1."+name, box(inset: 1pt, fill: white, text(8pt, [#name])), angle: -30deg)
    }
  }
)

#cetz.canvas(
  {
    import cetz.draw: *
    /* 
      draw only the connector
     */
    connector(())
  }
)

#cetz.canvas(
  {
    import cetz.draw: *
    /* 
      draw only the gauge
     */
    gauge(())
  }
)

#cetz.canvas({
  import cetz.draw: *

  /* 
    test a good distance between two straight tracks
   */

  let draw-track-series(a) = {
    for i in range(1, 8){
      if i == 1 {
        straight-track(a, name: "track-"+str(i), label: [#i])
      }
      else if i==4 {
        dashed-track(
          "track-"+str(i - 1),
          length: 4, 
          name: "track-"+str(i), label: [L: 5])
      }
      else {
        let j = i+4
        straight-track("track-"+str(i - 1), name: "track-"+str(i), label: 
        if i > 4 {[#j]}
        else {[#i]}
        )
      }
    }
  }
  line((0, 1), (10,1))
  draw-track-series((0,0))
  draw-track-series((0,2))
  curved-track((0,0), name: "curve-1")
  circle("curve-1.end", radius: 0.1, stroke: none, fill: red)
  curved-track("curve-1", x-rot: 180deg, z-rot: 45deg)
  
})


//--------------------------------------------------------------------------


/* /// Visual sandbox for `poster/figures/model` drawing primitives.
///
/// Compile from this directory:
///   typst compile test_model.typ
///   typst compile test_model.typ test_model.png --format png
///
/// Add a case by appending another `scene(...)` with a `() => { ... }` body.

#import "@preview/cetz:0.4.2"
#import cetz.draw: *
#import "../cetz-templates/tracks.typ": straight-segment, curve-segment, straight-track
#import "../cetz-templates/train.typ": train

#set page(width: auto, height: auto, margin: 8mm)
#set text(size: 9pt, fill: luma(40))

#let model-scale = 1.0
#let canvas-length = 1.2cm

#let make-connector(scale: model-scale) = (
  segment-width: 1 * scale,
  segment-height: 0.5 * scale,
  rail-offset: 0.1 * scale,
  corner-radius: 0.05 * scale,
)

#let make-side-wall(connector) = connector.segment-height / 17 * 7.5

#let default-outline = (paint: black, thickness: 0.5pt)
#let default-rail = (paint: luma(140), thickness: 1.4pt)

/// One titled canvas panel. `build` is `() => { ... }` so draw calls run
/// inside the canvas (CeTZ needs an active canvas context).
#let scene(title, build) = block(breakable: false, spacing: 10pt)[
  #text(weight: "bold", size: 10pt)[#title]
  #v(2pt, weak: true)
  #cetz.canvas(length: canvas-length, {
    build()
  })
]

#let connector = make-connector()
#let side-wall = make-side-wall(connector)

= Model drawing tests

== Tracks

#scene("straight-segment (BRIO A)", () => {
  straight-segment(
    0, 0, 0, connector, side-wall,
    label: "A",
    outline-stroke: default-outline,
    rail-stroke: default-rail,
  )
})

#scene("curve-segment left / right (BRIO E, 45°)", () => {
  curve-segment(
    0, 1.2, 0, connector, side-wall, "left",
    label: "E L",
    outline-stroke: default-outline,
    rail-stroke: default-rail,
  )
  curve-segment(
    0, -0.6, 1, connector, side-wall, "right",
    label: "E R",
    outline-stroke: default-outline,
    rail-stroke: default-rail,
  )
})

#scene("A + E left — exit heading 45°", () => {
  straight-segment(
    0, 0, 0, connector, side-wall,
    label: "A",
    outline-stroke: default-outline,
    rail-stroke: default-rail,
  )
  curve-segment(
    1, 0, 0, connector, side-wall, "left",
    label: "E",
    outline-stroke: default-outline,
    rail-stroke: default-rail,
  )

  // Centerline exit + tangent guide (not part of the model API)
  let r = connector.segment-width * 202 / 144
  let half = connector.segment-height / 2
  let cx = 1
  let cy = 0 + half + r
  let exit-x = cx + r * calc.cos(-45deg)
  let exit-y = cy + r * calc.sin(-45deg)
  let tangent = (0.8 * calc.cos(45deg), 0.8 * calc.sin(45deg))
  line(
    (exit-x, exit-y),
    (rel: tangent),
    stroke: (paint: red, thickness: 0.7pt, dash: "dashed"),
  )
  circle((exit-x, exit-y), radius: 0.04, fill: red, stroke: none)
})

#scene("A + ER + A — second A at −45°", () => {
  // First A (heading +x)
  straight-segment(
    0, 0, 0, connector, side-wall,
    label: "A₁",
    outline-stroke: default-outline,
    rail-stroke: default-rail,
  )
  // Right curve E
  curve-segment(
    1, 0, 0, connector, side-wall, "right",
    label: "ER",
    outline-stroke: default-outline,
    rail-stroke: default-rail,
  )

  // ER exit pose: for a right turn the inner rim is the continuing "bottom" edge.
  let r = connector.segment-width * 202 / 144
  let half = connector.segment-height / 2
  let cx = 1
  let cy = 0 + half - r
  let exit-angle = 45deg
  let heading = -45deg
  let exit-inner = (
    cx + (r - half) * calc.cos(exit-angle),
    cy + (r - half) * calc.sin(exit-angle),
  )
  let exit-center = (
    cx + r * calc.cos(exit-angle),
    cy + r * calc.sin(exit-angle),
  )

  // Second A in ER's exit frame (bottom-left = exit-inner, heading −45°)
  group({
    translate(x: exit-inner.at(0), y: exit-inner.at(1))
    rotate(heading)
    straight-segment(
      0, 0, 1, connector, side-wall,
      label: "A₂",
      outline-stroke: default-outline,
      rail-stroke: default-rail,
    )
  })

  // Guides: expected −45° centerline through A₂
  let tangent = (connector.segment-width * calc.cos(heading), connector.segment-width * calc.sin(heading))
  line(
    exit-center,
    (rel: tangent),
    stroke: (paint: red, thickness: 0.8pt, dash: "dashed"),
  )
  circle(exit-center, radius: 0.04, fill: red, stroke: none)
  content(
    (
      exit-center.at(0) + 0.55 * tangent.at(0),
      exit-center.at(1) + 0.55 * tangent.at(1) - 0.25,
    ),
    text(size: 7pt, fill: red)[−45°],
  )
})

#scene("A + EL + ER + A — S-curve, final A at 0°", () => {
  let r = connector.segment-width * 202 / 144
  let half = connector.segment-height / 2

  // Place a piece by entry centerline + heading (avoids left/right bottom-edge flips).
  let at-pose(center, heading, build) = {
    group({
      translate(x: center.at(0), y: center.at(1))
      rotate(heading)
      translate(y: -half)
      build()
    })
  }

  // A₁ heading +x — entry centerline at (0, half)
  straight-segment(
    0, 0, 0, connector, side-wall,
    label: "A₁",
    outline-stroke: default-outline,
    rail-stroke: default-rail,
  )
  // EL left from end of A₁
  curve-segment(
    1, 0, 0, connector, side-wall, "left",
    label: "EL",
    outline-stroke: default-outline,
    rail-stroke: default-rail,
  )

  // EL exit centerline @ 45°
  let el-cx = 1
  let el-cy = 0 + half + r
  let el-exit-center = (
    el-cx + r * calc.cos(-45deg),
    el-cy + r * calc.sin(-45deg),
  )
  let el-heading = 45deg

  // ER in EL's exit pose (local right curve from heading +x)
  at-pose(el-exit-center, el-heading, () => {
    curve-segment(
      0, 0, 1, connector, side-wall, "right",
      label: "ER",
      outline-stroke: default-outline,
      rail-stroke: default-rail,
    )
  })

  // ER exit mapped through EL exit pose into global:
  // local ER exit (curve at y=0, after -half shift): (r cos 45°, r(sin 45° − 1))
  let er-exit-local = (
    r * calc.cos(45deg),
    r * (calc.sin(45deg) - 1),
  )
  let c = calc.cos(el-heading)
  let s = calc.sin(el-heading)
  let er-exit-center = (
    el-exit-center.at(0) + er-exit-local.at(0) * c - er-exit-local.at(1) * s,
    el-exit-center.at(1) + er-exit-local.at(0) * s + er-exit-local.at(1) * c,
  )
  let a2-heading = el-heading + (-45deg) // 0°

  at-pose(er-exit-center, a2-heading, () => {
    straight-segment(
      0, 0, 2, connector, side-wall,
      label: "A₂",
      outline-stroke: default-outline,
      rail-stroke: default-rail,
    )
  })

  // Guide along A₂
  let tangent = (
    connector.segment-width * calc.cos(a2-heading),
    connector.segment-width * calc.sin(a2-heading),
  )
  line(
    er-exit-center,
    (rel: tangent),
    stroke: (paint: red, thickness: 0.8pt, dash: "dashed"),
  )
  circle(er-exit-center, radius: 0.04, fill: red, stroke: none)
  content(
    (
      er-exit-center.at(0) + 0.55 * tangent.at(0),
      er-exit-center.at(1) + 0.55 * tangent.at(1) - 0.28,
    ),
    text(size: 7pt, fill: red)[A₂ @ 0°],
  )
})

#scene("EL + EL + EL + EL — four lefts = 180°", () => {
  let r = connector.segment-width * 202 / 144
  let half = connector.segment-height / 2

  let at-pose(center, heading, build) = {
    group({
      translate(x: center.at(0), y: center.at(1))
      rotate(heading)
      translate(y: -half)
      build()
    })
  }

  // Advance pose through one left E (local frame after -half shift).
  let after-left(center, heading) = {
    let local = (
      r * calc.cos(-45deg),
      r * (1 + calc.sin(-45deg)),
    )
    let c = calc.cos(heading)
    let s = calc.sin(heading)
    (
      center: (
        center.at(0) + local.at(0) * c - local.at(1) * s,
        center.at(1) + local.at(0) * s + local.at(1) * c,
      ),
      heading: heading + 45deg,
    )
  }

  let p0 = (center: (0, 0), heading: 0deg)
  let p1 = after-left(p0.center, p0.heading)
  let p2 = after-left(p1.center, p1.heading)
  let p3 = after-left(p2.center, p2.heading)
  let p4 = after-left(p3.center, p3.heading)
  let poses = (p0, p1, p2, p3)

  for i in range(0, 4) {
    let p = poses.at(i)
    let idx = i
    at-pose(p.center, p.heading, () => {
      curve-segment(
        0, 0, idx, connector, side-wall, "left",
        label: "EL" + str(idx + 1),
        outline-stroke: default-outline,
        rail-stroke: default-rail,
      )
    })
  }

  // Final heading 180° (leftward)
  let tangent = (
    0.9 * calc.cos(p4.heading),
    0.9 * calc.sin(p4.heading),
  )
  line(
    p4.center,
    (rel: tangent),
    stroke: (paint: red, thickness: 0.8pt, dash: "dashed"),
  )
  circle(p4.center, radius: 0.04, fill: red, stroke: none)
  content(
    (
      p4.center.at(0) + 0.5 * tangent.at(0),
      p4.center.at(1) + 0.5 * tangent.at(1) + 0.22,
    ),
    text(size: 7pt, fill: red)[180°],
  )
})

#scene("straight-track row", () => {
  straight-track(
    0,
    0,
    track-begin: 0,
    track-end: 3,
    edge-at-begin: true,
    edge-at-end: true,
    outline-stroke: default-outline,
    rail-stroke: default-rail,
  )
})

== Trains

#scene("train on straight-track", () => {
  straight-track(
    0,
    0,
    track-begin: 0,
    track-end: 5,
    outline-stroke: default-outline,
    rail-stroke: default-rail,
  )
  train(4, 0, 0, fill: luma(230), stroke: 1pt + luma(40))
})

// ---------------------------------------------------------------------------
// Further cases — import the new module above, then:
//
// #scene("my new piece", () => {
//   my-piece(...)
// })
// ---------------------------------------------------------------------------
 */
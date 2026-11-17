#import "@preview/cetz:0.5.3"
#import "../cetz-templates/tracks.typ": *







/* #let model-scale = 1.0

#let make-connector(scale: model-scale) = (
  segment-width: 1 * scale,
  segment-height: 0.5 * scale,
  rail-offset: 0.1 * scale,
  corner-radius: 0.05 * scale,
)

#let make-side-wall(connector) = connector.segment-height / 17 * 7.5

#let connector = make-connector()
#let side-wall = make-side-wall(connector)

#let default-outline = (paint: black, thickness: 0.5pt)
#let default-rail = (paint: luma(140), thickness: 1.4pt)


#cetz.canvas({
  import cetz.draw:*
  straight-segment(
    0, 
    0, 
    0, 
    connector, side-wall,
    label: "A",
    outline-stroke: default-outline,
    rail-stroke: default-rail,
  )
})

#cetz.canvas({
  import cetz.draw:*
  let scale = 1.0
}) */
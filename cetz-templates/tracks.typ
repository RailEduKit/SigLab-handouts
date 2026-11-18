
#import "@preview/cetz:0.5.3"
// TODO How to define global style settings, which can be overritten locally? Can I acces in a function had global variables? And then put them or the overritten variable in a local variable, so that the function don't access the global variables directly

// TODO how to set the style of the label global?

#let connector(a, name: none, connector-stroke:  0.5pt + black) = {
  // TODO change crown and trunk parameters according the straight track
  // TODO add fill option
  import cetz.draw:*
  let crown-r = 1/7
  let trunk-l = 3/14
  rect((rel: (0, -crown-r/2), to: (a)), (rel: (trunk-l+crown-r, crown-r)), name: "trunk", stroke: none)
  circle("trunk.east", radius: crown-r, name: "crown", stroke: none)

  boolean(
    "trunk",
    "crown",
    op:"union",
    name: name,
    stroke: connector-stroke
  )
}

#let gauge(a, length: 2, name: none, gauge-stroke: 2.1pt + gray) = {
  import cetz.draw: *
  let body-l = length
  let body-h = 1
  let belt-amount = 14
  let belt-h = body-h/belt-amount
  group(
    name: name, {
      set-origin(a)
      line((0, 4*belt-h), (rel: (body-l,0)), name: "top-gauge", stroke: gauge-stroke)
      line((0, -4*belt-h),(rel: (body-l,0)), stroke: gauge-stroke)
    }
  )
}

#let dashed-track(
  a, 
  length: 2, 
  name: none, 
  track-stroke: (paint: black, thickness: 0.7pt, dash: "dashed"),
  gauge-stroke: (paint: gray, thickness: 2.1pt, dash: "dashed"),
  label: none
) = {
  // TODO add fill option
  import cetz.draw: *
  let body-l = length
  let body-h = 1

  group(
    name: name,
    {
      set-origin(a)  
      line((0,body-h/2), (rel: (body-l, 0)), name: "top-line", stroke: track-stroke)
      line((0, -body-h/2), (rel: (body-l, 0)), stroke: track-stroke)
      gauge((0,0), length: body-l, gauge-stroke: gauge-stroke)
      content((body-l/2,0), [#label])

      anchor("default", (body-l,0))
      anchor("end", "default")
      anchor("start", (0,0))
      anchor("center", (body-l/2,0))
    }
  )
  
}


#let straight-track(
  a, 
  name: none, 
  track-stroke: 0.7pt + black, 
  track-fill: none,
  gauge-stroke: 2.1pt + gray,
  label: none
) = {
  // To have no gauge set stroke to 0pt
  // TODO add rotation, so that it automatically fits on a previous curve 
  // TODO how to make set-gauge style possible, to set the style once and apply it to all elements 
  import cetz.draw: *
  let body-l = 2
  let body-h = 1
  let belt-amount = 14
  let belt-h = body-h/belt-amount
  group(
    name: name,
    {
      set-origin(a)
      rect((0,-body-h/2), (rel: (body-l,body-h)), name:"body", stroke: none)
      connector("body.west", name: "west-connector", connector-stroke: none)
      connector("body.east", name: "east-connector", connector-stroke: none)

      let body-east-west-connectors(fill-setting) = {
        boolean(
          "body",
          "east-connector",
          op: "union",
          name: "body-east-con",
          stroke: none
        )
        boolean(
          "body-east-con",
          "west-connector",
          op: "difference",
          name: "body-east-west-connectors",
          stroke: track-stroke,
          fill: fill-setting
        )
      }
      body-east-west-connectors(track-fill)
      gauge((0,0), gauge-stroke: gauge-stroke)
      body-east-west-connectors(none)
      content((body-l/2,0), [#label])


      anchor("default", (body-l,0))

      anchor("center", (body-l/2,0))
      anchor("north", (body-l/2, body-h/2))
      anchor("north-east", (body-l, body-h/2))
      anchor("east", (body-l, 0))
      anchor("south-east", (body-l, -body-h/2))
      anchor("south", (body-l/2, -body-h/2))
      anchor("south-west", (0, -body-h/2))
      anchor("west", (0,0))
      anchor("north-west", (0, body-h/2))

      anchor("end", "default")
      anchor("start", (0,0))
      anchor("forward", "south-east")
      anchor("backward", "north-west")

    }
  )
  
  
}


#let curved-track(
  a,
  name: none,
  z-rot: 0deg,
  x-rot: 0deg
) = {
  import cetz.draw: *
  // TODO add rotate option
  // TODO merge the lines
  // TODO check if a left/right combination ends exactly at the second track
  let body-l = 2
  let body-h = 1
  let belt-amount = 14
  let belt-h = body-h/belt-amount
  let track-spacing = 2
  
  let curve-end = (body-l, (body-h+track-spacing)/2) 
  let x = calc.sqrt(calc.pow(body-h/2,2)/2)
  let south-east = (body-l+x, (body-h+track-spacing)/2 -x) 
  let y = calc.sqrt(calc.pow(south-east.at(0), 2) + calc.pow(south-east.at(1), 2))
  let alpha = calc.asin(south-east.at(1)/y)
  let beta = 90deg - alpha
  let curve-angle = (180deg - 90deg - beta)*2
  let outer-r = (y/2) / calc.sin(curve-angle/2)
  content((0,-3),[#x])



/*   let curve-angle = 45deg
  let outer-curve-h = 1.5 * body-h - calc.sqrt(calc.pow(body-h/2,2)/2)
  let x = calc.sqrt(calc.pow(body-l,2)+calc.pow(outer-curve-h,2))
  let outer-r = (x/2) / calc.sin(curve-angle/2) */
  
  set-origin(a)
  rotate(z: z-rot, x: x-rot)
  group(
    name: name,
    {
      /* 
      - the curve has to have the same length in x direction
      - a left/ right combination has to have the same length as the two straigth tracks 
      - a left right combination should end in a new track, with a good distance to the previous track*/
      merge-path({
        // TODO measure the angles of the prevoius element to set the angle of the next element. Or is this not neede, because the angles will not change, even though the size will maybe change?
        // TODO merge path does not merge the beginning with the end properly
        line((0, body-h/2), (rel: (0, - body-h)), name:"vertical-line")
        arc((), start: 270deg, delta: curve-angle, radius: outer-r, name: "outer-curve")
        line((), (rel: (angle: 45deg + 90deg, radius: body-h)), name: "diagonal-line")
        arc((), start: curve-angle + 270deg, delta: -curve-angle, radius: outer-r - body-h)
        //arc("vertical-line.start", start: 270deg, delta: 45deg, radius: outer-r - body-h, name: "inner-curve")
        //line("outer-curve.end", "inner-curve.end", name: "diagonal-line")
      })
      anchor("default", "diagonal-line.mid")
      anchor("end", "diagonal-line.mid")
      anchor("start", (0,0))
    }
  )
}

#let calc-radius() = {
    import cetz.draw: *
  // TODO add rotate option
  // TODO merge the lines
  // TODO check if a left/right combination ends exactly at the second track
  let body-l = 2
  let body-h = 1
  let belt-amount = 14
  let belt-h = body-h/belt-amount
  let track-spacing = 2
  
  let curve-end = (body-l, (body-h+track-spacing)/2) // Bedingung damit 2 Bögen genau auf dem nächsten TRack liegen
  let x = calc.sqrt(calc.pow(body-h/2,2)/2) 
  let south-east = (body-l+x, (body-h+track-spacing)/2 -x) // Hier muss der Bogen enden, damit die diagonale gerade genau an der richtigen Stelle liegt 
  let south-west = (0,0) // hier startet der Bogen
  let y = calc.sqrt(calc.pow(south-east.at(0), 2) + calc.pow(south-east.at(1), 2))
  let alpha = calc.asin(south-east.at(1)/y)
  let beta = 90deg - alpha
  let curve-angle = (180deg - 90deg - beta)*2
  let outer-r = (y/2) / calc.sin(curve-angle/2)

  circle(curve-end, radius: 0.1, stroke: none, fill: red)
  circle(south-east, radius: 0.1, stroke: none, fill: blue)
  circle(south-west, radius: 0.1, stroke: none, fill: blue)

  line(south-west, (rel: (0, body-h)), name: "vertical-line")
  line(south-east, (rel: (angle: 45deg + 90deg, radius: body-h)), name: "diagonal-line")

  line("diagonal-line.mid", (rel: (angle: 270deg, radius: x)))
  line((), (rel: (angle: 0deg, radius: x)))

  line(south-west, (rel: (angle: (90deg - 67.5deg), radius: y)))
  content((0,-3),[#curve-angle])

}

#cetz.canvas({
  import cetz.draw: *
  calc-radius()


/*   curved-track((), name: "curve-1")
  circle("curve-1.end", radius: 0.1, stroke: none, fill: red)
  curved-track("curve-1", x-rot: 180deg, z-rot: 45deg) */
})

/* #import "@preview/cetz:0.4.2"
#import cetz.draw: *

/// Draws one straight track row (solid segments plus optional dashed edge segments) inside `#cetz.canvas({ … })`.
#let straight-segment(
  segment-x,
  y,
  row-index,
  connector,
  side-wall-height,
  label: auto,
  outline-stroke: (paint: black, thickness: 0.4pt),
  rail-stroke: (paint: gray, thickness: 1.2pt),
  label-size: 6pt,
) = {
  let segment-label(value, segment-label) = {
    if segment-label == auto { value } else { segment-label }
  }

  let segment-center = (
    segment-x + connector.segment-width / 2,
    y + connector.segment-height / 2,
  )

  let top-rail-y = y + connector.rail-offset
  let bottom-rail-y = y + connector.segment-height - connector.rail-offset

  let draw-rails(stroke) = {
    line(
      (segment-x, top-rail-y),
      (segment-x + connector.segment-width, top-rail-y),
      stroke: stroke,
    )
    line(
      (segment-x, bottom-rail-y),
      (segment-x + connector.segment-width, bottom-rail-y),
      stroke: stroke,
    )
  }

  let draw-track-segment-outline() = {
    merge-path(
      {
        line(
          (segment-x, y),
          (rel: (connector.segment-width, 0)),
          (rel: (0, side-wall-height)),
          (rel: (connector.corner-radius, 0)),
        )
        arc((rel: (0, 0)), radius: connector.corner-radius, start: -145deg, stop: 145deg)
        line(
          (rel: (0, 0)),
          (rel: (-connector.corner-radius, 0)),
          (rel: (0, side-wall-height)),
          (rel: (-connector.segment-width, 0)),
          (rel: (0, -side-wall-height)),
          (rel: (connector.corner-radius, 0)),
        )
        arc((rel: (0, 0)), radius: connector.corner-radius, start: 145deg, stop: -145deg)
        line((rel: (0, 0)), (rel: (-connector.corner-radius, 0)))
      },
      close: true,
      stroke: outline-stroke,
    )
  }

  group(
    name: "track-segment-" + str(segment-x) + "-" + str(row-index),
    {
      draw-track-segment-outline()
      draw-rails(rail-stroke)
    },
  )
  content(
    segment-center,
    text(fill: gray, size: label-size)[#segment-label(segment-x, label)],
    anchor: "center",
  )
}

/// BRIO type-E curve: 1/8 circle (45°). Centerline radius is 202 mm relative to
/// type-A length 144 mm (= `connector.segment-width`). `direction` is `"left"`
/// (toward +y) or `"right"` (toward -y) for travel in +x at the entry end.
#let curve-segment(
  segment-x,
  y,
  row-index,
  connector,
  side-wall-height,
  direction,
  label: auto,
  outline-stroke: (paint: black, thickness: 0.4pt),
  rail-stroke: (paint: gray, thickness: 1.2pt),
  label-size: 6pt,
) = {
  assert(
    direction == "left" or direction == "right",
    message: "curve-segment direction must be \"left\" or \"right\", got: " + repr(direction),
  )

  let segment-label(value, segment-label) = {
    if segment-label == auto { value } else { segment-label }
  }

  let half-h = connector.segment-height / 2
  // BRIO E: centerline radius 202 mm; A length 144 mm
  let r-center = connector.segment-width * 202 / 144
  let r-outer = r-center + half-h
  let r-inner = r-center - half-h
  let r-rail-outer = r-outer - connector.rail-offset
  let r-rail-inner = r-inner + connector.rail-offset

  let entry-center = (segment-x, y + half-h)
  let turn-left = direction == "left"

  // Circle centre sits to the inside of the turn; entry heading is +x.
  let (cx, cy) = if turn-left {
    (entry-center.at(0), entry-center.at(1) + r-center)
  } else {
    (entry-center.at(0), entry-center.at(1) - r-center)
  }

  let start-angle = if turn-left { -90deg } else { 90deg }
  let stop-angle = if turn-left { -45deg } else { 45deg }

  let polar(radius, angle) = (
    cx + radius * calc.cos(angle),
    cy + radius * calc.sin(angle),
  )

  let mid-angle = (start-angle + stop-angle) / 2
  let label-pos = polar(r-center, mid-angle)

  // Outward unit vector along the track at an end (away from the piece).
  let end-outward(angle, at-exit) = {
    // Tangent for CCW travel: (-sin, cos); for CW: (sin, -cos).
    let (tx, ty) = if turn-left {
      (-calc.sin(angle), calc.cos(angle))
    } else {
      (calc.sin(angle), -calc.cos(angle))
    }
    if at-exit { (tx, ty) } else { (-tx, -ty) }
  }

  // Unit vector along the end face from outer rim toward inner rim.
  let face-outer-to-inner(angle) = (
    -calc.cos(angle),
    -calc.sin(angle),
  )

  let v-add(a, b) = (a.at(0) + b.at(0), a.at(1) + b.at(1))
  let v-scale(a, s) = (a.at(0) * s, a.at(1) * s)

  let entry-outer = polar(r-outer, start-angle)
  let entry-inner = polar(r-inner, start-angle)
  let exit-outer = polar(r-outer, stop-angle)
  let exit-inner = polar(r-inner, stop-angle)

  // Male exit — always traversed so along × outward < 0 (same winding as
  // straight-segment's right peg). Caller must start at `from` and end at `to`.
  // Typst calc.atan2 takes (x, y), unlike C's atan2(y, x).
  let draw-male-connector(from, to, along-travel) = {
    let outward = end-outward(stop-angle, true)
    let ref = calc.atan2(outward.at(0), outward.at(1))
    let r = connector.corner-radius
    line(
      from,
      (rel: v-scale(along-travel, side-wall-height)),
      (rel: v-scale(outward, r)),
    )
    arc(
      (rel: (0, 0)),
      radius: r,
      start: ref - 145deg,
      delta: 290deg,
    )
    line(
      (rel: (0, 0)),
      (rel: v-scale(outward, -r)),
      to,
    )
  }

  // Female entry — straight-segment left-end construction (entry face is vertical).
  let draw-female(from-inner-to-outer) = {
    let inward = (1, 0) // into the wood for heading +x
    let along = if from-inner-to-outer {
      if turn-left { (0, -1) } else { (0, 1) }
    } else {
      if turn-left { (0, 1) } else { (0, -1) }
    }
    let ref = 0deg
    let cross = along.at(0) * inward.at(1) - along.at(1) * inward.at(0)
    let start-pt = if from-inner-to-outer { entry-inner } else { entry-outer }
    let end-pt = if from-inner-to-outer { entry-outer } else { entry-inner }
    line(
      start-pt,
      (rel: v-scale(along, side-wall-height)),
      (rel: v-scale(inward, connector.corner-radius)),
    )
    if cross >= 0 {
      arc(
        (rel: (0, 0)),
        radius: connector.corner-radius,
        start: ref + 145deg,
        delta: -290deg,
      )
    } else {
      arc(
        (rel: (0, 0)),
        radius: connector.corner-radius,
        start: ref - 145deg,
        delta: 290deg,
      )
    }
    line(
      (rel: (0, 0)),
      (rel: v-scale(inward, -connector.corner-radius)),
      end-pt,
    )
  }

  let draw-track-segment-outline() = {
    // Left: outer→male(outer→inner)→inner reverse — male winding matches straight.
    // Right: reverse the loop so male still runs with the same winding.
    merge-path(
      {
        if turn-left {
          draw-female(true) // inner → outer
          arc(entry-outer, start: start-angle, stop: stop-angle, radius: r-outer)
          draw-male-connector(exit-outer, exit-inner, face-outer-to-inner(stop-angle))
          arc(exit-inner, start: stop-angle, stop: start-angle, radius: r-inner)
        } else {
          draw-female(false) // outer → inner
          arc(entry-inner, start: start-angle, stop: stop-angle, radius: r-inner)
          // along from inner → outer so along × outward < 0
          draw-male-connector(
            exit-inner,
            exit-outer,
            (
              -face-outer-to-inner(stop-angle).at(0),
              -face-outer-to-inner(stop-angle).at(1),
            ),
          )
          arc(exit-outer, start: stop-angle, stop: start-angle, radius: r-outer)
        }
      },
      close: true,
      stroke: outline-stroke,
    )
  }

  let draw-rails(stroke) = {
    arc(
      polar(r-rail-outer, start-angle),
      start: start-angle,
      stop: stop-angle,
      radius: r-rail-outer,
      stroke: stroke,
    )
    arc(
      polar(r-rail-inner, start-angle),
      start: start-angle,
      stop: stop-angle,
      radius: r-rail-inner,
      stroke: stroke,
    )
  }

  group(
    name: "curve-segment-" + direction + "-" + str(row-index),
    {
      draw-track-segment-outline()
      draw-rails(rail-stroke)
    },
  )
  content(
    label-pos,
    text(fill: gray, size: label-size)[#segment-label(direction, label)],
    anchor: "center",
  )
}

#let straight-track(
  track-y,
  row-index,
  track-begin: -2,
  track-end: 10,
  side-wall-height: none,
  scale: 1,
  edge-at-begin: false,
  edge-at-end: false,
  label-size: auto,
  outline-stroke: (paint: black, thickness: 0.4pt),
  rail-stroke: (paint: gray, thickness: 1.2pt),
  dashed-rail-stroke: (dash: "dashed", paint: gray, thickness: 1.2pt),
  end-boundary-stroke: (dash: "dashed", paint: black, thickness: 0.4pt),
) = {
  let _scale-stroke(stroke) = (
    ..stroke,
    thickness: stroke.thickness * scale,
  )

  let _segment-width = 1 * scale
  let _segment-height = 0.5 * scale
  let _connector = (
    segment-width: _segment-width,
    segment-height: _segment-height,
    rail-offset: 0.1 * scale,
    corner-radius: 0.05 * scale,
  )
  let _label-size = if label-size == auto { 6pt * scale } else { label-size }

  let _side-wall-height = if side-wall-height == none {
    _segment-height / 17 * 7.5
  } else {
    side-wall-height * scale
  }

  let _segment-label(segment-x, label) = {
    if label == auto { segment-x } else { label }
  }

  let _segment-center(segment-x, y) = (
    segment-x + _connector.segment-width / 2,
    y + _connector.segment-height / 2,
  )

  let _top-rail-y(y) = y + _connector.rail-offset
  let _bottom-rail-y(y) = y + _connector.segment-height - _connector.rail-offset

  let _draw-rails(segment-x, y, stroke) = {
    line(
      (segment-x, _top-rail-y(y)),
      (segment-x + _connector.segment-width, _top-rail-y(y)),
      stroke: stroke,
    )
    line(
      (segment-x, _bottom-rail-y(y)),
      (segment-x + _connector.segment-width, _bottom-rail-y(y)),
      stroke: stroke,
    )
  }

  let _draw-end-cell(segment-x, y, label: auto) = {
    line(
      (segment-x, y),
      (rel: (_connector.segment-width, 0)),
      stroke: _scale-stroke(end-boundary-stroke),
    )
    line(
      (segment-x, y + _connector.segment-height),
      (rel: (_connector.segment-width, 0)),
      stroke: _scale-stroke(end-boundary-stroke),
    )
    _draw-rails(segment-x, y, _scale-stroke(dashed-rail-stroke))
    content(
      _segment-center(segment-x, y),
      text(size: _label-size, fill: gray)[#_segment-label(segment-x, label)],
      anchor: "center",
    )
  }

  for segment-x in range(track-begin, track-end + 1) {
    let is-begin-edge = edge-at-begin and segment-x == track-begin
    let is-end-edge = edge-at-end and segment-x == track-end
    if is-begin-edge or is-end-edge {
      _draw-end-cell(segment-x, track-y, label: segment-x)
    } else {
      straight-segment(
        segment-x,
        track-y,
        row-index,
        _connector,
        _side-wall-height,
        outline-stroke: _scale-stroke(outline-stroke),
        rail-stroke: _scale-stroke(rail-stroke),
        label-size: _label-size,
      )
    }
  }
}
 */
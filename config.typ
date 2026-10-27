#let warning-to-set-lang = text(fill: orange)[The language has to be set either to German or English to show this section]


/* ++ Document Style ++ */
#let font-sans = "Libertinus Sans"

#let conf_heading(
  doc,
  heading_break: true,
  break_to: "odd",
  size_max: 22pt,
  step: 2pt,
  size_min: 14pt
  ) = {
  let heading_size(level) = size_max - step * level
  // pagebreak before level 1 header
  show heading.where(level: 1): it => if heading_break == true {
      pagebreak(weak: true, to: break_to); it 
    } 
    else { it }
  // heading size and font
  show heading: it => if heading_size(it.level) > size_min { // heading size has to be bigger than the minimum
      text(size: (heading_size(it.level)), font: font-sans, it) // heading size dependent on level
    }
    else {
      text(size: size_min, it)
    }
  set heading(numbering: "1.1")
  doc
}

/* ++ Style of text variables ++ */

#let small_heading(content) = {text(size: 12pt, weight: "bold", content)} // TODO rename

#let rollen = small_heading([Rollen])
#let role = small_heading([Roles])

#let materialien = small_heading([Materialien])
#let materials = small_heading([Materials])

#let setup = small_heading([Setup])
#let aufbau = small_heading([Aufbau]) //@Martin previously "Ausgangssituation" I think "Aufbau" is better

#let ablauf = small_heading([Phasen einer Runde])
#let procedure = small_heading([Phases of a Round])

#let tasks = small_heading([Tasks])
#let aufgaben = small_heading([Aufgaben])

#let runde(number) = small_heading([Runde #number])
#let round(number) = small_heading([Round #number])
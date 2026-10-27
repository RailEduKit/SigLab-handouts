#import "@preview/hydra:0.6.2": hydra
#import "config.typ":*


#set document(
  title: [Interactive Signalling Laboratory],
  author: ("Martin Scheidt", "Julek Weck", "contributers"), // TODO better word than contributers
  description: [game based learning],
  keywords: ("railway", "infrastructure", "serious gaming", "game base learning")
)

#set page(
  "a4",
  header: context{
    // Hydra package doesn't show text on pages where a heading level 1 is
    let text_style(content) = text(font: font-sans,size: 10pt)[#content]
    let text-size = measure(text_style(hydra(1)))
    align(center)[#text_style(hydra(1))]
    v(-2.5mm)
    if text-size.width > 0mm { // this makes sure, that the line isn't drawn, when there is no header text
    line(length: 100%, stroke: 0.25mm + rgb("#333333"))        
    }
  }
)

#show link: set text(fill: rgb("#003872"))

// skip header and footer on empty pages
// source: https://forum.typst.app/t/how-can-i-suppress-headers-and-footers-on-blank-verso-trailing-pages/4384/9
#show selector.or(
  pagebreak.where(to: "odd"),
  pagebreak.where(to: "even"),
): set page(header: none, footer: none)

#show: conf_heading.with(
  heading_break: true,
  break_to: "odd",
  size_max: 24pt,
  step: 2pt,
  size_min: 14pt
)

#set text(lang: "de")


#include "frontmatter/titlepage.typ"
#pagebreak() // This pagebreak is mandatory for the titlepage. Otherwise the titlepage isn't shown. It is also not shown for with weak:true
#outline() // TODO the outline of latex version of this document has another styling, which I like more. Can I rebuild it? 
// TODO add QR code with PDF Download URL
#include "frontmatter/copyright.typ"

#set page(
  footer: align(center)[#context{counter(page).display()}]
)

= Fahrdynamik

#include "tutorials-converted-from-Latex/aim.typ"
#include "tutorials-converted-from-Latex/trainrun_de.typ"
#pagebreak(weak: true, to: "odd")
#include "tasks-converted-from-Latex/runningtime_de.typ"
#pagebreak(weak: true)
#include "tasks-converted-from-Latex/viewpoint_de.typ"


= Zugfolgesicherung

#include "tutorials-converted-from-Latex/followprotection_de.typ"
#pagebreak(weak: true, to: "odd")
#include "tasks-converted-from-Latex/blocksection_de.typ"
#pagebreak(weak: true)
#include "tasks-converted-from-Latex/trafficflow_de.typ"







= Fahrwegsicherung

#include "tutorials-converted-from-Latex/routeprotection_de.typ"
#pagebreak(weak: true, to: "odd")
#include "tasks-converted-from-Latex/routes_de.typ"
#pagebreak(weak: true)
#include "tasks-converted-from-Latex/overlap_de.typ"
#pagebreak(weak: true)
#include "tasks-converted-from-Latex/selectiveprotectivepoints_de.typ"


= Betriebsplanung und -steuerung

#include "tasks-converted-from-Latex/network_de.typ"


#pagebreak(weak: true, to: "odd")
#include "backmatter-converted-from-LaTeX/versionhistory.typ"
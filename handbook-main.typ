#import "@preview/hydra:0.6.3": hydra

#let is-page-empty() = {
  // TODO make this function work
  // source https://forum.typst.app/t/how-can-i-suppress-headers-and-footers-on-blank-verso-trailing-pages/4384
  // doesn't work right now
  let page-num = here().page()
  query(selector.or(<ep-start>, <ep-end>))
    .chunks(2)
    .any(((start, end)) => {
      start.location().page() < page-num and page-num < end.location().page()
    })
}

#set document(
  title: [Interactive Signalling Laboratory],
  author: ("Martin Scheidt", "Julek Weck", "contributers"), // TODO better word than contributers
  description: [game based learning],
  keywords: ("railway", "infrastructure", "serious gaming", "game base learning")
)

#set page(
  "a4",
  header: context if not is-page-empty(){
    // TODO don't show on empty page
    // TODO don't show above headings with level 1 
    align(center)[#text(font:"libertinus sans",size: 9pt)[#hydra(1)]] // TODO add libertinus font family to this project
    v(-2.5mm)
    line(length: 100%, stroke: 0.25mm + rgb("#333333"))        
    },
  footer: align(center)[#context{counter(page).display()}]
)

#set text(lang: "de")





#include "frontmatter/titlepage.typ" // TODO create Titlepage
#pagebreak(weak: true)
#outline()
#include "frontmatter/copyright.typ" // TODO create copyright
#pagebreak(weak: true, to: "odd")

= Fahrdynamik

#include "tutorials-converted-from-Latex/aim.typ"
#include "tutorials-converted-from-Latex/trainrun_de.typ"
#pagebreak(weak: true, to: "odd")
#include "tasks-converted-from-Latex/runningtime_de.typ"
#pagebreak(weak: true)
#include "tasks-converted-from-Latex/viewpoint_de.typ"

#pagebreak(weak: true, to: "odd")
= Zugfolgesicherung

#include "tutorials-converted-from-Latex/followprotection_de.typ"
#pagebreak(weak: true, to: "odd")
#include "tasks-converted-from-Latex/runningtime_de.typ"
#pagebreak(weak: true)
#include "tasks-converted-from-Latex/viewpoint_de.typ"

#pagebreak(weak: true, to: "odd")
= Zugfolgesicherung

#include "tutorials-converted-from-Latex/followprotection_de.typ"
#pagebreak(weak: true, to: "odd")
#include "tasks-converted-from-Latex/blocksection_de.typ"
#pagebreak(weak: true)
#include "tasks-converted-from-Latex/trafficflow_de.typ"

#pagebreak(weak: true, to: "odd")
= Fahrwegsicherung

#include "tutorials-converted-from-Latex/routeprotection_de.typ"
#pagebreak(weak: true, to: "odd")
#include "tasks-converted-from-Latex/routes_de.typ"
#pagebreak(weak: true)
#include "tasks-converted-from-Latex/overlap_de.typ"
#pagebreak(weak: true)
#include "tasks-converted-from-Latex/selectiveprotectivepoints_de.typ"

#pagebreak(weak: true, to: "odd")
= Betriebsplanung und -steuerung

#include "tasks-converted-from-Latex/network_de.typ"


#pagebreak(weak: true, to: "odd")
#include "backmatter-converted-from-LaTeX/versionhistory.typ"
#import "../config.typ":*
== Aufgaben: Zugfolge mit Fahrstraßen 

#rollen\
  - Spielleiter
  - Triebfahrzeugführer eines beliebigen Zuges
  - Triebfahrzeugführer eines anderen beliebigen Zuges
  - Fahrdienstleiter

#materialien\
  - Gleise
  - Weichen mit
    - Fahrstraßenfelder
    - Fahrstraßenzugschlussstellen
  - Mindestens zwei vollständige Blöcke mit Vorsignal, Hauptsignal und Signalzugschlusstelle
  - zwei unterschiedliche Züge mit zugehörigen Fahrdynamikmodell, Zugschluss- und -spitzensignal

#aufbau\
  // TODO add figure #tikzfigure("challenge3_setup1.tikz")

  Die beiden Züge Stehen im Bahnhof A und sollen nacheinander in den Bahnhof B fahren. Weiche im abzweigenden Strang dürfen jeweils maximal mit 80 $frac("km", "h", style: "skewed")$ befahren werden. Im durchgehenden Strang ist die Geschwindigkeit nicht begrenzt.

#aufgaben\
  #[
    #set enum(numbering: "a)")

    + Ergänzt die Infrastruktur mit Vorsignalen, Blocksignalen, Fahrstraßensignalen, Signalzugschlussstellen und Fahrstraßenzugschlussstellen!
    + Wählt begründet den Zug aus, der als erster abfahren soll!
    + Wie viele Runden dauert es bis der zweite Zug abfahren kann?
    + Wie viele Runden dauert es bis beide Züge (Summe der Runden von Zug 1 und Zug 2) im Zielbahnhof angekommen sind?
  ]

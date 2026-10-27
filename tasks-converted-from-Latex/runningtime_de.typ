#import "../config.typ":*

== Aufgaben: Fahrzeitberechnung 

#rollen\
  - Spielleiter
  - Triebfahrzeugführer des Nahverkehrszuges

#materialien\
  - Gleise
  - drei Bahnsteige
  - Nahverkehrszug (braun) mit passendem Fahrdynamikmodell, Zugschluss- und -spitzensignal

#aufbau\
  // TODO add figure #tikzfigure("challenge1_setup.tikz")

#aufgaben\
  Der Zug steht auf Feld 0 und sein Schalthebel steht auf 0 $frac("km", "h", style: "skewed")$ (0 Felder).

  #[
    #set enum(numbering: "a)")

    + Der Zug beschleunigt jetzt maximal, bis zu welchem Feld ist er in *neun* Runden gelangt?
    + Der Zug startet wieder bei Feld 0 und soll jetzt an beiden Bahnhöfen für jeweils 1 Runde halten (nachdem der Schalthebel auf 0 $frac("km", "h", style: "skewed")$ steht), damit Fahrgäste umsteigen können. Wie viele Runden braucht er *mindestens*?
  ]

#aufbau\
  Der Zug befindet sich auf Feld 0 und sein Schalthebel steht auf Höchstgeschwindigkeit.

  #[
    #set enum(numbering: "a)", start: 3)

    + Der Zug fährt ohne Halt und soll die Strecke vollständig verlassen. Wie viele Runden benötigt er?
  ]

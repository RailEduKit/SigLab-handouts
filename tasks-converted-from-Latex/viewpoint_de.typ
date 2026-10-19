#import "../config.typ":*

== Sicht- und Bremsweg Aufgaben

#rollen\
  - Spielleiter
  - Triebfahrzeugführer des Nahverkehrszuges
  - Saboteur

Sonderregeln Saboteur:

Der Saboteur schreibt sich je Durchgang das Feld (zwischen Feld 5 und 15) verdeckt auf einen Zettel, auf das er sein Hindernis platzieren möchte. Erst wenn das notierte Feld vom Zug aus sichtbar ist, legt er das Hindernis auf das entsprechende Feld. Ziel des Saboteurs ist es einen Unfall zu provozieren. Wenn der Zug vor dem Hindernis anhält, kann es innerhalb einer Runde entfernt werden.

#materialien\
  - Gleise
  - ein beliebiges Hindernis
  - Nahverkehrszug (braun) mit passendem Fahrdynamikmodell, Zugschluss- und -spitzensignal

#aufbau\
  Es liegt eine unbekannte Strecke mit verschiedenen Sichtverhältnissen vor Euch:

  // TODO add table #include("tables/visibility_conditions.typ")

  Der Nahverkehrszug steht auf Feld 0 und soll möglichst schnell Feld 20 erreichen.

#pagebreak()

#aufgaben\
  #[
    #set enum(numbering: "a)")

    + Fahrt einen Durchgang bei sehr guten, einen Durchgang bei normalen und einen Durchgang bei schlechten Sichtverhältnissen. Ihr könnt Eure Rollen zwischen den Runden tauschen. Wie oft habt Ihr einen Unfall? Falls Ihr ankommt, wie viele Runden habt Ihr gebraucht?
    + Probiert aus, wie schnell der Zug bei den unterschiedlichen Sichtverhältnissen jeweils fahren darf, um sicher vor einem Hindernis anhalten zu können?
    + Wie viele Felder weit müsste man sehen können, um bei 160 $frac("km", "h", style: "skewed")$ (4 Felder) vor jedem Hindernis sicher anhalten zu können?
  ]

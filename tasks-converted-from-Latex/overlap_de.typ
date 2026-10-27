#import "../config.typ":*
== Aufgaben: Durchrutschweg 

#rollen\
  - Spielleiter
  - Triebfahrzeugführer eines beliebigen Zuges
  - Triebfahrzeugführer eines anderen beliebigen Zuges
  - Fahrdienstleiter

#materialien\
  - Gleise
  - Weichen
  - Signale und Zugschlusstellen
  - zwei beliebige Züge mit zugehörigen Fahrdynamikmodell, Zugschluss- und -spitzensignal

#aufbau\
  // TODO add figure #tikzfigure("challenge3_setup2.tikz")

  Beide Züge fahren aktuell mit maximaler Geschwindigkeit. Zug 1 soll im Bahnhof möglichst durchfahren. Zug 2 hat einen Verkehrshalt von 2 Runden Dauer im Bahnhof. Die Weichen dürfen im abzweigenden Strang mit 80 $frac("km", "h", style: "skewed")$ befahren werden. Der Durchrutschweg beträgt 2 Felder.

#aufgaben\
  #[
    #set enum(numbering: "a)")

    + Ergänzt die Infrastruktur mit Vorsignalen, Signalzugschlussstellen und Fahrstraßenzugschlussstellen!
    + Entscheidet begründet welcher Zug auf welches Gleis fahren soll. Welche Probleme können auftreten?
    + Nach wie viel Runden ist Zug 2 im Bahnhof zum Stehen gekommen?
    + Nach wie viel Runden hat Zug 1 den Bahnhof vollständig verlassen?
    + Fertigt vom Bahnhof einen Verschlussplan an!
  ]

//TODO compare with original text in LaTeX, to make sure there are no AI mistakes

#import "../config.typ":*

== Tutorial: Fahrdynamik 

In diesem ersten Tutorial werden die Grundlagen der Fahrdynamiksimulation im Spiel vermittelt.

#rollen\
- Spielleiter
- Triebfahrzeugführer des Nahverkehrszuges

Der Spielleiter führt durch das Tutorial bzw. durch die Aufgabe. Er oder Sie erhält hierfür diese Anleitung und ist dafür verantwortlich, dass alle anderen den Runden- und Phasenablauf einhalten.

Ein Triebfahrzeugführer erhält das zum jeweiligen Zug gehörende Fahrdynamikmodell und ist für das Beschleunigen/Abbremsen, das Bedienen der Zähleinrichtungen und das Bewegen seines Zuges verantwortlich.

#materialien\
- Gleise
- zwei Bahnsteige
- Nahverkehrszug (braun) mit Fahrbrett und rotem Fahrdynamikmodell, Zugschluss- und -spitzensignal

#small_heading([Funktion des Fahrbrettes])

// TODO add figure #tikzfigure("driving_board.tikz")

#aufbau\
  // TODO add figure #tikzfigure("tutorial_trainrun_setup.tikz")


#ablauf\
In der Stufe 1 besteht ein Runde aus folgenden Phasen:

1. Schalthebelposition ändern (Beschleunigen/Bremsen)
2. Züge bewegen

#runde(1)\
#emph[Phase 1:] Der Nahverkehrszug steht zu Beginn der Runde 1 am Bahnsteig. Um ihn bewegen zu können muss der Triebfahrzeugführer in Phase 1 den Schalthebel verstellen. Hierzu setzt er den Schalthebel auf dem Fahrbrett von dem Feld 0 $frac("km", "h", style: "skewed")$ (0 Felder) auf 40 $frac("km", "h", style: "skewed")$ (1 Feld). Außerdem muss die Fahrtrichtung des Zuges durch ein Spitzen- und ein Zugschlusssignal angezeigt werden. Diese muss der Triebfahrzeugführer an den offenen Kupplungen befestigen. Hiermit ist die Phase 1 zu Ende.

#block(
  stroke: 0.8pt,
  inset: 0.8em,
)[
  Der Schalthebel kann in jeder Runde nur einmal entlang eines der eingezeichneten Pfeile versetzt werden. Durch die unterschiedlichen Felder und die sie verbindenden Pfeile werden die Unterschiede in der Fahrdynamik der verschiedenen Züge dargestellt.
]

#emph[Phase 2:] Alle Züge (in diesem Fall nur der eine vorhanden) werden entsprechend der eingestellten Schalthebelposition durch die jeweiligen Triebfahrzeugführer nach vorne gesetzt. Um bei mehreren Zügen den Überblick zu bewahren sind an den Fahrbrettern zwei mechanische Zähler angebracht. Den linken Zähler drückt der jeweilige Triebfahrzeugführer einmal, um die Anzahl der Runden zu zählen. Den rechten Zähler drückt er so oft, wie er den Zug Felder nach vorne bewegt. In diesem Fall also beide Zähler einmal. Damit ist die erste Runde zu Ende.

#block(
  stroke: 0.8pt,
  inset: 0.8em,
)[
  Beim Bewegen der Züge kann es dazu kommen, dass ein Zug einen Halt verpasst, ein Signal überfährt oder sogar einen Unfall hat. In diesem Fall ist es sinnvoll die Runde erst zu beenden und dann zu überlegen, an welcher Stelle ein Fehler passiert ist. Im Anschluss musst du entscheiden wie du fortfahren willst (z.B. Halt ausfallen lassen, hinter dem Signal anhalten, zwei Runden zurückgehen oder das ganze Level neu anfangen).
]

#runde(2)\
#emph[Phase 1:] Der Zug beschleunigt weiter auf 80 $frac("km", "h", style: "skewed")$ (2 Felder).

#emph[Phase 2:] Der Triebfahrzeugführer setzt den Zug entsprechende Felder vor. Denke dabei an die beiden Zähler. Dort sollte nach der Runde links eine 2 und rechts eine 3 stehen.

#runde(3)\
Beschleunige den Zug auf 120 $frac("km", "h", style: "skewed")$ (3 Felder) und setze ihn entsprechend vor.

#runde(4)\
In dieser Runde beschleunigt der Zug nicht weiter, da er seine Höchstgeschwindigkeit von 120 $frac("km", "h", style: "skewed")$ (3 Felder) bereits erreicht hat. Setze den Zug entsprechend vor.

#block(
  stroke: 0.8pt,
  inset: 0.8em,
)[
  Achtung: Um an vorgegebenen Stellen den Zug passend anhalten zu können, bzw. in den folgenden Stufen Signale beachten zu können, musst du die nächsten Züge vorausplanen und darfst den Zug nicht zu weit beschleunigen.
]

#runde(5)\
Beginnt in dieser Runde mit der Bremsung. Der Triebfahrzeugführer setzt den Schalthebel hierfür auf 80 $frac("km", "h", style: "skewed")$ (2 Felder) und den Zug entsprechende Felder vor.

#runde(6)\
Bremst den Zug weiter auf 40 $frac("km", "h", style: "skewed")$ (1 Feld) ab und setzt ihn entsprechend vor.

#runde(7)\
Beendet die Bremsung des Zuges indem der Triebfahrzeugführer den Schalthebel auf 0 $frac("km", "h", style: "skewed")$ (0 Felder) verstellt. Im Schritt „Züge bewegen“ kann der Zug dementsprechend nicht bewegt werden. Dementsprechend muss auch nur den Zähler der Runden einmal gedrückt werden.

#small_heading([Ende des Tutorials])\
Der Zug sollte jetzt am zweiten Bahnsteig auf den Feldern 11 und 12 stehen. Auf dem linken Zähler sollte eine 7 für die Anzahl der Runden und auf dem rechten Zähler eine 12 für die Anzahl der gefahrenen Felder zu sehen sein.

#block(
  stroke: 0.8pt,
  inset: 0.8em,
)[
  Wenn dies nicht so ist, dann müsst Ihr noch einmal zurückgehen und überlegen, an welcher Stelle Ihr ggf. etwas vergessen haben könntet.
]

#block(
  stroke: 0.8pt,
  inset: 0.8em,
)[
  Wenn dies so ist, dann herzlichen Glückwunsch! Ihr habt das erste Tutorial erfolgreich abgeschlossen und könnt nun die Aufgaben im Level 1 selbstständig erledigen. \
  Nach jeder abgeschlossenen Aufgabe, wendet euch an die Übungsleitung, um die Ergebnisse zu besprechen, bevor Ihr mit der nächsten Aufgabe beginnt.
]

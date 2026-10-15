//TODO compare with original text in LaTeX, to make sure there are no AI mistakes

= Zugfolgesicherung Tutorial

Nachdem Ihr in der Stufe 1 immer nur einen Zug zu betrachten hattet, soll nun der Betrieb von mehreren Zügen auf einem Gleis möglich sein. Um dies sicher zu ermöglichen wird das Gleis in mehrere Blöcke geteilt. An der Grenze zwischen zwei Blöcken werden hierzu Hauptsignale (sogenannte Blocksignale) aufgestellt. Wie Ihr in Stufe 1 bereits festgestellt habt, ist der Bremsweg der Züge deutlich länger als eine realistische Sichtweite von 1 bis 3 Feldern. Aus diesem Grunde sind zusätzliche Vorsignale notwendig.

== Rollen

- Spielleiter
- Triebfahrzeugführer des Nahverkehrszuges
- Triebfahrzeugführer des Fernverkehrszuges
- Fahrdienstleiter

Der Fahrdienstleiter als neue Rolle ist für alle Signale und im späteren Verlauf auch für Weichen und Fahrstraßen zuständig. Wenn Ihr ein sehr großes Szenario spielt, kann es sinnvoll sein, dass Ihr mehrere Fahrdienstleiter mit unterschiedlichen Zuständigkeitsbereichen bestimmt.

== Material

- Gleise
- ein Bahnsteig
- zwei Hauptsignale mit Signalzugschlusstelle
- zwei Vorsignale
- Nahverkehrszug (braun) mit zugehörigen Fahrdynamikmodell, Zugschluss- und -spitzensignal
- Fernverkehrszug (grün) mit zugehörigen Fahrdynamikmodell, Zugschluss- und -spitzensignal

*Ausgangssituation*\
  Der Fernverkehrszug befindet sich auf Feld 0 und sein Schalthebel steht auf 160 $frac("km", "h", style: "skewed")$ (4 Felder).
  Der Nahverkehrszug befindet sich auf Feld 25 und sein Schalthebel steht auf 0 $frac("km", "h", style: "skewed")$ (0 Felder).

  // TODO add figure: #tikzfigure("tutorial_followprotection_setup.tikz")


== Ablauf

Zur Abbildung der Logik der Hauptsignale sind zusätzliche Phasen in jeder Runde erforderlich. Eine Runde beinhaltet nun folgende Phasen:

1. Signale auf Fahrt stellen
2. Schalthebelposition ändern (Beschleunigen/Bremsen)
3. Züge bewegen
4. Haltfall von Signalen ausführen

=== Runde 1

#emph[Phase 1:] Der Fahrdienstleiter prüft, ob er Signale auf Fahrt stellen darf. Die Voraussetzung hierfür ist, dass das Signal derzeit auf „Halt“ steht und der folgende Blockabschnitt bis zur Signalzugschlusstelle hinter dem nächsten Hauptsignal frei von Zügen ist. Als weitere Blockbedingung muss ein vorausfahrender Zug durch mindestens ein „Halt“ zeigendes Hauptsignal gedeckt sein. Dies ist derzeit nicht der Fall. Das erste Hauptsignal zeigt zwar „Halt“, jedoch ist der folgende Blockabschnitt belegt. Das zweite Hauptsignal zeigt bereits „Fahrt“. Die Vorsignale können immer nur gemeinsam mit dem jeweils zugehörigen Hauptsignal verstellt werden. Im ersten Schritt kann somit kein Signal auf „Fahrt“ gestellt werden. Dies wird im Folgenden auch häufiger passieren. Wichtig ist, dass der Fahrdienstleiter diesen Schritt trotzdem immer durchführt.

#emph[Phase 2:] Diese Phase kennt Ihr bereits aus dem ersten Tutorial. Der Nahverkehrszug kann entlang des zweiten Pfeils auch direkt auf 80 $frac("km", "h", style: "skewed")$ (2 Felder) beschleunigt werden. Der Fernverkehrszug soll seine aktuelle Geschwindigkeit beibehalten.

#emph[Phase 3:] Diese Phase kennt ihr ebenfalls bereits. Setzt den Nahverkehrszug entsprechend zwei Felder und den Fernverkehrszug vier Felder nach vorne. Denkt hierbei an das Bedienen der Zähler. Um den Überblick bei mehreren Zügen zu bewahren solltet Ihr immer erst einen Zug bewegen, dann die zugehörigen Zähler bedienen und erst danach mit dem nächsten Zug weitermachen. Hierdurch könnt Ihr jederzeit am Rundenzähler erkennen, welchen Zug bereits bewegt wurde und welcher noch bedient werden muss.

#emph[Phase 4:] Der Fahrdienstleiter muss prüfen, ob ein Zug mit seiner Spitze an der Signalzugschlussstelle vorbeigefahren ist. Dies ist beim Nahverkehrszug der Fall. Der Fahrdienstleiter muss daher das zugehörige Hauptsignal auf „Halt“ und das zugehörige Vorsignal auf „Halt erwarten“ stellen. Damit ist die erste Runde beendet.

=== Runde 2

#emph[Phase 1:] Beim Prüfen, ob ein Hauptsignal auf „Fahrt“ gestellt werden kann, fällt dem Fahrdienstleiter vielleicht auf, dass der Bereich zwischen dem ersten und dem zweiten Hauptsignal frei ist. Das erste Hauptsignal kann jedoch noch nicht auf Fahrt gestellt werden, da sich der hintere Teil des Nahverkehrszuges noch vor der Signalzugschlusstelle befindet. Dieser Bereich hinter dem Hauptsignal muss als Sicherheitsraum frei sein, bevor eine Zugfahrt auf das Signal zugelassen werden kann.

#emph[Phase 2:] Der Fernverkehrszug muss dringend anfangen zu bremsen, da er sich einem „Halt“ zeigenden Hauptsignal nähert und in der letzten Runde das „Halt erwarten“ zeigende Vorsignal passiert hat. Der zuständige Triebfahrzeugführer des Fernverkehrszuges stellt den Schalthebel hierfür auf 120 $frac("km", "h", style: "skewed")$ (3 Felder). Der Nahverkehrszug kann auf 120 $frac("km", "h", style: "skewed")$ (3 Felder) beschleunigen.

#emph[Phase 3:] Setzt nun beide Züge entsprechend der Schalthebelposition weiter.

#emph[Phase 4:] Einen Haltfall gibt es in dieser Runde nicht, da bereits alle Signale „Halt“ zeigen.

=== Runde 3

#emph[Phase 1:] In dieser Runde kann der Fahrdienstleiter erstmals ein Signal auf Fahrt stellen. Da der Bereich zwischen dem ersten Hauptsignal und der Signalzugschlusstelle hinter dem zweiten Hauptsignal frei ist, kann er das erste Hauptsignal und das zugehörige Vorsignal auf „Fahrt“ bzw. „Fahrt erwarten“ stellen.

#emph[Phase 2:] Theoretisch könnte der Fernverkehrszug nun wieder beschleunigen, da der nächste Blockabschnitt vor ihm frei ist. Da er sich jedoch nicht innerhalb der Sichtweite vor dem Signal (die sich zwei Felder vor dem Hauptsignal) befindet, muss er zunächst weiter Abbremsen, da er ja aufgrund des Vorsignals von einem „Halt“ zeigenden Hauptsignal ausgehen muss. Bremst ihn daher auf 80 $frac("km", "h", style: "skewed")$ (2 Felder) ab.

#emph[Phase 3:] Der Nahverkehrszug kann seine Höchstgeschwindigkeit von 120 $frac("km", "h", style: "skewed")$ (3 Felder) beibehalten. Setzt beide Züge entsprechend weiter und bedient die Zähler.

#emph[Phase 4:] Einen Haltfall gibt es nicht.

=== Runde 4

#emph[Phase 1:] Diese Runde kann kein Signal auf Fahrt gestellt werden.

#emph[Phase 2:] Der Fernverkehrszug ist nun in Sichtweite des Hauptsignals und darf daher wieder beschleunigen. Setzt den Schalthebel dafür auf 120 $frac("km", "h", style: "skewed")$ (3 Felder). Der Nahverkehrszug behält seine Höchstgeschwindigkeit bei.

#emph[Phase 3:] Setzt beide Züge entsprechend weiter.

#emph[Phase 4:] Da die Spitze des Fernverkehrszuges die Signalzugschlusstelle des ersten Hauptsignals passiert hat, tritt hier der Haltfall ein. Der Fahrdienstleiter muss das Hauptsignal und zugehörige Vorsignal entsprechend bedienen.

== Ende des Tutorials

Der Nahverkehrszug sollte sich nun auf den Feldern 35 und 36 befinden und auf seinen Zählern eine 4 und eine 11 stehen. Der Fernverkehrszug sollte auf den Feldern 9 bis 12 stehen und auf seinen Zählern eine 4 und eine 12. Ferner sollten alle Haupt- und Vorsignale „Halt“ bzw. „Halt erwarten“ zeigen.

#block(
  stroke: 0.8pt,
  inset: 0.8em,
)[
  Wenn dies so ist, dann herzlichen Glückwunsch! Ihr habt das zweite Tutorial erfolgreich abgeschlossen und könnt nun die Aufgaben im Level 2 selbstständig erledigen.
]

#block(
  stroke: 0.8pt,
  inset: 0.8em,
)[
  Wenn dies nicht so ist, dann müsst Ihr noch einmal zurückgehen und überlegen, an welcher Stelle Ihr ggf. etwas vergessen haben könntet.
]

//TODO compare with original text in LaTeX, to make sure there are no AI mistakes

#import "../config.typ":*

== Tutorial: Fahrwegsicherung 

Nachdem Ihr Euch in der Stufe 2 mit der Zugfolgesicherung vertraut gemacht habt und die Funktion von Haupt und Vorsignalen kennt, werden in dieser Stufe Weichen und Fahrstraßen eingeführt. Erst in dieser Stufe sind damit reale Szenarien mit sich verzweigenden Fahrwegen abbildbar.

#rollen\
- Spielleiter
- Triebfahrzeugführer des Nahverkehrszuges
- Fahrdienstleiter

#materialien\
- Gleise
- Weichen
- Vorsignale
- Hauptsignale
- Fahrstraßenfelder
- Signalzugschlusstellen
- Fahrstraßenzugschlussstellen
- Richtungsverwaltung
- Nahverkehrszug (braun) mit entsprechenden Fahrdynamikmodell, Zugschluss- und -spitzensignal

#small_heading([Funktion des Fahrstraßenfeldes])\
// TODO add figure #tikzfigure("route_box.tikz", width: 40%)

#aufbau\ //in Aufbau umbenennen?
  // TODO add figure #tikzfigure("tutorial_routeprotection_setup.tikz")
Neben dem Startaufbau sind auch die Ausgangszustände der Züge und Signale herzustellen. Der Nahverkehrszug steht gerade vor dem Hauptsignal A und wartet auf die Erlaubnis zur Einfahrt in den Bahnhof. Sein Schalthebel steht daher auf 0 $frac("km", "h", style: "skewed")$ (0 Felder). Alle Hauptsignale zeigen „Halt“ und alle Vorsignale zeigen „Halt erwarten“. Die Richtungsverwaltung auf der Streckenseite mit Zug zeigt in Richtung Bahnhof (gelber Stift beim Pfeil nach rechts).


#ablauf\
Zur Abbildung der Logik der Fahrstraßen sind zusätzliche Schritte in jeder Runde erforderlich. Eine Runde beinhaltet nun folgende Phasen:

+ Fahrstraße sichern
   + Weichen im befahrenen Teil der Fahrstraße einstellen und sichern
   + Flankenschutz herstellen
   + Durchrutschweg sichern
+ Signale auf Fahrt stellen
+ Schalthebelposition ändern (Beschleunigen/Bremsen)
+ Züge bewegen
+ Haltfall von Signalen ausführen
+ Fahrstraßen auflösen

#runde(1)\

Damit in diesem Tutorial überhaupt etwas passieren kann muss der Fahrdienstleiter eine Fahrstraße einstellen. Wir möchten den Nahverkehrszug nach Gleis 2 einfahren und vor dem Ausfahrsignal halten lassen. Hierzu müssen alle Unterphasen von „Fahrstraße sichern“ erfolgreich durchlaufen werden:

#emph[Phase 1a:] Als erstes muss der Fahrdienstleiter die Weichen im Fahrweg in die korrekte Lage für die Zugfahrt bringen. Hierzu stellt er die Weiche W1 in Rechtslage (immer von der Weichenspitze aus gesehen) und die Weiche W2 in Linkslage. Um die Weichen zu verschließen, setzt er jeweils einen Verschlussmarker (blauer Holzstift) so mit der Kerbe auf die Stellstäbe der beiden Weichen, dass diese nicht mehr umgestellt werden können. Wenn dies bei beiden Weichen erfolgt ist, kann er einen weiteren Verschlussmarker nehmen und ihn zur Bestätigung auf das Fahrstraßenfeld neben dem Einfahrsignal stellen. Hiermit sind die Weichen verschlossen. Dieser Marker dürfen vorerst nicht mehr entfernt werden.

#emph[Phase 1b:] Der Flankenschutz für diese Fahrstraße wird zum einen durch die Weiche W3 und zum anderen durch das Signal D sichergestellt. Der Fahrdienstleiter muss hierzu die Weiche 3 in Rechtslage bringen und mit einem Flankenschutzmarker (oranger Holzstift) verschließen. Das Signal D ist bereits in Haltstellung. Es wird in dieser Lage ebenfalls mit einem Flankenschutzmarker verschlossen, indem der Fahrdienstleiter diesen auf das sichtbare Signalbild stellt. Wenn beide Flankenschutzräume so gesichert sind, kann der Fahrdienstleiter einen weiteren Flankenschutzmarker nehmen und ihn zur Bestätigung auf das Fahrstraßenfeld neben dem Fahrstraßensignal stellen. Hiermit sind die Flankenschutzweiche und das Signal verschlossen. Die Marker dürfen vorerst nicht mehr entfernet werden.

#emph[Phase 1c:] Um den Durchrutschweg zu sichern, nimmt der Fahrdienstleiter nun einen Durchrutschwegmarker (gelber Holzstift) und stellt ihn hinter dem Zielsignal (in diesem Fall Signal E) auf Höhe der Signalzugschlusstelle ins Gleis. Er symbolisiert, dass das Gleis an dieser Stelle für andere Zwecke gesperrt ist. Zur Bestätigung kann nun ein weiterer Durchrutschwegmarker auf das Fahrstraßenfeld neben dem Fahrstraßensignal gestellt werden. Hiermit ist der Durchrutschweg gesichert und die Fahrstraße nun vollständig eingestellt. Sämtliche Marker dürfen vorerst nicht mehr entfernt werden.

#emph[Phase 2:] Der Fahrdienstleiter prüft nun, ob der Fahrweg vom Startsignal (Signal A) bis zum Ende des Durchrutschweges hinter dem Zielsignal (Signal E) frei von anderen Zügen ist. Außerdem müssen die Flankenschutzräume (Weiche W1-W3 und W2-Signal D) frei sein. Wenn diese Bedingungen vorliegen, darf der Fahrdienstleiter nun das Startsignal (und ein ggf. zugehöriges Vorsignal) auf Fahrt stellen.

#emph[Phase 3:] Da das Einfahrsignal nun „Fahrt“ zeigt, kann der Triebfahrzeugführer den Nahverkehrszug auf 80 $frac("km", "h", style: "skewed")$ (2 Felder) beschleunigen.

#emph[Phase 4:] Setzt den Zug entsprechend vor.

#emph[Phase 5:] Einen Haltfall gibt es nicht.

#emph[Phase 6:] Da der Zug die Fahrstraßenzugschlusstelle noch nicht passiert hat, kann keine Fahrstraße aufgelöst werden.

#runde(2)\

#emph[Phase 1 und 2:] Eine Fahrstraße wollen wir in dieser Runde nicht einstellen.

#emph[Phase 3:] Der Zug kann weiter auf 120 $frac("km", "h", style: "skewed")$ (3 Felder) beschleunigen. Bedenkt jedoch, dass der Zug ein „Halt erwarten“ zeigendes Vorsignal passiert hat. Er muss daher am nächsten Signal zum Stehen kommen können.

#emph[Phase 4:] Setzt den Zug entsprechend vor.

#emph[Phase 5:] Die Zugspitze hat nun die Signalzugschlussstelle beim Hauptsignal A passiert und der Fahrdienstleiter muss den Haltfall auslösen. Beim Haltfall wird das Signal wieder auf „Halt“ gestellt. Die verschiedenen Marker bleiben auf dem Fahrstraßenfeld zunächst jedoch stehen und symbolisieren, dass die Fahrstraße weiterhin gesichert ist.

#emph[Phase 6:] Eine Fahrstraße kann in dieser Runde ebenfalls noch nicht aufgelöst werden. Zwar hat die Zugspitze bereits die Fahrstraßenzugschlusstelle passiert, jedoch ist hierfür der Zugschluss maßgebend.

#runde(3)\

#emph[Phase 1 und 2:] Eine Fahrstraße wollen wir in dieser Runde nicht einstellen.

#emph[Phase 3:] Um rechtzeitig anhalten zu können, muss der Zug nun auf 80 $frac("km", "h", style: "skewed")$ (2 Felder) abbremsen.

#emph[Phase 4:] Setzt den Zug entsprechend vor.

#emph[Phase 5:] Einen Haltfall gibt es nicht.

#emph[Phase 6:] Nun hat aber der Zugschluss die Fahrstraßenzugschlusstelle passiert und der Fahrdienstleiter kann die Fahrstraße auflösen. Hierzu nimmt er alle zu dieser Fahrstraße gehörenden Verschlussmarker und Flankenschutzmarker vom Feld. Dies gilt sowohl für die Marker an den Weichen und Signalen als auch für die Marker auf dem Fahrstraßenfeld. Die Weichen und Signale sind somit nicht mehr verschlossen und können ab der nächsten Runde für andere Fahrstraßen verwendet werden. Bei dem Durchrutschwegmarker läuft es etwas anders. Es darf zunächst nur der Marker auf dem Fahrstraßenfeld entfernt werden. Der Marker am Ende des Durchrutschweges kann erst später entfernt werden, da der Zug sich noch dem Zielsignal nähert und sich verbremsen könnte. Um den Durchrutschwegmarker entfernen und den Durchrutschweg damit auflösen zu können, muss der Zug entweder zum Stehen gekommen sein oder es muss eine weitere Fahrstraße vom vorherigen Zielsignal über den Durchrutschweg eingestellt werden.
Da der Zug aber zumindest die Signalzugschlusstelle passiert hat, kann der Fahrdienstleiter die Richtungsfestlegung aufheben, indem er den gelben Stift entnimmt. Nun könnte ein Zug den Streckenabschnitt wieder in der anderen Fahrtrichtung nutzen. Die Runde ist hiermit zu Ende.

#runde(4)\

In dieser Runde passiert nichts Besonderes. Der Zug kann sich weiterhin mit 80 $frac("km", "h", style: "skewed")$ (2 Felder) dem Zielsignal nähern.

#runde(5)\

In dieser Runde muss der Zug auf 40 $frac("km", "h", style: "skewed")$ (1 Feld) abbremsen, um vor dem Signal zum Stehen kommen zu können.

#runde(6)\

Der Zug befindet sich bereits unmittelbar vor dem „Halt“ zeigenden Signal. Da der Schalthebel aber noch auf 40 $frac("km", "h", style: "skewed")$ (1 Feld) steht, befindet er sich aber noch in Bewegung. Der Triebfahrzeugführer muss ihn daher in dieser Runde auf 0 $frac("km", "h", style: "skewed")$ (0 Felder) abbremsen. Erst jetzt gilt der Zug als „zum Stehen gekommen“. Er kann dementsprechend nicht weiter vorgesetzt werden. Im Rahmen der Fahrstraßenauflösung kann der Fahrdienstleiter nun den Durchrutschwegmarker entfernen.

#small_heading([Zwischenkontrolle])\
Der Nahverkehrszug sollte sich nun auf den Feldern 9 und 10 vor dem „Halt“ zeigenden Hauptsignal E befinden. Auch alle anderen Haupt- und Vorsignale zeigen „Halt“ bzw. „Halt erwarten“. Es befinden sich außerdem keine Marker auf dem Spielfeld.

#block(
  stroke: 0.8pt,
  inset: 0.8em,
)[
  Wenn dies so ist, dann könnt Ihr mit der Ausfahrt des Zuges weitermachen.
]

#block(
  stroke: 0.8pt,
  inset: 0.8em,
)[
  Wenn dies nicht so ist, dann müsst Ihr noch einmal zurückgehen und überlegen, an welcher Stelle Ihr ggf. etwas vergessen haben könntet.
]

#runde(7)\

Damit der Zug weiterfahren kann muss der Fahrdienstleiter nun die Ausfahrstraße einstellen. Dies läuft genauso ab, wie die Einfahrstraße mit einer Ausnahme. Anstelle des Durchrutschweges wird mit dem gelben Durchrutschwegmarker die Richtungsverwaltung des folgenden Streckenabschnittes eingestellt.

#block(
  stroke: 0.8pt,
  inset: 0.8em,
)[
  Der Durchrutschwegmarker darf bei Ausfahrten nur dann auf das Fahrstraßenfeld gesetzt werden, wenn die Richtungsverwaltung im folgenden Streckenabschnitt in die korrekte Richtung zeigt. Andernfalls müsst Ihr warten, bis der Gegenzug angekommen ist. Dies wird vor allem bei großen Szenarien wichtig.
]

Bei der Ausfahrt des Zuges müsst Ihr beachten, dass die Weiche im genutzten abzweigenden Strang nur mit 80 $frac("km", "h", style: "skewed")$ befahren werden darf. Dies gilt solange, bis der Zugschluss die letzte Weiche im Fahrweg vollständig verlassen hat. Im durchgehenden Strang gibt es in der Regel keine Beschränkung.

#block(
  stroke: 0.8pt,
  inset: 0.8em,
)[
  Für die Weichengeschwindigkeit können in Szenarien auch andere Werte (z.B. 40 $frac("km", "h", style: "skewed")$ oder 120 $frac("km", "h", style: "skewed")$) genannt sein.
]

Denkt an das korrekte Vorsetzen des Zuges und die Abläufe mit Haltfall und Fahrstraßenauflösung.

#runde(8)\

Verlasst mit dem Zug so zügig wie möglich den Bahnhof!

#runde(9)\

Fahrt so schnell wie möglich mit Eurem Zug!

#small_heading([Ende des Tutorials])\
Der Nahverkehrszug sollte sich nun auf den Feldern 16 und 17 befinden. Alle Haupt- und Vorsignale zeigen „Halt“ bzw. „Halt erwarten“. Außer dem Durchrutschwegmarker in der rechten Richtungsverwaltung befinden sich keine Marker auf dem Spielfeld.

#block(
  stroke: 0.8pt,
  inset: 0.8em,
)[
  Wenn dies so ist, dann herzlichen Glückwunsch! Ihr habt das dritte Tutorial erfolgreich abgeschlossen und könnt nun die Aufgaben im Level 3 selbstständig erledigen.
]

#block(
  stroke: 0.8pt,
  inset: 0.8em,
)[
  Wenn dies nicht so ist, dann müsst Ihr noch einmal zurückgehen und überlegen, an welcher Stelle Ihr ggf. etwas vergessen haben könntet.
]

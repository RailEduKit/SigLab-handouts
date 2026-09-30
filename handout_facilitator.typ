
#set par(leading: 0.8em)
#set text(lang: "de")
#show heading: set block(below: 1em)


= SigLab Beginner Handout für Schulungsleitende //fertig
*Aufgabe der Schulungsleitung*\
Grundsätzlich ist das SigLab darauf angelegt in Eigenarbeit bearbeitet werden zu können. Die Einführung also gerne kurz fassen. Die Teilnehmenden sollten möglichst schnell selber anfagen mit dem SigLab zu arbeiten.

Die Aufgabe der Schulungsleitung besteht darin bei Fragen zur Verfügung zu stehen und den Gruppen immer wieder über die Schulter zu gucken, um mögliche Fehler aufzuzeigen und zu besprechen. 

= Begrüßung und kurze Einführung //fertig
_Heute geht es um die Grundlagen des Bahnverkehrs. Die Schulung beschäftigt sich mit der Fahrdynamik von Zügen und den daraus entstandenen Sicherungskonzepten. Diese Themen werden mithilfe von einer modifizierten Holzeisenbahn erklärt. Dadurch werdet ihr den *Großteil der Zeit in Kleingruppen* arbeiten. Ich werde rumgehen und *stehe für Fragen zur Verfügung*._

_Ihr werdet euch gleich in *Gruppen von 2-3 Personen* einteilen. Jede Gruppe wird eines der 4 Sets bekommen. Diese beinhalten alles was ihr für die heutige Schulung braucht. *Bitte achtet darauf die Sets nicht zu vermischen.*_

*Kurzer Überblick über die Sets:*
-	Blaue Mappe – Handbuch
-	Materialliste
-	Schienen für die Infrastruktur (eine Schiene = ein Feld)
-	Fahrdynamikbrett – Beschleunigungsverhalten, Bremsverhalten, aktuelle Geschwindigkeit
-	Der Koffer hat unten eine Schublade
  -	Bauteile für die Sicherungslogik (mit Magneten an die Schienen klicken)
    -	Polung gibt an auf welcher Seite man die Bauteile befestigen kann (in Fahrtrichtung rechts)
  -	Züge, die auf den Schienen fahren


_In dem Handbuch gibt es immer ein *Tutorial pro Kapitel* und anschließend *dazugehörige Aufgaben*. Bitte startet mit dem ersten Tutorial, dort werdet ihr an das System des SigLabs herangeführt. Danach könnt ihr mit den Aufgaben weitermachen._

_*Das Tutorial ist sehr kleinschrittig*. Bitte bearbeite dieses Schritt für Schritt, auch wenn ihr manchmal schon wisst, was die nächsten Schritte sind._

_In manchen Aufgaben gibt es *Entscheidungsspielraum*, der nicht klar definiert ist (Blocklänge oder wo der Zug am Bahnsteig halten soll). In diesen Fällen *trefft bitte begründet eine eigene Entscheidung*. Ihr dürft dazu natürlich auch Fragen stellen._

= Fahrdynamik
Ab hier sollte keine Einführung mehr nötig sein. Das Handbuch führt durch das Tutorial in das SigLab ein. In den nächsten Abschnitten sind Hinweise, Lösungen und Zusatzinformationen zu den einzelnen Aufgaben aufgeführt. Diese sollen helfen aufkommende Fragen zu beantworten.

== Hinweise // fertig
- *Vorschlag Rollenverteilung*
  - Spielleiter: liest die Aufgaben vor.
  - Triebfahrzeugführer: kümmert sich um das Fahrdynamikbrett.
  - Person 3: schiebt den Zug. Enge Abstimmung mit dem Triebfahrzeugführer.
- *Ausgangssituation*
  - Die Ausgangssituation muss aufgebaut werden
- *Bahnsteige*
  - Ein Bahnsteig besteht aus zwei Bahnsteigelementen
  - Der Bahnsteig kann drei Felder lang sein. Die genaue Position ist nicht relevant. Entweder um ein Feld vorne erweitern (10 bis 12) oder ein halbes Feld vorne und hinten überlappen (10.5 bis 13.5)
- *Runde 7 - Stillstand*
  - Runde 7 in dem Tutorial ist wichtig - die Nullrunde: Man setzt den Geschwindigkeitsregler auf Null. Auf der Infrastruktur passiert nichts, aber der Rundenzähler wird um 1 erhöht. Bei zukünftigen Berechnungen führt diese Runde manchmal zu verwirrungen.
- *Aufgaben rechnerisch lösen*
  - Es ist möglich die Aufgaben rechnerisch zu lösen. Es macht auch Sinn sich vorher dazu Gedanken zu machen. Ob die Berechnung stimmt kann dann durch ausprobieren geprüft werden.


== Aufgabe 1.1
=== Vermittlungsziele
- Spieldynamik kennenlernen
  - Der Nahverkehrszug kann direkt auf 2 F/R beschleunigen
- Berechnung von Bremsweglänge   
- Die Infrastruktur vor und nach einem Betrachtungsraum ist beliebig. // TODO Quelle finden 
- Ein Zug kann auch mit voller Geschwindigkeit in den Betrachtungsraum einbrechen. // TODO Quelle finden
- Je länger ein Zug ist, desto mehr Runden werden benötigt, bis der gesamte Zug die Strecke verlassen hat.


=== Lösung // TODO Fertigstellen
#table(columns: (auto,auto), stroke: none,
[a)],
[Runde 9, Feld 26, wenn von 0 F/R direkt auf 2 F/R beschleunigt wird\
Runde 9, Feld 24, wenn von 0 F/R auf 1 F/R und erst dann auf 2 F/R beschleunigt wird. ],

[b)],
[Zwei Möglichkeiten am Bahnsteig B zu halten: Auf Feld 14 oder auf Feld 15.\

2 F/R - Runde 1, Feld 2 - Beschleunigung\
3 F/R - Runde 2, Feld 5 - Beschleunigung\
3 F/R - Runde 3, Feld 8 - Beharrungsfahrt\
3 F/R - Runde 4, Feld 11 - Beharrungsfahrt

#underline([Variante 1: halten auf Feld 14 am Bahnsteig B])\
2 F/R - Runde 5, Feld 13 - Bremsung eingeleitet\
1 F/R - Runde 6, Feld 14 - bremsen\ 
0 F/R - Runde 7, Feld 14 - Halt an Bahnsteig B\
0 F/R - Runde 8, Feld 14 - Fahrgastwechsel\
2 F/R - Runde 9, Feld 16 - Beschleunigung\
3 F/R - Runde 10, Feld 19 - Beschleunigung\
3 F/R - Runde 11, Feld 22 - Beharrungsfahrt\
3 F/R - Runde 12, Feld 25 - Beharrungsfahrt\
3 F/R - Runde 13, Feld 28 - Beharrungsfahrt\
3 F/R - Runde 14, Feld 31 - Beharrungsfahrt\
3 F/R - Runde 15, Feld 34 - Beharrungsfahrt\
2 F/R - Runde 16, Feld 36 - Bremsung eingeleitet \
2 F/R - Runde 17, Feld 38 - Rollen \
1 F/R - Runde 18, Feld 39 - bremsen \
*0 F/R - Runde 19, Feld 39 - Halt an Bahnsteig C\
0 F/R - Runde 20, Feld 39 - Fahrgastwechsel*

#underline([Variante 1.1 halten auf Feld 38 am Bahnsteig C ])\
2 F/R - Runde 16, Feld 36 - Bremsung eingeleitet \
1 F/R - Runde 17, Feld 37 - bremsen \
1 F/R - Runde 18, Feld 38 - rollen \
*0 F/R - Runde 19, Feld 38 - Halt an Bahnsteig C\
0 F/R - Runde 20, Feld 38 - Fahrgastwechsel*

#underline[Variante 2 halten auf Feld 15 am Bahnsteig B]\
2 F/R - Runde 5, Feld 13 - Bremsung eingeleitet\
1 F/R - Runde 6, Feld 14 - bremsen\
1 F/R - Runde 7, Feld 15 - rollen 
0 F/R - Runde 8, Feld 15 - Halt an Bahnsteig B\
0 F/R - Runde 8, Feld 15 - Fahrgastwechsel\
2 F/R - Runde 9, Feld 17 - Beschleunigung\
#text(fill: red, [Fertigstellen])

 ],

[c)], //fertig
[$"Runden gesamt" ["Runden"] = ("Streckenlänge" + "Zuglänge" ["Felder"]) / ("Maximale Geschwindigkeit" ["Felder"/"Runde"])$\
  Nahverkehrszug: $(39 + 2) / 3 = 13,67 -> 14 "Runden"$\
  Fernverkehrszug: $(39 + 4) / 5 = 8,6 -> 9 "Runden"$\
  Güterzug: $(39 + 6) / 3 = 15 "Runden"$])

== Aufgabe 1.2
=== Vermittlungsziele //fertig
- Geringe Haftreibung von Stahl auf Stahl (anders als Gummi auf Asphalt) @pachl_systemtechnik_2022[S. 1-3]
  - Wenig Energieverbrauch
  - Lange Bremswege
- Fahren im Sichtabstand $->$ Um Kollisionen zu vermeiden muss ein Vollbahn-Eisenbahnfahrzeug sehr langsam fahren @pachl_systemtechnik_2022[S. 42-43]
  - Richtwert: 0,981 $m/s^2$ Bremsverzögerung bei Vollbahnen @pachl_systemtechnik_2022[S. 2]
    - Daraus ergeben sich z.B. Bremswege von ca. 100m (50km/h), 190 (70km/h) oder 1000m(160km/h)
    - Die exakte Bremsverzögerung hängt von den eingesetzen Bremsen ab 
- Straßebahnen fahren im Straßenverkehr auf Sicht @pachl_systemtechnik_2022[S. 42-43]
  - Deswegen werden höhere Bremsverzögerungen gefordert
    - Richtwert für Betriebsbremsungen: 1,2 $m/s^2$ Bremsverzögerung @reinhardt_offentlicher_2018[S. 261]
    - Richtwert für Gefahrbremsungen: 2,5 - 2,7 $m/s^2$ Bremsverzögerung @noauthor_strasenbahn-bau-_1987[§36 Abs. 6 Nr.3]
      - Daraus ergeben sich z.B. Bremswege von ca. 40m (50km/h) oder 70m (70km/h) @noauthor_strasenbahn-bau-_1987[§36 Abs. 6 Nr.3]. Das sind deutlich längere (Gefahren)bremswege als bei Autos.
  - Für besseres Bremsvermögen werden Schienen gesandet @kache_fahrdynamik_2024[S. 164] und Magnetschienenbremsen benutzt @kache_fahrdynamik_2024[S. 295]

$=>$ Für Vollbahnen ist fahren auf Sicht nicht möglich, weil die Bremswege bei hohen Geschwindigkeiten zu lang sind.

=== Lösung

#table(columns: (auto,auto), stroke: none,
[a)],
[Ist der Bremsweg länger als die Sichtweite, wird der Zug immer mit dem Hinderniss kollidieren\
Wird auf Sicht gefahren ist die Fahrtzeit deutlich länger, als wenn mit Maximalgeschwindigkeit gefahren wird.],

[b)],
[Sehr gute Sicht:\
Nah- und Fernverkehrszug: 2F/R\
Güterzug: 1F/R

Normale Sicht:\
Nah- und Fernverkehrszug: 1F/R\
Güterzug: nicht möglich

Schlechte Sicht:\
Nah- und Fernverkehrszug: 1F/R\
Güterzug: nicht möglich

// Es muss der Punkt beachtet werden, wenn der Zug das Hindernis nicht sieht, noch einmal fährt und dadurch den optimalen Bremspunkt überfahren hat.
],

[c)],
[#text(fill: gray)[#underline([Warum 7 Felder Sichtweite nicht reichen:])]\
  Optimalfall: 6 Felder Bremsweg in 4 Runden $->$ Das Hindernis darf auf dem 7. Feld liegen $->$ 7 Felder Sichtweite.\
Der Optimalfall liegt nur dann vor, wenn der Zug 7 Felder vor dem Hindernis entscheiden kann zu Bremsen. Der Zug kann aber nur alle 4 Feler anfangen zu bremsen. Es würde weiterhin zu einem Unfall kommen, wenn der Zug 8 Felder vor dem Hindernis erneut 4 Felder fährt, da das Hindernis noch nicht gesehen wird.\
*Die Sichtweite muss länger als der Bremsweg sein.*\

#text(fill: gray)[#underline([Herleitung für die nötige Sichtweite])]\
Nehmen wir an das Hindernis liegt auf Feld 11.\
Der Optimalfall tritt ein, wenn die Zugspitze auf Feld 4 steht und anfangen kann zu bremsen.\
4 Felder weiter vorne (eine ganze Runde früher) steht die Zugspitze auf Feld 0. Die Sichtweite müsste 11 Felder betragen, um das Hindernis sehen zu können. Der Zug könnte aber noch eine Runde Runde mit 4F/R weiterfahren und erst auf Feld 4 Anfangen zu bremsen (Der Optimalfall). \
_Der worst case tritt ein_, wenn sich die Zugposition um ein Feld nach vorne verschiebt:
Das Hindernis liegt weiterhin auf Feld 11. Steht die Zugspitze auf Feld 1 und der Zug entscheidet sich nicht zu bremsen, könnte das nächste mal erst auf Feld 5 angefangen werden zu Bremsen - es würde zu einem Unfall kommen.
Deswegen muss der Zug auf Feld 1 das Hindernis sehen können, um rechtzeitig anzufangen zu bremsen.\
*Die Sichtweite muss somit 10 betragen.*
// TODO: Grafik erstellen

$"nötige Sichtweite" = "Bremsweg" + ("aktuelle Geschwindigkeit" - 1) + 1 = "Bremsweg" + "aktuelle Geschwindigkeit"$\
(Die +1 wird für das Feld auf dem das Hindernis liegt benötigt.)

In der Realität kann sich natürlich in jedem Moment dazu entschieden werden zu bremsen. Die Fahrt in voller Geschwindigkeit kann allerdings mit der Reaktionszeit verglichen werden. 
 ])

= Zugfolgesicherung
== Überleitung zu diesem Kapitel
Fahren auf Sicht ist bei hohen Geschwindigkeiten nicht möglich. @pachl_systemtechnik_2022[S. 39]
- _Wie können Auffahrunfälle verhindert werden?_
    - Fahren im festen Raumabstand (Einteilung der Strecke in Blockabschnitte) @pachl_systemtechnik_2022[S. 41-45]
- _Welche Bedingungen müssen erfüllt sein, damit ein Zug in einen Block einfahren darf?_ (#text(fill: red)[Bewusst unvollständig])
  - Der Blockabschnitt muss frei sein. @pachl_systemtechnik_2022[S. 44]
  - Ein vorausgefahrener Zug muss durch ein Halt zeigendes Signal gedeckt sein. @pachl_systemtechnik_2022[S. 44]
  - #text(fill: red)[Eine Bedingung fehlt noch, dafür muss vorher aber ein weiteres Element eingeführt werden\ $->$ folgt weiter unten]
- _Wie kann eine Fahrt in einen Block autorisiert werden?_
  - über mündliche oder fernmündliche Fahrerlaubnis (Zugleitbetrieb) @pachl_systemtechnik_2022[S. 45]
  - über ortsfeste Signale (signalgeführter Betrieb) @pachl_systemtechnik_2022[S. 45] $->$ Prinzip des SigLabs
  - über Führerraumanzeigen (anzeigegeführter Betrieb) $->$ Gesetzlich vorgeschrieben für Geschwindigkeiten $>160 "km/h"$ @pachl_systemtechnik_2022[S. 45-46]
- Ein Halt zeigendes Hauptsignal darf nicht überfahren werden. Der Bremsweg ist aber länger als die Sichtweite. _Wie erfährt der Lokführer rechtzeititg von dem Halt zeigenden Hauptsignal?_
  - Vorsignale @pachl_systemtechnik_2022[S. 50]
  - _Was ist der Vorsignalabstand im SigLab?_
    - 10 Felder
- _Wie kann technisch festgestellt werden, dass ein Zug in einen Block ein- und vollständig wieder ausgefahren ist?_
  - Gleisfreimeldeanlage (Achszähler oder Gleisstromkreise) @pachl_systemtechnik_2022[S. 73 - 75]
  - Elemente einer Gleisfreimeldeanlage können als Signalzugschlussstelle dienen.
  - Sie werden leicht hinter dem Hauptsignal angeordnet @pachl_systemtechnik_2022[S. 44-45] (im Spiel ein Feld) 
  - Daraus ergibt sich die letzte Bedingung, die erfüllt sein muss, damit ein Block befahren werden darf
- _Welche Bedingungen müssen erfüllt sein, damit ein Zug in einen Block einfahren darf?_
  - Der Blockabschnitt muss frei sein. @pachl_systemtechnik_2022[S. 44]
  - Ein vorausgefahrener Zug muss durch ein Halt zeigendes Signal gedeckt sein. @pachl_systemtechnik_2022[S. 44]
  - Der Abschnitt zwischen dem Signal am Ende des Blockabschnitts und der Signalzugschlussstelle muss frei sein. @pachl_systemtechnik_2022[S. 44]




== Hinweise



== Aufgabe 2.1
=== Hinweise
- Blockabstand und Vorsignalabstand nicht verwechseln
=== Vermittlungsziele
*Wahl des Vorsignalabstands zum Hauptsignal*\
- Fernverkehrszug: 160km/h PZB, 200 km/h nur bei LZB (sonst ist Vorsignalabstand für langsamere Züge (z.B. Güterverkehr) unpraktisch)\
-> zu den Vermittlungszielen der ersten Aufgabe zuordnen

- Abwägung Vorsignalabstand -> mischverkehr einheitlich zum stehen kommen
  - realität: Wie viel Vorsignalabstand kann man haben? *überarbeiten*
  - PZB (Signale) nur bis 160 km/h. Schneller FÜhrerraumanzeige - LZB

//TODO Die Abwägung ist auch in Pachls buch zu finden


*Prinzipien der Vorsignalisierung (Unterschied Vorsignalabstand und Blocklänge)*\
- Unterschied zwischen dem Vorsignalabstand zum Hauptsignal und der Blocklänge
- Einabschnittssignalisierung @pachl_systemtechnik_2022[S. 50]
  - Vorsignalabstand $<$ Blocklänge
  - Das Hauptsignal zeigt nur Informationen, die für den unmittelbar folgenden Blockabschnitt gültig sind.
  - Deswegen benötigt jedes Hauptsignal ein Vorsignal, dass das Signalbild des Hauptsignals vorankündigt.
  - HV-Signalsystem in Deutschland
  - Auch das SigLab benutzt eine Einabschnittssignalisierung
  - Vorsignalabstand = Blocklänge
    - Das Vorsignal und das rückliegende Hauptsignal werden am selben Ort angeordnet.
- Mehrabschnittssignalisierung @pachl_systemtechnik_2022[S. 50]
  - Das Hauptsignal zeigt Informationen, die für mindestens zwei Blockabschnitte gültig sind
  - Ist der Vorsignalabstand $>=$ der Blocklänge werden keine Vorsignale benötigt, da die Hauptsignale diese Funktion übernehmen.
  - Zweiabschnittssignalisierung @pachl_systemtechnik_2022[S. 50]
    - Ks-Signalsystem in Deutschland
    - Ist der Vorsignalabstand $<$ die Blocklänge ist eine Einabschnittssignalisierung Leistungsfähiger als eine Mehrabschnittssignalisierung. Deswegen ist es beim Ks-Signalsystem möglich in die Einabschnittssignalisierung zu wechseln @pachl_systemtechnik_2022[S. 52].
  - Dreiabschnittssignalisierung @pachl_systemtechnik_2022[S. 50]
    - Hl-Signalsystem (L gesprochen) in Deutschland als Altsystem der DDR.

#figure(
  image("images/pachl_systemtechnik_2022-prinzipien der Vorsignalisierung.png"),
  caption: [Vorsignalabstand und Blocklänge bei verschiedenen Vorsignalisierungen\ @pachl_systemtechnik_2022[S. 51]]
  )



- HV Signalsystem (aussehen bei Blockabstand > Vorsignalabstand, aussehen bei Blockabstand = Vorsignalabstand)
- KS Signalsystem (KEine Visuelle Unterscheidung zwischen Haupt- und Vorsignal (MAstschilder!))
- Hl (L gesprochen) Signalsystem für Blockabstand < Vorsignalabstand

// TODO Bilder zu den jeweiligen Signalsystemen finden. RIL 301 lässt sich gut zitieren. Aber HV Signalsystem kommt nicht so richtig vor - Kombination mit Haupt- und Vorsignal nicht zu finden.

*Sperrzeit eines Blockabschnitts*
- Sperrzeiten - die verschiedenen Anteile
  - alles fix außer Blockbelegungszeit
  - je kürzer die blöcke desto geringer der Kapazitätsgewinn bei weiterer verkürzung
// TODO Pachls buch nutzen - S.52



=== Lösungen
- Minimale Blocklänge = Vorsignalabstand (da Einabschnittssignalisierung)


//TODO zu klären: Was sind 3 vollständige Blöcke? Mit welchem Signal beginnt der erste vollständige Block und womit endet der letzte Vollständige Block?



== Aufgabe 2.2
=== Hinweise
- erst beide Züge bewegen, dann auf die Sicherungstechnik achten
=== Vermittlungsziele
- Streckenbelegung eines Zuges
- Kapazitätsverlust durch inhomogene Geschwindigkeiten
- LZB Führerraumanzeige
- Exkurs Pzb MAgnete & Bremskurven
=== Lösungen


#bibliography("SigLab - Schulung.bib",style: "apa")


#pagebreak()
= Notizen erste Schulung
Fahrdynamikbrett einführen

8:00 Beginn

8:20 Minuten bis alle angefangen haben die Schulung aufzuauen

alle mussten das Tutorial zweimal machen bis sie nach 7 Runden auf den richtigen Feldern standen

8:35 alle haben angefangen mit den Aufgaben

Was ist das LEarning von Aufgabe 1? Was kann man fachlich einsortieren?

Vollständig verlassen - Block vollständig leer fahren, die Zuglänge muss berücksichtigt werden.

9:15 mit Aufgaben fertig, mit theorie angefangen


9:34 längerer theorie block 


10:00


Bremsweg länge
Fahren im festen Raumabstand
Vorsignal Hauptsignal
Mischbetrieb (max 160 wegen langem abstand zum Hauptsignal)

KV System vs. KS System
Fahrstraßentreppe

Aufgabe
2.1d) berechnung einer Volständigen Sperrzeit - Wie macht man das bei diskreten einheiten. Einmal für alle Höchstgeschwindigkeiten durchführen.

2.2) definieren wo ein Zug startet (direkt am Vorsignal des ersten Block?)
- was bedeutet es drei vollständige Blöcke aufzubauen? Wo fängt der erste Block an, wo hört der letzte Block auf?
- Über vollständige Sperrzeit berechnen wie viele Blöcke zwischen langsamen und schnellem Zug liegen muss?

Präsentation zusammenstellen
- Sperrzeiten treppe
- Belegungszeiten eines Blocks
- Die Folie von Pachls wie viel Strecke ein Zug mindestens und maximal blockiert
- kurzer Überblick zu moving block und lzb/ etcs (kontinuirlich freimelden hinter dem Zug oder in engeren schritten)
- HV Signal
- KS Signal
- HI signal (hier grafik erstellen wie eine FAhrt funktioniert, wenn Vorsignalabstand länger als Blockabstand)
  - PRaxisbeispiel für U-Bahn etc


S.208 - Sperrzeitentreppe
S.98 - Fahren im festen Raumabstand
S.108 - Belegung eines Blocks
S.114

ToDo
- nummerierung mit D-Weg form realisieren (Issue aufmachen)
- quereinstieg in advanced möglich?
  - Was muss man vorher wissen?
  - kurzes erklärvideo?
- Andreas Linhardt: was ist eine gute Schulung um Fahrstraßensicherung kennenzulernen

Paper zu
- Gleisstromkreise (wie häufig befahren?) vs. Achszähler
- Warum Lichter kleiner als im Straßenverkehr?
- Rotfrequenz besonders? Andforderungen an das Licht von Eisenbahnsignalen
  - Es gibt eine Norm bezüglich dem rotspektrum. Warum diese Frequenz so gewählt wurde, wusste er nicht. STeht das vielleicht in der Norm?


Für mich:
- was ist der Betriebliche Unterschied eines deutschen BAhnhofs zu anderen Konzepten/ ländern?
- Was gibt es bis KApitel 2 für Unterschiede in die Schweiz/ Österreich/ Frankereich und andere Länder

#pagebreak()

= Notizen der zweiten Schulung

8:00 beginn
8:30 Tutorial aufgebaut, mti Runde 1 des Tutorials begonnen

8:45 Aufgabe 1 Infrastruktur aufbauen


9:35 Mit dem ersten Kapitel fertig

wie definieren sich 3 Vollständige 
#context {
if text.lang == "en" [

The aim of the learning game is to simulate and experience the driving dynamics of trains in the context of block division.
Real continuous dimensions time ($t$) and distance ($s$) are assigned to discrete units of laps ($t$) and spaces ($s$).
Thus, the simulation is round-based in order to imitate the steps of a computer.

] else if text.lang == "de" [

Ziel des Lernspieles ist die Fahrdynamik von Zügen im Zusammenhang mit Blockteilung zu simulieren und zu erfahren.
Reale kontinuierliche Größen Zeit ($t$) und Strecke ($s$) werden dabei in diskrete Einheiten von Runden ($t$) und Felder ($s$) eingeteilt.
Die Simulation erfolgt also Rundenbasiert, um im Schrittverfahren einen Computer nachzuahmen.

] else {
        text(fill: orange)[The language has to be set either to German or English to show this section]
}
}
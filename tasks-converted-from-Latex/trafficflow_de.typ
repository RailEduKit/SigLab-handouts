#import "../config.typ":*

== Aufgaben: Verkehrsfluss

#rollen\
  - Spielleiter
  - Triebfahrzeugführer eines langsamen Zuges
  - Triebfahrzeugführer eines anderen schnelleren Zuges
  - Fahrdienstleiter

#materialien\
  - Gleise
  - Mindestens drei vollständige Blöcke mit:
    - Vorsignal
    - Hauptsignal und
    - Signalzugschlusstelle
  - zwei beliebige Züge mit zugehörigen Fahrdynamikmodell, Zugschluss- und -spitzensignalen

#aufbau\
  Die Strecke wird in einer Richtung betrieben. Auf der einen Seite brechen die Züge ein und auf der anderen Seite brechen sie aus. Die Infrastruktur vor und hinter der Strecke wird nicht berücksichtigt.

#aufgaben\
  #[
    #set enum(numbering: "a)")

    + Wie viele Runden werden benötigt vom Einbruch des ersten Zuges bis zum Verlassen des zweiten Zuges, wenn beide Züge behinderungsfrei fahren sollen und der schnelle vor dem langsamen Zug fährt?
    + Wie viele Runden werden benötigt vom Einbruch des ersten Zuges bis zum Verlassen des zweiten Zuges, wenn beide Züge behinderungsfrei fahren sollen und der langsame vor dem schnellen Zug fährt?
  ]

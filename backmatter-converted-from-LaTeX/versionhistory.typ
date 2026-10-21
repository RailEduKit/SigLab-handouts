#import "../config.typ":*
#set text(lang: "en")

#let MS = "Martin Scheidt"
#let FN = "Felix Nebel"
#let LG = "Lukas Gruber"
#let LP = "Leonhard Pelster"
#let SZ = "Stephan Zieger"
#let LE = "Laura Enders"
#let PN = "Paula Neumann-Hillebrand"
#let JW = "Jan Werner"
#let PVDH = "Paula von der Heide"
#let JL = "Jiaming Liu"

#context{
let german = text.lang == "de"
let english = text.lang == "en"

if german [= Versionshistorie]
else if english [= Versionhistory]
else {warning-to-set-lang}

table(
    columns: (1fr, 1.5fr, 2.5fr, 5fr),
    inset: 0.5em,
    stroke: 0.5pt,

    if german [*Version*]
    else if english [*Version*],
    if german [*Datum*]
    else if english [*Date*],
    if german [*Autor:Innen*]
    else if english [*Authors*],
    if german [*Änderungen*]
    else if english [*Changes*],

    [0.1],
    [2018-04-17],
    [#MS\ #FN\ #LG],
    if german [
      Ersten Prototyp mit Fahrdynamik erstellt
    ] else [
      First prototype created with driving dynamics
    ],

    [0.2],
    [2018-05-15],
    [#MS\ #LG],
    if german [
      Lehrspiel mit Blocklogik erweitert
    ] else [
      Educational game with block logic extended
    ],

    [0.3],
    [2018-09-03],
    [#MS],
    if german [
      Handbuch erstellt
    ] else [
      Handbook created
    ],

    [0.3.1],
    [2018-10-17],
    [#MS],
    if german [
      Handbuch mit neutralem Design
    ] else [
      Handbook with neutral design
    ],

    [0.4],
    [2018-11-16],
    [#MS\ #LE\ #SZ],
    if german [
      Übersetzung ins Englische
    ] else [
      Translation into English
    ],

    [0.5],
    [2019-03-29],
    [#MS],
    if german [
      Kleinere Verbesserungen und Bastelbögen
    ] else [
      Minor improvements and craft sheets
    ],

    [0.5.1],
    [2019-03-29],
    [#MS],
    if german [
      Anpassung der Streckenlänge und Aufgaben
    ] else [
      Adaptation of track length and tasks
    ],

    [0.6],
    [2019-05-20],
    [#MS],
    if german [
      Fahrstraßen und Fahrstraßenverschluss hinzugefügt
    ] else [
      Added routes and route locking
    ],

    [0.6.1],
    [2019-08-26],
    [#MS\ #LP],
    if german [
      Aufgaben für Fahrstraßen erweitert
    ] else [
      Extended tasks for routes
    ],

    [0.7],
    [2019-09-09],
    [#MS\ #LP],
    if german [
      Spielmechanik mit Aufgaben und Abbildungen überarbeitet
    ] else [
      Reworking of game mechanics together with tasks and figures
    ],

    [0.7.1],
    [2019-09-17],
    [#MS],
    if german [
      Signale fürs Links- und Rechtsfahren angepasst
    ] else [
      Adapted signals for left- and right-hand traffic
    ],

    [0.7.2],
    [2019-09-20],
    [#MS],
    if german [
      Aufgaben aus Version 0.6.1 in Englisch ergänzt
    ] else [
      Supplemented tasks in English from version 0.6.1
    ],

    [1.0],
    [2020-09-30],
    [#LP\ #MS\ #JW\ #PN\ #LG],
    if german [
      Überarbeitung und Neukonzeption
    ] else [
      Revision and new conceptual design
    ],

    [1.0.1],
    [2021-06-16],
    [#MS\ #PN],
    if german [
      Behebung kleinerer Fehler
    ] else [
      Fixing minor errors
    ],

    [1.0.2],
    [2025-03-18],
    [#PVDH\ #JL],
    if german [
      Behebung kleinerer Fehler, Formulierungen
    ] else [
      Fixing minor errors, rephrase tasks
    ],
  )

}
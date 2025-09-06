---
Author: Jun.-Prof. Dr. Dennis Ried
Date: 2025-09-06
DateFormat: german-middle
---
# Arbeiten mit XML
Workshop zur Edirom Summer School 2025, Raum 1.110, Do: 11:15–17:45Uhr & Fr: 9:15–12:45 Uhr

---

# Arbeiten mit XML
Workshop zur Edirom Summer School 2025

## Sitzungen und Ablauf

| # | Datum | Uhrzeit | Inhalt |
| :--- | :---- | :------ | :----- |
| 1 | 11.09.| 11:15–12:45 | Vorstellungsrunde, XML-Basics (Baumstruktur, Navigation mit XPath) |
| 2 | 11.09.| 14:15–15:45 | Transformation mit XSLT I |
| 3 | 11.09.| 16:15–17:45 | Transformation mit XSLT II |
| 4 | 12.09.| 09:15–10:45 | Transformation mit XQuery |
| 5 | 12.09.| 11:15–12:45 | XML-Schema-Erzeugung, Refaktorierung (mit Oxygen), Building Packages with Apache ANT |

# Sitzung 1
## Vorstellungsrunde
* Kurzvorstellung der Teilnehmenden
  * Name, ggf. Institution
  * Vorerfahrungen mit dem Thema
  * Erwartungen an den Workshop/Eigene Ziele
* Kurzvorstellung des Dozenten
* Überblick über die Kurszeiten

## XML-Basics – Wie funktioniert XML?
* Elemente, Attribute, Entitäten, XML-Deklaration, Namespace
* Grundlegen für XML
  * Wohlgeformtheit
  * Key-sensitivity
  * uniqueness
* Die XML-Achsen und Vererbungslehre
  * `self::node()`
  * `parent::node()`, `child::node()`
  * `ancestor::node()`, `descendant::node()`
  * `following::node()`, `preceiding::node()`
  * `following-sibling::node()`, `preceiding-sibling::node()`
* Navigation mit XPath
  * Analogie zu Dateipfaden
  * Kurzschreibweise
  * Ansteuerung von Attributen
  * Ansteuerung von Daten-Typen (text, data, number)
  * Filtern [Eckige Klammern in XPath]

# Sitzung 2&3 Transformation mit XSLT

## Was ist XSLT?
* Wofür steht die Abkürzung XSLT?
* Was ist/macht XSLT?
* Wofür wird XSLT verwendet?

## Mein erstes XSLT-Skript
* Grundaufbau (XML-Struktur)
* Basis-Template (`@match="/"`)
* XSLT im OxygenXML Editor ausführen
* Zwei Ziele
  * Neue Datei erzeugen (z.B. HTML)
  * Daten analysieren/manipulieren

## Daten neu strukturieren
* Beispiel: Namen umsortieren
* Bereitgestellte Dateien:
  * `persName.xml`, enthält den Namen einer Person in strukturierter Form (`<person><persName><forename/><surname/></persName></person>`, Namespace: TEI)
  * `listPerson.xml`, enthält eine strukturierte Liste mit Namen von Personen, es kommen auch Personen mit mehreren Vornamen vor(`<listPerson><person><persName><forename/><surname/></persName></person></listPerson>`, Namespace: TEI)

* Aufgabe 1a: Erzeugen Sie aus der Datei `persName.xml` einen Text-Output nach folgender Form: `Nachname, Vorname`.
* Aufgabe 1b: Erzeugen Sie aus der Datei `persName.xml` einen XML-Output nach folgender Form: `<person><persName><surname/>, <forename/></persName></person>`.

* Aufgabe 2a: Erstellen Sie eine HTML-Tabelle zwei Spalten. Header in Spalte 1: `Nachname`, Spalte 2: `Vorname`
* Aufgabe 2b: Befüllen Sie die Spalten 1&2 mit den Daten aus `listPerson.xml`. (Tipp: Wenn es zu unübersichtlich wird, dann lesen Sie zubeginn nur den ersten Datensatz oder die ersten 10 Datenstze ein.)

Mit dem vorliegenden Ergebnis soll nun in mehreren Schritten weitergearbeitet werden:

1. Die Vornamen formatieren
  1. Umgang mit mehreren Vornamen `string-join()`
  2. Groß- und Kleinschreibung `xsl:choose` optional eigene XSLT-Funktion erstellen.
  3. Umgang mit leeren Elementen (Einfügen von Platzhalter `-/-`) `xsl:choose` oder `xsl:if`
2. Die Tabelle verfeinern, durch Hinzufügen einer Gesamtzahl der Einträge in der Kopfzeile (`count()`)
3. Zusatzaufgabe: Bedingte Formatierung mit CSS `xsl:if`

4. Zusatzaufgabe: Gezielte Datenmanipulation (Gleichbehandlung unterschiedlicher Schreibweisen in Attributwerten, Ersetzung und Erweiterung von Attributwerten `@class`)

## Ausblick
* Zeigen von Anwendungsfällen (z.B. Erzeugung des Kritischen Berichts bei Henze-Digital)
* Kurzer Ausblick zu XSL-FO
* Ausblick zu Abstraktionsebenen (`@mode`)


# Sitzung 4 – XQuery
## Was ist XQuery?
* Was ist/macht XQuery?
* Wofür wird XQuery verwendet?
  * Lokale Transformationen
  * Transformation in der Datenbank (eXist-db)
    * HTML 
    * Update (insert, delete)
    * JSON-Map (HTML-Templating)
* Was ist der Unterschied zu XSLT?

## Mein erstes XQuery-Skript
* Grundaufbau (Präambel, FLOWR)
* Basis-Template
* XQuery im OxygenXML Editor ausführen

## Daten neu strukturieren
Wiederholen Sie die Aufgaben aus dem Kapitel zu XSLT (hier kurze Übersicht) und setzen Sie diese mit XQuery um. Vor Aufgabe 2b beschäftigen wir uns gemeinsam mit dem Thema "Funktionen in XQuery".



# Sitzung 5 Hilfsmittel für die Praxis
* XML-Schema-Erzeugung mit OxygenXML
* Refaktorierung mit Oxygen
* Ausblick: Building Packages mit Apache ANT
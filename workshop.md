<!--
author: Jun.-Prof. Dr. Dennis Ried
email: dennis.ried@uni-paderborn.de
version: 1.0.0
language: de
narrator: Deutsch Female
comment: Workshop zur Edirom Summer School 2025
-->

# Arbeiten mit XML

Ein Workshop zur Edirom Summer School 2025

## Organisatorisches

    --{{0}}--
Herzlich willkommen zum Workshop "Arbeiten mit XML"!

* Dozent: Jun.-Prof. Dr. Dennis Ried
* Datum: 11.-12.09.2025
* Raum: 1.110
* Zeiten: 
    * Do: 11:15–17:45 Uhr
    * Fr: 9:15–12:45 Uhr

## Vorstellungsrunde

    --{{0}}--
Beginnen wir mit einer kurzen Vorstellungsrunde.

* Teilnehmende
    * Name, ggf. Institution
    * Vorerfahrungen mit dem Thema
    * Erwartungen an den Workshop/Eigene Ziele
* Kurzvorstellung des Dozenten
* Überblick über die Kurszeiten

## Ablaufplan

| # | Datum | Uhrzeit | Inhalt |
| :--- | :---- | :------ | :----- |
| 1 | 11.09.| 11:15–12:45 | Vorstellungsrunde, XML-Basics (Baumstruktur, Navigation mit XPath) |
| 2 | 11.09.| 14:15–15:45 | Transformation mit XSLT I |
| 3 | 11.09.| 16:15–17:45 | Transformation mit XSLT II |
| 4 | 12.09.| 09:15–10:45 | Transformation mit XQuery |
| 5 | 12.09.| 11:15–12:45 | XML-Schema-Erzeugung, Refaktorierung, Apache ANT |

## XML Grundlagen

    --{{0}}--
Lassen Sie uns zunächst die grundlegenden Konzepte von XML kennenlernen.

### Was ist XML?

* eXtensible Markup Language
* Auszeichnungssprache zur Strukturierung von Daten
* Hierarchische Baumstruktur
* Menschen- und maschinenlesbar

### Beispiel eines XML-Dokuments

```xml
<?xml version="1.0" encoding="UTF-8"?>
<person>
    <name>
        <vorname>Dennis</vorname>
        <nachname>Ried</nachname>
    </name>
    <alter>35</alter>
    <beruf status="aktiv">Musikwissenschaftler</beruf>
</person>
```

### XML-Grundelemente

* Elemente: `<name/>`
* Attribute: `<name art="amtlich">`
* XML-Deklaration: `<?xml version="1.0" encoding="UTF-8"?>`
* Namespaces: `xmlns="http://www.example.org"`
* Entitäten: `& = &amp;`, `< = &lt;`, `> = &gt;`, ...

### Wohlgeformtheit

Ein XML-Dokument ist wohlgeformt wenn...

* es genau ein Wurzelelement hat
* alle Elemente korrekt geschlossen sind
* Elemente ineinander geschachtelt und nicht verschränkt (!) sind

Zu Beachten:
* Was auf geht, muss auch zu gehn!
* Groß-/Kleinschreibung!

## XPath - Navigation in XML

    --{{0}}--
XPath ist wie ein Navigationssystem für XML-Dokumente.

### XPath-Basics

* Die wichtigsten Achsen:

  * `self::node()`
  * `parent::node()`, `child::node()`
  * `ancestor::node()`, `descendant::node()`
  * `following::node()`, `preceding::node()`
  * `following-sibling::node()`, `preceding-sibling::node()`

`````````````````````````````````````````````````` 
                 ancestor
                     ↑
ancestor-sibling ← parent → ancestor-sibling
                     ↑
preceding-sibling ← self → following-sibling
                     ↓
       preceding ← child → following
                     ↓
                 descendant
``````````````````````````````````````````````````

### Navigation mit XPath

* Analogie zu Dateipfaden
* Kurzschreibweise
* Ansteuerung von Attributen
* Ansteuerung von Daten-Typen (text, data, number)
* Filtern [Eckige Klammern in XPath]

## XSLT Transformation

    --{{0}}--
XSLT ist eine mächtige Sprache zur Transformation von XML-Dokumenten.

### Was ist XSLT?

* eXtensible Stylesheet Language Transformation
* Transformationssprache für XML
* Erzeugt neue Dokumente aus XML-Daten
* Ausgabeformate: XML, HTML, Text, etc.

### Grundlagen XSLT

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <!-- Transformation rules here -->
    </xsl:template>
    
</xsl:stylesheet>
```

## XQuery Transformation

    --{{0}}--
XQuery ermöglicht uns komplexe Abfragen und Transformationen von XML-Daten.

### Was ist XQuery?

* XML Query Language
* Abfragesprache für XML-Daten
* FLOWR-Ausdrücke (For, Let, Order by, Where, Return)
* Ideal für Datenbankabfragen

### XQuery Beispiel

```xquery
for $person in //person
where $person/beruf = "Musikwissenschaftler"
order by $person/name/nachname
return $person/name
```

## Praktische Werkzeuge

    --{{0}}--
Zum Abschluss schauen wir uns wichtige Werkzeuge für die XML-Arbeit an.

### XML-Schema und Tools

* XML-Schema-Erzeugung mit Oxygen XML Editor
* Refaktorierung von XML-Dokumenten
* Apache ANT für Build-Prozesse

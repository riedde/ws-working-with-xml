<!--
author: Jun.-Prof. Dr. Dennis Ried
email: dennis.ried@uni-paderborn.de
version: 1.0.0
language: de
narrator: Deutsch Female
comment: Workshop zur Edirom Summer School 2025
mode: Presentation
icon: https://wcms.itz.uni-halle.de/download.php?down=57357&elem=3333420
link: https://raw.githubusercontent.com/riedde/ws-working-with-xml/refs/heads/main/style.css
-->

# Arbeiten mit XML

Ein Workshop zur Edirom Summer School 2025

!["QR-Code zum LiaScript-Kurs"](resources/qr2course.png) <!-- style="width:25%" -->

[https://mlu.de/b03ae](https://mlu.de/b03ae)


Die Daten liegen frei zugänglich in einem [Github-Repository](https://github.com/riedde/ws-working-with-xml).


## Organisatorisches
 
Herzlich willkommen zum Workshop "Arbeiten mit XML"!

{{0}}
* Dozent: Jun.-Prof. Dr. Dennis Ried
* Raum: 1.110
* Zeiten:
  
  * Do, 11.09.: 11:15–17:45 Uhr
  * Fr, 12.09.: 9:15–12:45 Uhr

{{1}}
* Vorstellungsrunde
  
  * Name, ggf. Institution
  * Vorerfahrungen mit dem Thema
  * Erwartungen und Ziele

              {{2}}
**********************************

* Kursplan

| # | Datum | Uhrzeit | Inhalt |
| :--- | :---- | :------ | :----- |
| 1 | 11.09.| 11:15–12:45 | Vorstellungsrunde, XML-Basics (Baumstruktur, Navigation mit XPath) |
| 2 | 11.09.| 14:15–15:45 | Transformation mit XSLT I |
| 3 | 11.09.| 16:15–17:45 | Transformation mit XSLT II |
| 4 | 12.09.| 09:15–10:45 | Transformation mit XQuery |
| 5 | 12.09.| 11:15–12:45 | XML-Schema-Erzeugung, Refaktorierung, Apache ANT |

**********************************
## XML Grundlagen

Wir wollen zunächst die grundlegenden Konzepte von XML kennenlernen.

### Was ist XML?

* e**X**tensible **M**arkup **L**anguage
* Auszeichnungssprache zur Strukturierung von Daten
  
  * Semantische Ebene

* Hierarchische Baumstruktur
* Menschen- und maschinenlesbar
* Textformat
  
  * non-proprietär, nicht plattformgebunden
  * langzeitarchivierbar
  * Versionsverwaltung möglich (git, svn)

### Beispiel eines XML-Dokuments

```xml
<?xml version="1.0" encoding="UTF-8"?>
<person xmlns="http://ess.upb.de/2025/arbeiten-mit-xml">
    <name>
        <vorname>Dennis</vorname>
        <nachname>Ried</nachname>
    </name>
    <alter>35</alter>
    <beruf status="aktiv">Musikwissenschaftler</beruf>
</person>
```

### XML-Grundelemente

Die wichtigsten Aspekte zum Thema XML:

{{3}}
****************
* XML-Deklaration: `<?xml version="1.0" encoding="UTF-8"?>`
* Schema (xsd, rng, TEI-ODD)
*****************
{{1}}
****************
* Elemente: `<beruf/>`
  
  {{4}}
  * Namespaces: `xmlns="http://ess.upb.de/2025/arbeiten-mit-xml"`
* Attribute: `<beruf status="aktiv">`
****************
{{2}}
****************

* Entitäten:

  * `&` = `&amp;`
  * `<` = `&lt;`
  * `>` = `&gt;`
  * `"`= `&quot;`
  * `'`= `&apos;`
  * [weitere...](https://wiki.selfhtml.org/wiki/Zeichenreferenz)
****************

                 {{3}}
************************************************

* [mehr zum Thema](https://www.data2type.de/xml-xslt-xslfo/xml/xml-in-a-nutshell/xml-grundlagen)

************************************************
### Wohlgeformtheit

Ein XML-Dokument ist wohlgeformt wenn...

{{1}}
* es genau ein Wurzelelement hat

{{2}}
* alle Elemente korrekt geschlossen sind (`<a></a>` oder `<a/>`)

{{3}}
*********************************
* Elemente ineinander geschachtelt und nicht verschränkt (!) sind
  
  * `<a><b></b></a>` --> richtig
  * `<a><b></a></b>` --> falsch
*********************************

{{4}}
*********************************
Wohlgeformtes XML

```xml
<a>
   <b>
      <c/>
   </b>
</a>
```
*********************************

{{5}}
*********************************
Zu Beachten:

* Was auf geht, muss auch zu gehn!
* Groß-/Kleinschreibung!
*********************************

## XPath - Navigation in XML

XPath ist wie ein Navigationssystem für XML-Dokumente.

### XPath-Basics
{{0}}
* Die [XML-Achsen](https://www.data2type.de/xml-xslt-xslfo/xpath/xpath-einfuehrung/knotentypen-und-achsen):
  
  * `self::node()`
  * `parent::node()`, `child::node()`
  * `ancestor::node()`, `descendant::node()`
  * `following-sibling::node()`, `preceding-sibling::node()`
  * `following::node()`, `preceding::node()`

    {{1}}

`````````````````````````````````````````````````` 
                                   .-+-. 
                                  (     )
                                   `-+-´ 
                                     |
                       +-------------+                                                   
                       |             |                                                   
                     .-+-.         .-+-.                                                
                    (     )       (     )
                     `-+-´         `-+-´                                                
                                     |
   +-------------------+-------------+-------------+----------------------+              
   |                   |                           |                      |              
 .-+-.               .-+-.                       .-+-.                  .-+-.
(     )             (  x  )                     (     )                (     )
 `-+-´               `-+-´                       `-+-´                  `-+-´
                       |                                                  |
            +----------+----------+                            +----------+----------+   
            |          |          |                            |          |          |   
          .-+-.      .-+-.      .-+-.                        .-+-.      .-+-.      .-+-. 
         (     )    (     )    (     )                      (     )    (     )    (     )
          `-+-´      `-+-´      `-+-´                        `-+-´      `-+-´      `-+-´ 
            |                                                                            
       +----+-----+
       |          |                                                             
     .-+-.      .-+-. 
    (     )    (     )
     `-+-´      `-+-´ 
``````````````````````````````````````````````````

### Navigation mit XPath
{{0}}
* Dateipfade (Analogie): `Ordner/Unterordner/Datei`

{{1}}
*********************************
* Beispiel von vorhin:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<person xmlns="http://ess.upb.de/2025/arbeiten-mit-xml">
    <name>
        <vorname>Dennis</vorname>
        <nachname>Ried</nachname>
    </name>
    <alter>35</alter>
    <beruf status="aktiv">Musikwissenschaftler</beruf>
</person>
```
*********************************
  {{2}}
  * XML-Pfad  `person/name/vorname`
  
{{3}}
*********************************
* Kurzschreibweise

  * `//vorname` oder `person//vorname`

*********************************
{{4}}
*********************************
* Ansteuerung von Attributen
  
  * `//beruf/@status`

*********************************
{{5}}
*********************************
* Ansteuerung von Daten-Typen (text, data, number)

  * `//vorname/text()`
  * `//alter/text()` oder `//alter/number()``
  * `//text()`
*********************************
{{6}}
* Filtern – Eckige Klammern in XPath
  
  * `//person/name[vorname]`
    
    - Alle `name`-Elemente, die einen `vorname`-Element enthalten.
    - Aber: Keine Aussage über Inhalt von `vorname`!
  
  * `//beruf[@status="aktiv"]/text()`

    - Alle Textknoten, die sich eine Ebene unterhalb von `beruf` befinden, sofern das `beruf`-Element ein Attribut `@status` mit dem Wert `aktiv` aufweist.

### Übung

                 {{0}}
************************************************

Verwende in OxygenXML den XPath-Baumeister und steuere in der Datei `listPerson_short.xml` folgendes an:

* Alle Nachnamen
* Alle Personen, die mehrere Vornamen haben

************************************************

                 {{1}}
************************************************

Verwende für die folgenden Aufgaben nun die Datei `listPerson_short.xml`

* Gesamtzahl der Personen mit mehreren Vornamen (Tipp: `count()`)
* Die maximale Anzahl an Vornamen
* Alle Personen, deren Nachname mit einem "M" beginnt

************************************************

## XSLT Transformation

XSLT ist eine mächtige Sprache zur Transformation von XML-Dokumenten.

### Was ist XSLT?

* e**X**tensible **S**tylesheet **L**anguage **T**ransformation
* Transformationssprache für XML

  * Verarbeitungsanweiung/Schablone
  * Skript muss ausgeführt werden (Saxon)

* Erlaubt das erzeugen neuer Dokumente aus XML-Daten
  
  * input.xml -> output.xml

* Ausgabeformate: XML, HTML, Text, etc.

* Wichtige Seiten: [XSLT-Kochbuch](https://www.data2type.de/xml-xslt-xslfo/xslt/xslt-kochbuch), [XPath Funktionen](https://www.datypic.com/xq/)
### Grundlagen XSLT

{{0}}
*****************************************
So sieht ein XSLT-Script aus:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <!-- Transformation rules here -->
    </xsl:template>
    
</xsl:stylesheet>
```
*****************************************

{{1}}
*****************************************
- Ein **Template** ist eine Art Schablone, die immer dann zum Einsatz kommt, wenn das Ergebnis der Prüfung im Attribut `@match` wahr ist.
- Das erste Template entscheidet, was überhaupt verarbeitetet werden kann (hier: root `/`, d.h. alles innerhalb des Dokuments)
- Wenn weitere Templates hinzugefügt werden, ist es nötig die Verhaltensweise zu definieren
*****************************************

## XSLT Übungen

Lass uns das Gelernte mit praktischen Übungen vertiefen.

### Aufgabe 1: HTML-Liste erstellen

{{0}}
_Tipp: Kleine Bausteine sind leichter zu überblicken, als große_; wir verwenden nun zwei Templates

{{1}}
*****************************************
Hier ist der Rahmen für die HTML-Liste, den Inhalt müsst ihr selbst erzeugen.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Meine Ergebnisliste</title>
            </head>
            <body>
                <ul>
                    <xsl:apply-templates/>
                </ul>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:person">
        <li xmlns="http://www.w3.org/1999/xhtml">    
            <xsl:value-of select="..."/>
        </li>
    </xsl:template>
    
</xsl:stylesheet>
```
*****************************************

{{2}}
*****************************************
**Klappt nicht?**

- "OxygenXML meldet: _Could not parse_" -> Das XSLT ist nicht wohlgeformt/valide
- "ich bekomme keine bzw. alle Namen in jedem `<li>` ausgegeben" -> Ist der Kontext richtig?
- "irgendetwas anderes" -> Frag deinen Dozent, er hilft dir gerne!
*****************************************


### Aufgabe 2: HTML-Tabelle erstellen

                 {{0}}
************************************************

**Aufgabe 2a:**

Erstelle eine [HTML-Tabelle](https://www.w3schools.com/html/html_tables.asp) mit zwei Spalten:

* Spalte 1: "Nachname"
* Spalte 2: "Vorname"

_Tipp: Du kannst den HTML-Rahmen aus der vorigen Übung verwenden, dann musst du nur den Inhalt des `<body>`-Elements neu gestalten._

************************************************

                 {{1}}
************************************************

**Lösung 2a:**

```xml
<xsl:template match="/">
    <html>
        <body>
            <table>
                <tr>
                    <th>Nachname</th>
                    <th>Vorname</th>
                </tr>
                <xsl:apply-templates/>
            </table>
        </body>
    </html>
</xsl:template>
```

************************************************

                 {{2}}
************************************************

**Aufgabe 2b:**
Befülle die Tabelle mit den Daten aus `listPerson.xml`.

************************************************

                 {{3}}
************************************************

**Lösung 2b:**

```xml
<xsl:template match="tei:person">
    <tr>
        <td><xsl:value-of select=".//tei:surname"/></td>
        <td><xsl:value-of select=".//tei:forename"/></td>
    </tr>
</xsl:template>
```

************************************************

### Intermezzo: Schleifen

Was genau macht `<xsl:template match="tei:person">` eigentlich?

Jedes Mal, wenn ein TEI-Element namens `person` auftaucht, wird die Operation im Template ausgeführt.
Das Ganze kann man auch als Schleife ausdrücken. Der XSLT-Befehlt dafür heißt `<xsl:for-each>`.

```xml
<xsl:for-each select="//tei:person">
    <tr>
        <td><xsl:value-of select=".//tei:surname"/></td>
        <td><xsl:value-of select=".//tei:forename"/></td>
    </tr>
</xsl:for-each>
```

Warum aber sollte man das machen?

Ganz einfach: Mit `<xsl:for-each>` können wir die Daten sortieren.

```xml
<table>
    <tr>
        <th>Nachname</th>
        <th>Vorname</th>
    </tr>
    <xsl:for-each select=".//tei:person">
        <xsl:sort order="ascending" select=".//tei:surname"/>
        <tr>
            <td><xsl:value-of select=".//tei:surname"/></td>
            <td><xsl:value-of select=".//tei:forename"/></td>
        </tr>
    </xsl:for-each>
</table>
```

### Aufgabe 3

**Aufgaben:**

1. Mehrere Vornamen mit [`string-join()`](https://www.datypic.com/xq/fn_string-join.html) verbinden
2. Entfernung von Partikeln `von` für eine bessere Sortierung
3. Leere Elemente mit `-/-` ersetzen

_Tipp: Verwende Conditionals oder eine Auswahlfunktion_ (`xsl:if` oder `xsl:choose`)

### Funktionen

                 {{0}}
************************************************

Wenn du eine bestimmte Aktion wiederverwenden möchtest, kannst du eine eigene Funktion definieren.

************************************************

                 {{1}}
************************************************

Zum Beispiel um Namen für die Sortierung zu bereinigen:

```xml
<xsl:function name="my:betterSort">
    <xsl:param name="name" as="element()"/>
    <xsl:choose>
        <xsl:when test="starts-with($name,'von ')">
            <xsl:value-of select="substring-after($name,'von ')"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$name"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:function>

<!-- Anwendung: -->
<xsl:sort order="ascending" select="my:betterSort(.//tei:surname)"/>
```

---------------
************************************************

                 {{2}}
************************************************

Oder um den zweiten und jeden weiteren Vornamen abzuhürzen:

```xml
<xsl:function name="my:nameShortener">
    <xsl:param name="names" as="element()*"/>
    <xsl:choose>
        <xsl:when test="count($names) gt 1">
            <xsl:value-of select="$names[1]"/>
            <xsl:text> </xsl:text>
            <xsl:for-each select="$names[position() > 1]">
                <xsl:value-of select="concat(substring(.,1,1),'.')"/>   
            </xsl:for-each>
            
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$names"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:function>

<!-- Anwendung: -->
<xsl:value-of select="my:nameShortener(.//tei:forename)"/>
```

************************************************

### Best Practice

Dokumentation ist alles!

Helft euch selbst und allen, die eure Skripte nachnutzen oder überarbeiten wollen/sollen/müssen: Schreibt Kommentare in die Skripte, damit man versteht, was dort passiert.

1. Möglichkeit: XML-Kommentar `<!-- Ein Kommentar -->`
2. Möglichkeit: [XSLTdoc](https://xsltdoc.github.io/) verwenden

```xml
<!-- xmlns:xd="http://www.pnp-software.com/XSLTdoc" -->

<xd:doc>Diese Funktion konvertiert einen Namen in
    Kleinbuchstaben und eliminiert den string "von ",
    sofern vorhanden.</xd:doc>
<xsl:function name="my:betterSort">
    [...]
</xsl:function>
```

### Ausblick
* Zeigen von Anwendungsfällen (z.B. Erzeugung des Kritischen Berichts bei Henze-Digital)
* Kurzer Ausblick zu [XSL-FO](https://www.data2type.de/xml-xslt-xslfo/xsl-fo)
* Ausblick zu Abstraktionsebenen (`@mode`)

## XQuery Transformation

XQuery ermöglicht uns komplexe Abfragen und Transformationen von XML-Daten.

### Was ist XQuery?

* e**X**tensible **Query** Language (XQL)
* Abfragesprache für XML-Daten
* FLOWR-Ausdrücke
  
  | XQL   | Bedeutung   | XSLT   |
  | :--------- | :--------- | :--------- |
  | **F**or | Schleife | `xsl:for-each` |
  | **L**et | Variable | `xsl:variable` |
  | **O**rder by | Sortierung |  `xsl:sort`|
  | **W**here | Filter | [über XPath] |
  | **R**eturn | Rückgabe | [nicht nötig] |

* Ideal für Datenbankabfragen
  
  * Kann in [eXist-db](https://exist-db.org/exist/apps/homepage/index.html) ausgeführt werden.
  * erlaubt Update-Funktionen
  * erlaubt mehrstufige Verarbeitungsanweiung
  * erlaubt JSON-Maps als output (DB-interne Verarbeitung)

* mehr dazu bei [Priscilla Walmsley](https://www.datypic.com/books/xquery/)
### XQuery Beispiel

```xquery
xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace mei="http://www.music-encoding.org/ns/mei";

let $document := doc('examples/listPerson.xml')

for $person in $document//tei:person
    where starts-with($person//tei:surname, 'M')
    order by $person//tei:surname
    return
        $person
```

### XQuery Übungen

**Aufgabe:**

Wiederholen Sie die XSLT-Aufgaben mit XQuery.

Aufgabe 1: Erstellen einer HTML-Liste

Erstelle eine HMTL-Liste, die die Namen alphabetisch auflistet.

_TIPP: Erstelle eine Variable `$persons`, die du weiterverarbeitest. Erstelle eine zweite Variable `$lines`, die du im Return zurückgibst. Spare beim skripten nicht an Variablen._

_Tipp: Du kannst in XQuery auch direkt html schreiben, und dort wieder XQuery. Das musst du nur durch `{}`aufrufen._

```xquery
xquery version "3.1";

declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace tei="http://www.tei-c.org/ns/1.0";

let $document:= doc('../examples/listPerson.xml')

let $persons := $document//tei:person

let $lines := for $person in $persons
                let $surname := $person//tei:surname
                let $forename := $person//tei:forename => string-join(' ')
                let $name := string-join(($surname,$forename),', ')
                return
                    element li {$name}

return
   <html xmlns="http://www.w3.org/1999/xhtml">
       <head>
           <title>Meine Ergebnisliste</title>
       </head>
       <body>
           <ul>
               {for $line in $lines
                    order by $line descending
                    return
                        $line
               }
           </ul>
       </body>
   </html>
```


## Praktische Werkzeuge

Zum Abschluss schauen wir uns wichtige Werkzeuge für die XML-Arbeit an.

### XML-Schema und Tools

* XML-Schema-Erzeugung mit Oxygen XML Editor
  
  * Schema erzeugen, Daten validieren

* Refaktorierung von XML-Dokumenten
  
  * OxygenXML hat XSLTs integriert!

* XSLT mit OxygenXML ausführen

* Apache ANT für Build-Prozesse
  
  * Datenpakete bauen (.zip, .xar)
  * Daten prozessieren (sortieren, bereinigen)
  * XSLT via Ant auf der Komandozeile ausführen

xquery version "3.1";

declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace tei="http://www.tei-c.org/ns/1.0";

declare function local:joinName($nameElems as element()*) as xs:string {
    string-join($nameElems, ' ')
};

declare function local:nameSort($nameElems as xs:string) as xs:string {
    let $nameStr := string-join($nameElems, ' ')
    let $nameCleaned := if (starts-with(lower-case($nameStr),'von '))
                        then (substring-after($nameStr,'von '))
                        else ($nameStr)
                        
    return
        $nameCleaned => normalize-space()
};

let $document:= doc('../data/listPerson.xml')


let $persons := $document//tei:person

let $tableRows := for $person in $persons
                    let $surnames := local:joinName($person//tei:surname)
                    let $forenames := local:joinName($person//tei:forename)
                    order by local:nameSort($surnames), local:nameSort($forenames)
                    return
                        element tr {
                            element td {$surnames},
                            element td {$forenames}
                        }

let $output :=  <html>
                    <head>
                        <title>Meine Tabelle</title>
                    </head>
                    <body>
                    <h1>Meine Tabelle enthält {count($persons)} Namen!</h1>
                        <table>
                            <tr>
                                <th>Nachname</th>
                                <th>Vorname</th>
                            </tr>
                            {$tableRows}
                        </table>
                    </body>
                </html>

return
   $output
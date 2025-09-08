xquery version "3.1";

declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace tei="http://www.tei-c.org/ns/1.0";

let $document:= doc('../data/listPerson.xml')

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
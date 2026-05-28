# Codifica di Testi

Il progetto contenuto in questo repository è stato realizzato per l'esame di Codifica di Testi
del Corso di Laurea Triennale in Informatica Umanistica con il professor Angelo Mario Del Grosso
da Valentina Cosenza.

Il progetto è stato validato con Xerces versione 2.12.2 e i file XML e XSL sono stati trasformati
con Saxon HE 12.9 in un file HTML.

## Comando per la validazione con Xerces 2.12.2

```bash
java -cp "tools/xerces-2_12_2/xml-apis.jar;tools/xerces-2_12_2/xercesImpl.jar;tools/xerces-2_12_2/xercesSamples.jar" dom.Counter -v progetto.xml
```

Risultato: 

`progetto.xml: 224;25;0 ms (2713 elems, 8980 attrs, 28685 spaces, 81694 chars)`

## Comando per la trasformazione con Saxon HE 12.9

```bash
java -jar tools/SaxonHE12-9J/saxon-he-12.9.jar -s:progetto.xml -xsl:progetto.xsl -o:output.html
```

Risultato:

Il file HTML chiamato `output.html`.

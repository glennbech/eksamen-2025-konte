# PGR301 DevOps i skyen -Gjentak: 72 timers skriftlig individuell hjemmeeksamen

### Svar og drøfting av oppgaver: 

**Oppgave 1**

Metoden jeg bruker for en sikker håndtering av sensitive verdier, i dette tilfellet API key for StatusCake'en min er da
å lagre api key'en i GitHub secrets så den ikke er synlig for noen andre enn meg vist jeg vil gå inn å se på den selv.
Når den da skal brukes videre av programet får terraform hemligheten med bruk av enviroment variabler.

**Oppgave 2**

Jeg valgte å sette min backoff til 2 sekunder og max backoff til 10 sekunder for å unngå å overbelaste API-et ved å legge inn en forsinkelse etter feil.
Dette betyr at jeg venter to sekunder mellom forsøkene og maksimalt ti sekunder før jeg prøver igjen.

Jeg kunne også ha lagt til rps, men siden jeg ikke gjør mange forespørsler, vil jeg sannsynligvis ikke nå rate limiten.
Basert på det jeg har sett i StatusCake sine check instillinger, har API-et allerede rate limits bygd inn, så jeg bestemte meg for å droppe dette for nå.
Det kan likevel være nødvendig hvis jeg kjører mange sjekker så kan være fin å ha i framtiden en gang.

Jeg la til contact email og kontakt gruppe som er meg. La til dette i variable fil som kaller på variablene i main. la også til variabler
for timeout, check interval, og trigger rate. Dette er fordi det blir mer fleksibelt å endre instillingene nå uten å måtte endre kode.

**Oppgave 4**
Første åpenbare utfordringen vil være at hvis flere kjører en terraform apply kan filen bli ødelagt eller overskrevet siden begge har samme lokale state fil men ulike opdateringer
Jo flere på ett team jo høyere sikkerhetsrisiko vil det også være siden en Terraform state kan inneholde verdier som en API-nøkkel, passord osv. så hvis denne filen blir lagt til i git kan hemligheter gis ut.
En bedre måte å håndtere terraform state på er for eksempel å lagre state i en Amazon S3-bucket og bruke DynamoDb for låsing så flere ikke kan gjøre forandringer samtidig.

# Hotel Lero – Ekspertni sustav za upravljanje ljudskim resursima (Flora-2)

Ovaj projekt predstavlja prototip ekspertnog sustava za upravljanje ljudskim resursima u hotelskom okruženju, implementiran korištenjem deklarativnog i logičkog programiranja u alatu Flora-2. Sustav je temeljen na F-logici te omogućuje formalno modeliranje organizacijske strukture hotela, zaposlenika, ugovornih odnosa i zahtjeva za godišnji odmor, uz definiranje poslovnih pravila i automatsko zaključivanje.

Projekt demonstrira kako se poslovna pravila mogu izdvojiti iz proceduralnog koda i izraziti u deklarativnom obliku, čime se postiže veća transparentnost, proširivost i lakše održavanje sustava. Svi podatci korišteni u projektu su fiktivni i služe isključivo u demonstracijske i edukacijske svrhe.


## Struktura projekta

Projekt je isporučen u direktoriju `hotel-lero-flora2` i sastoji se od sljedećih datoteka:

- main.flr  
  Glavna ulazna datoteka sustava. Služi za inicijalizaciju baze znanja te učitavanje svih ostalih komponenti (sheme, pravila i podataka) u jedinstveni kontekst.

- schema.flr  
  Definicija sheme sustava, uključujući klase (employee, department, position, contract, leaveRequest) i njihove atribute.

- rules.flr  
  Poslovna pravila sustava i izvedeni predikati. U ovoj datoteci definirana su pravila za upravljačke uloge, ugovorne odnose, godišnje odmore, izračun bonusa te detekciju kršenja poslovnih pravila.

- data.flr  
  Inicijalni podatci sustava. Sadrži definicije odjela, radnih pozicija, zaposlenika, ugovora i zahtjeva za godišnji odmor.

- demo.cmd  
  Skripta s demonstracijskim upitima za provjeru ispravnosti učitavanja podataka i zaključivanja.

- update_demo.cmd  
  Skripta koja demonstrira dinamičko ažuriranje baze znanja pomoću operacija insert i delete.

- run_demo.sh  
  Bash skripta za automatizirano pokretanje demonstracije iz datoteke demo.cmd.

- run_update_demo.sh  
  Bash skripta za automatizirano pokretanje demonstracije iz datoteke update_demo.cmd.

## Korištene tehnologije i alati

Projekt je razvijen i testiran korištenjem sljedećih tehnologija i alata:

- **Flora-2**  
  Korišten je kao primarni alat za implementaciju deklarativnog i logičkog programiranja. U Flora-2 okruženju definirana je baza znanja temeljena na F-logici, uključujući shemu sustava, poslovna pravila, izvedene predikate i mehanizme zaključivanja.

- **XSB Prolog**  
  Flora-2 se oslanja na XSB Prolog kao izvršno okruženje za logičko zaključivanje. XSB Prolog omogućuje učinkovitu evaluaciju pravila, tablični mehanizam (tabling) te stabilno izvođenje složenih upita nad bazom znanja.

- **Ubuntu Linux**  
  Operacijski sustav korišten za razvoj i testiranje projekta. Bash skripte za automatizirano pokretanje demonstracija prilagođene su Linux okruženju.

- **Emacs**  
  Korišten kao razvojno okruženje za uređivanje `.flr`, `.cmd` i `.sh` datoteka, uz podršku za rad s Prolog/Flora-2 sintaksom i jednostavno pokretanje alata iz terminala.

Navedeni alati predstavljaju **preduvjete za pokretanje projekta i izvršavanje demonstracijskih skripti**. Za ispravan rad sustava potrebno je imati instalirane Flora-2 i XSB Prolog u Linux okruženju s podrškom za bash skripte.

## Pokretanje sustava u Flora-2 okruženju

Rad sustava može se testirati interaktivno kroz Flora-2 sučelje ili automatizirano pomoću pripremljenih skripti. Nakon raspakiravanja projekta potrebno je pozicionirati se u direktorij projekta i pokrenuti Flora-2 okruženje.

Primjer osnovnog pokretanja:

cd <putanja_do_projekta>/hotel-lero-flora2  
runflora

Nakon pokretanja Flora-2 sučelja, baza znanja učitava se naredbom:

[main>>kb].

Ovom naredbom inicijalizira se radni kontekst te se učitavaju definicije sheme, poslovnih pravila i podataka.


## Demonstracija upita – demo.cmd

Datoteka demo.cmd sadrži skup demonstracijskih upita kojima se provjerava ispravnost rada sustava. Skripta se izvršava neinteraktivno, a Flora-2 ispisuje pronađena rješenja ili potvrđuje da rješenja nema.

Pokretanje skripte s preduvjetom da je terminal pozicioniran na direktorij u kojem su datoteke projekta:

runflora < demo.cmd

Upiti u ovoj skripti obuhvaćaju:
- dohvat osnovnih entiteta (npr. svi odjeli i svi menadžeri),
- provjeru izvedenih svojstava (npr. topManagement),
- provjeru organizacijske strukture (odjeli i pripadajući menadžeri),
- detekciju kršenja poslovnih pravila korištenjem predikata violation,
- izračun izvedenih atributa (pravo na godišnji odmor, preostali dani, postotak i iznos bonusa),
- automatsko odobravanje valjanih zahtjeva za godišnji odmor.

Na ovaj način demonstrira se ispravnost pravila i zaključivanja nad inicijalnim podatcima sustava.


## Demonstracija ažuriranja baze znanja – update_demo.cmd

Datoteka update_demo.cmd demonstrira dinamički rad s bazom znanja. Cilj ove skripte nije mijenjati postojeće podatke u sustavu, već umetnuti privremene demonstracijske entitete, izvršiti upite nad njima te ih na kraju ukloniti iz baze znanja.

Pokretanje skripte s preduvjetom da je terminal pozicioniran na direktorij u kojem su datoteke projekta:

runflora < update_demo.cmd

Skripta uključuje:
- umetanje demonstracijskog zaposlenika, pripadajućeg ugovora i zahtjeva za godišnji odmor,
- provjeru zaključivanja nad umetnutim podatcima (npr. automatsko odobravanje zahtjeva),
- umetanje zaposlenika s namjerno nevaljanom kombinacijom pozicije i odjela radi detekcije kršenja pravila,
- uklanjanje svih umetnutih entiteta iz baze znanja pomoću delete naredbi.

Na ovaj se način demonstrira mogućnost ažuriranja baze znanja bez narušavanja postojećih podataka.


## Pokretanje demonstracija pomoću bash skripti

Za jednostavnije i ponovljivo pokretanje demonstracija pripremljene su bash skripte.

Pokretanje demonstracije statičkih upita s preduvjetom da je terminal pozicioniran na direktorij u kojem su datoteke projekta:

./run_demo.sh

Pokretanje demonstracije ažuriranja baze znanja s preduvjetom da je terminal pozicioniran na direktorij u kojem su datoteke projekta:

./run_update_demo.sh

Korištenjem ovih skripti cjelokupna demonstracija rada sustava svodi se na jednu naredbu, uz standardizirani ispis rezultata u konzoli.


## Napomena

Projekt je izrađen kao edukacijski i demonstracijski primjer primjene deklarativnog programiranja i ekspertnog sustava u domeni upravljanja ljudskim resursima. Sustav se može proširivati dodavanjem novih pravila, atributa i entiteta bez promjene postojeće strukture programa.

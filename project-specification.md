## General
- Odevzdání kontextového balíčku projektu na moodle
    - do konce 4. výukového týdne,
    - odevzdává každý ve skupině samostatně
- Semestrální Projekt
	- Termín odevzdání
	    - 1. pokus dle zadání na cvičeních a moodle (viz níže)
	    - 1. pokus (pouze opravný) maximálně 3 týdny po prvním pokusu
	- Viz Požadavky pro vypracování projektu
	- Vše v požadované kvalitě, nikoliv minimalistická řešení
	- Maximum 50 bodů 
	- Minimum 30 bodů

# Zápočtový projekt - podmínky
## Základní specifikace
- **Téma projektu: Festival**
    - Např. hudební, divadelní, filmový, multi-žánrový, kombinace koncertů a talků/workshopů apod.
    - Téma je povinné.
    - Festival je **fiktivní** (nepřebírat reálný festival 1:1).
- **Hlavní části:**
    - Kontextový balíček (specifikace v Markdown + data v XML)
    - Jednoduchý web (HTML, CSS)
    - Datový model a API
    - Dokumentace
- **Bodování**
    - Kontextový balíček: **ANO/NE**
    - Část HTML: **20 bodů**
    - Datový model a API: **20 bodů**
    - Dokumentace: **10 bodů**
    - Celkem: **50 bodů**
## Kontextový balíček *(20 bodů)*
- **Cíl:** 
	- Studenti vytvoří s pomocí AI propozice festivalu a vytvoří kompletní konzistentní datovou základnu v XML. Tento balíček se odevzdává na začátku (viz postup cvičení) a ve finále může být mírně upraven.
- Propozice festivalu `specification.md`
	- Stručná identita festivalu (název, ročník, lokalita, datumový rozsah).
	- Cílové publikum + charakter akce (žánry/témata).
	- Struktura webu (minimálně: úvod, program, účinkující, místa/praktické info).
- Výchozí datová základna `festival.xml` (minimální rozsah)
	- well-formed XML
	- Min. **3 dny**
	- Min. **2 místa** (venues)
	- Min. **60 účinkujících**
	- Min. **60 programových položek** (events)
	- Minimální datové entity (bez předepsaného modelu):
	    - festival,
	    - místa/scény (venues/stages),
	    - účinkující (performers),
	    - programové položky - vystoupení (events).
- Odevzdání
	- `specification.md`
	- `festival.xml`

##  Část HTML, CSS
- **Cíl:** 
	- Vytvořit jednoduchý, sémantický základ webu festivalu. Web bude statický. Jedná se o obsahový základ. V dalším semestru bude navázáno v předmětu Webdesign. Vše musí být validní.
- Povinné stránky (samostatné HTML soubory)
	- Úvodní stránka (landing / o festivalu)
	- Program
	- Účinkující (seznam plus detail)
	- Praktické informace (ubytování, místo, parkování, apod.)
- Povinné technické požadavky
	- **Sémantické HTML**
	    - smysluplná struktura (header/nav/main/section/article/footer),
	    - korektní hierarchie nadpisů,
	    - vhodné elementy pro seznamy a data (např. `time` u času programu).
	- **Metadata**
	    - `title` + `meta name="description"`,
	    - Open Graph minimum (title/description; image link na [Lorem Picsum](https://picsum.photos/)),
	    - Microdata, nebo JSON-LD pro festival a eventy.
	- **Napojení na API**
	    - Odpovídá (nemusí být 1:1) API endpointům
	- **Povinné elementy** (sémanticky správně)
	    - head, meta, title, header, section (min. 3x), article (min. 3x), aside, time, address, footer, p, ul/ol, li, a, img, h1, h2, h3
- CSS
	- Jen úplný baseline - barvy, fonty, pozadí, oddělení sekcí…
	- Bez frameworků a knihoven.
	- 1x externní soubor
	- min. 50 řádků, maximum 100
- Odevzdání
	- Složka `web`
	- `web/index.html` + další HTML soubory
	- `web/style.css`

### Datový model a API
- **Cíl:** 
	- XML obohatit o validaci přes XSD. Z XML dat vytvořit transformacemi JSON výstupy jako ukázku endpointů REST API. API popsané pomocí OpenAPI specifikace (3.1+).
- Datová základna
	- `data/festival.xml` - možné aktualizovat (odůvodnit do dokumentace)
	- `data/festival.xsd` – XSD pro validaci XML (včetně vlastních omezení typů alespoň na části dat: pattern/enum/rozsah apod.). Vlastní omezení označujte komentářem v kódu.
	- Transformace **XML → XSLT → JSON**:
	    - výstupy jsou JSON soubory, které odpovídají tomu, co vrací API,
	    - transformace musí být funkční - spustitelná.
- Specifikace REST API pomocí OpenAPI Specification
	- `data/openapi.yaml` – OpenAPI specifikace.
	- Sekce:`info`, `servers`, `paths`
	- u každého endpointu:
	    - parametry (path/query),
	    - odpovědi a HTTP kódy (min. 200, 400, 404),
	    - `application/json` a schémata odpovědí (inline nebo přes `$ref`).
	- Schémata musí odpovídat skutečným JSON výstupům.
- Minimální REST endpointy (GET-only) + JSON soubory (cíl transformace) + navázat na JSON schema
	- `GET /api/festival` (identita, vstupenky, popis, datumy, odkazy)
	- `GET /api/venues` (místa/scény)
	- `GET /api/venues/{id}`
	- `GET /api/performers` (účinkující)
	- `GET /api/performers/{id}`
	- `GET /api/events` (program)
	- `GET /api/events/{id}`
- Povinné query parametry (minimálně)
	- `/api/events` musí podporovat **alespoň 2 filtry**, např.:
	    - `day=YYYY-MM-DD`
	    - `venueId=...`
	    - `performerId=...`
	- Alespoň u jednoho list endpointu:
	    - stránkování `page`, `pageSize` (nebo ekvivalent)
- Odevzdání
	- Složka `data`
	- `data/festival.xml`
	- `data/festival.xsd`
	- 7x`API/transformation/*.xslt`
	- 7x`API/json/*.json`
	- 7x`API/json-schema/*.json`
	- `API/openapi.yaml`

## Dokumentace *(10 bodů)*
Nutné dodržet šablonu (ke stažení na Moodlu) - včetně formátování.
- Struktura:
	- Titulní strana
	- Obsah
	- Stručný popis festivalu
	- Seznam všech požadavků v tabulce
	    - odkaz na místo, místa řešení
	- Metodika projektu
	    - Postup tvorby
	    - Které nástroje byly využity, verze
	    - Ukázky hlavních promptů
	    - Kritické posouzení využití AI (vlastními slovy)
- Odevzdání
	- 1x `dokumentace.docx`

---

**Vše zabalené v jednom souboru** (zip, rar, 7z)
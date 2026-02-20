# DOKUMENTACE PROJEKTU

## Zápočtový projekt – Festival

- **Předmět:** (doplní student)
- **Název projektu:** Hudební Festival Aurora 2026
- **Autor:** (doplní student)
- **Skupina:** (doplní student)
- **Vyučující:** (doplní student)
- **Akademický rok:** 2025/2026
- **Datum odevzdání:** (doplní student)

---

## Obsah

1. Stručný popis festivalu
2. Seznam požadavků a místa řešení
3. Metodika projektu
4. Použité nástroje a verze
5. Ukázky hlavních promptů
6. Kritické posouzení využití AI

---

## 1. Stručný popis festivalu

Hudební Festival Aurora 2026 je fiktivní třídenní multi-žánrový festival konaný v Praze (Výstaviště Praha 7) v termínu 20. 8. 2026 až 22. 8. 2026. Koncepce kombinuje koncerty, talks a workshopy s cílem nabídnout návštěvníkům nejen hudební zážitek, ale i edukativní a komunitní přesah.

Datový model projektu zahrnuje čtyři hlavní entity: **festival**, **venues**, **performers**, **events**. Mezi entitami jsou definovány vazby přes identifikátory (`venueId`, `performerId`) a data jsou konzistentně používána napříč XML, JSON, OpenAPI i HTML částí projektu.

Projekt obsahuje:
- Kontextový balíček (`specification.md`, `festival.xml`),
- statický web (`web/*.html`, `web/style.css`),
- datový model + API artefakty (`data`, `API`),
- tuto dokumentaci v Markdownu pro převod do DOCX.

---

## 2. Seznam požadavků a místa řešení

| Oblast | Požadavek | Splnění | Místo řešení |
|---|---|---|---|
| Kontextový balíček | Propozice festivalu v Markdown | Ano | `specification.md` |
| Kontextový balíček | Výchozí XML data | Ano | `festival.xml`, `data/festival.xml` |
| Kontextový balíček | Well-formed XML | Ano | `data/festival.xml` |
| Kontextový balíček | Min. 3 dny | Ano (3) | `data/festival.xml` (atribut `day` u eventů) |
| Kontextový balíček | Min. 2 místa | Ano (2) | `data/festival.xml` (`venues/venue`) |
| Kontextový balíček | Min. 60 účinkujících | Ano (60) | `data/festival.xml` (`performers/performer`) |
| Kontextový balíček | Min. 60 programových položek | Ano (60) | `data/festival.xml` (`events/event`) |
| HTML/CSS | Úvodní stránka | Ano | `web/index.html` |
| HTML/CSS | Program | Ano | `web/program.html` |
| HTML/CSS | Účinkující (seznam + detail) | Ano | `web/performers.html`, `web/performer-detail.html` |
| HTML/CSS | Praktické informace | Ano | `web/practical-info.html` |
| HTML/CSS | Sémantické HTML prvky | Ano | všechny soubory v `web/*.html` |
| HTML/CSS | Metadata (`title`, `description`) | Ano | všechny soubory v `web/*.html` |
| HTML/CSS | Open Graph (`title`, `description`, `image`) | Ano | všechny soubory v `web/*.html` |
| HTML/CSS | Microdata/JSON-LD | Ano (JSON-LD) | `web/index.html`, `web/program.html` |
| HTML/CSS | Napojení na API | Ano | odkazy v `web/index.html`, `web/program.html`, `web/performers.html`, `web/performer-detail.html` |
| HTML/CSS | Externí CSS 50–100 řádků | Ano (92) | `web/style.css` |
| Data model/API | XML data v `data` | Ano | `data/festival.xml` |
| Data model/API | XSD validace + vlastní omezení | Ano | `data/festival.xsd` |
| Data model/API | XML → XSLT → JSON (7x) | Ano | `API/transformation/*.xslt`, `API/json/*.json` |
| Data model/API | OpenAPI 3.1+ | Ano | `API/openapi.yaml` |
| Data model/API | Endpointy GET (7x) | Ano | `API/openapi.yaml` |
| Data model/API | Query filtry `/api/events` (min. 2) | Ano (`day`, `venueId`, `performerId`) | `API/openapi.yaml` |
| Data model/API | Stránkování alespoň u jednoho list endpointu | Ano (`page`, `pageSize`) | `API/openapi.yaml` |
| Data model/API | JSON schema pro výstupy (7x) | Ano | `API/json-schema/*.json` |
| Dokumentace | Strukturovaná dokumentace | Ano | `dokumentace.md` |

---

## 3. Metodika projektu

### 3.1 Postup tvorby

1. **Návrh domény projektu**
   - Definice identity festivalu (název, termín, lokalita, ročník).
   - Návrh hlavních entit: festival, venues, performers, events.
   - Nastavení ID konvencí (`v1`, `p1`, `e1`, …).

2. **Vytvoření datové základny v XML**
   - Sestavení souboru `data/festival.xml` s minimálními rozsahy dat.
   - Uložení stejné verze i jako `festival.xml` pro kontextový balíček.

3. **Validace dat pomocí XSD**
   - Návrh `data/festival.xsd`.
   - Přidání vlastních omezení (pattern, enum, rozsahy).

4. **Transformace na API JSON výstupy**
   - Vytvoření 7 XSLT transformací v `API/transformation`.
   - Příprava 7 JSON endpointových výstupů v `API/json`.

5. **Návrh API smlouvy v OpenAPI**
   - Definice endpointů, parametrů, odpovědí (200/400/404), schémat.
   - Provázání s JSON strukturami.

6. **Statický web**
   - Implementace povinných HTML stránek.
   - Doplnění metadat, OG tagů, JSON-LD.
   - Základní stylování v externím CSS.

7. **Kontrola splnění požadavků**
   - Kontrola počtů entit a dní.
   - Kontrola počtů souborů pro API části.
   - Kontrola rozsahu CSS.

### 3.2 Důvody zvoleného postupu

Postup byl zvolen od datového modelu směrem k prezentační vrstvě, protože XML je primární zdroj pravdy. Tím se snížilo riziko nekonzistence mezi daty a API/web výstupy.

---

## 4. Použité nástroje a verze

- **Visual Studio Code** – vývojové prostředí
- **GitHub Copilot (GPT-5.3-Codex)** – asistence při návrhu a tvorbě
- **PowerShell (Windows)** – automatizace a kontrolní skripty
- **Python 3.14.2** – ověření dostupnosti runtime (doplňkové)
- **XML/XSD validace** – přes .NET XML parser v PowerShell skriptu

Poznámka: OpenAPI je připraveno ve verzi 3.1.0 v souboru `API/openapi.yaml`.

---

## 5. Ukázky hlavních promptů

### Prompt 1 – plánování

> „Naplánuj projekt podle této specifikace …“

Výstup: strukturovaný implementační plán s prioritizací artefaktů a kontrolami splnění.

### Prompt 2 – implementace od nuly

> „Start implementation“

Výstup: založení projektové struktury, vytvoření XML/XSD/API/Web artefaktů, průběžné kontroly.

### Prompt 3 – dokumentace

> „napiš to v markdownu ja to potom ručně převedu do wordu“

Výstup: tato dokumentace v Markdownu připravená pro převod do DOCX.

---

## 6. Kritické posouzení využití AI

AI výrazně urychlila přípravu projektu v těchto oblastech:
- vytvoření konzistentní struktury souborů,
- generování velkých datových sad (60+ performerů, 60+ eventů),
- návrh OpenAPI a JSON schémat,
- příprava sémantických HTML základů.

Současně bylo nutné průběžně kontrolovat výstupy, zejména:
- formální správnost XML deklarace a kódování,
- konzistenci názvů souborů a odkazů mezi webem a API,
- shodu mezi OpenAPI schématy a reálnými JSON daty.

Závěr: AI je silný akcelerátor tvorby, ale bez odborné revize může vzniknout formálně funkční, avšak nekonzistentní řešení. Nejvyšší přidaná hodnota je při kombinaci AI návrhu a manuální validace krok za krokem.

---

## Příloha: Stav artefaktů k odevzdání

- Kontextový balíček: hotovo (`specification.md`, `festival.xml`)
- Web: hotovo (`web/*.html`, `web/style.css`)
- Data model + API: hotovo (`data/*`, `API/*`)
- Dokumentace: připravena v Markdownu (`dokumentace.md`), převod do `dokumentace.docx` provede student ručně dle Moodle šablony


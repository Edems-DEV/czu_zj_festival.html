# Hudební Festival Aurora 2026 – Propozice

## Identita festivalu
- **Název:** Hudební Festival Aurora
- **Ročník:** 1
- **Lokalita:** Praha, Výstaviště Praha 7
- **Datum:** 20. 8. 2026 – 22. 8. 2026

## Cílové publikum a charakter akce
Festival je určen pro publikum 18–45 let, které hledá kombinaci koncertů, inspirativních talků a praktických workshopů. Dramaturgie kombinuje žánry indie, elektronika, rock, jazz, hip-hop a world music.

## Struktura webu
1. **Úvod** (`web/index.html`) – základní informace, identita, termín, CTA, odkazy na API.
2. **Program** (`web/program.html`) – seznam programových položek s datem, časem, scénou a účinkujícím.
3. **Účinkující** (`web/performers.html`, `web/performer-detail.html`) – seznam interpretů a detail interpreta.
4. **Praktické informace** (`web/practical-info.html`) – doprava, ubytování, parkování, kontakty.

## Datový rozsah a konzistence
- Minimálně 3 festivalové dny
- Minimálně 2 místa/scény
- Minimálně 60 účinkujících
- Minimálně 60 programových položek
- Všechny vazby jsou řešeny přes ID (`venueId`, `performerId`, `eventId`).

## Vazba web ↔ API
Web obsahově odpovídá endpointům:
- `/api/festival`
- `/api/venues`, `/api/venues/{id}`
- `/api/performers`, `/api/performers/{id}`
- `/api/events`, `/api/events/{id}`

`/api/events` podporuje filtry `day`, `venueId`, `performerId` a stránkování `page`, `pageSize`.

---
name: gsap-set-position-and-dense-content
description: Falle tl.set() ohne Position landet am Timeline-Ende (blendet Elemente NACH dem Einblenden wieder aus) + Sebastian will dichte, inhaltsvolle B-Rolls ohne leere Platzhalter-Boxen. Tag 169.
metadata:
  type: feedback
---

# Zwei harte Lessons (Tag 169, Claude-Security-Plugin-Set)

## 1. ⚠️ ÜBERHOLT seit Tag 173 — `tl.set` gar nicht mehr benutzen
> Der Lint wirft inzwischen `gsap_timeline_set_initial_hide` auf JEDES `tl.set(...)` am Timeline-Anfang. Startzustände gehören per `gsap.set(...)` VOR die Timeline — siehe [[hyperframes-lint-gsap-set-and-loops]]. Der Abschnitt unten bleibt als Erklärung, warum ein verirrter Set gefährlich ist.

### Historisch: `tl.set(el,{opacity:0})` OHNE Positions-Parameter = Bug
**Regel:** Ein `tl.set(...)` ohne dritten Positions-Parameter wird ans **ENDE** der Timeline gehängt (Standard-Position = aktuelle Timeline-Dauer), NICHT an Position 0. Wenn der Set als Startzustand gedacht ist (`opacity:0`, `scaleX:0`) aber im Code NACH langen Tweens (Scans, Counter) steht, landet er z.B. bei 3.6s und blendet die Elemente WIEDER AUS, nachdem die `fromTo`/`from`-Tweens sie schon eingeblendet haben. Ergebnis: leeres Panel im End-Frame (Tag 169 Comp 06: alle 5 Fund-Einträge unsichtbar, obwohl korrekt animiert).

**Why:** Kostete einen kompletten Re-Render-Zyklus + Diagnose. Der Lint fängt das NICHT (Timeline ist technisch valid), nur der Augencheck des End-Frames zeigt es.

**How to apply:** Jeder Initial-State-`set` bekommt explizit `,0`: `tl.set(el,{opacity:0},0)`. Noch besser: den Set ganz weglassen und den Startzustand im `fromTo({opacity:0},{...})` mitgeben (dann gibt es keinen verirrten Set). Nach dem Bauen `grep "tl.set(" *.html | grep opacity|scale|x:|y:` und prüfen, dass jeder visuelle Init-Set ein `,0` hat. transformOrigin-only-Sets sind egal.

## 2. Dichte, inhaltsvolle B-Rolls — KEINE leeren Platzhalter-Boxen
**Regel:** Sebastian gefeiert/gefordert (Tag 169, wörtlich): "viel zu sehen, visualisieren so gut es geht was ich sage, ich will NICHT dass du in einer Box kleine leere Boxen packst, sondern richtig gutes inhaltsvolles visuell dargestelltes B-Roll." Also: **echter Inhalt statt `.bar`-Grau-Platzhalter.**

**How to apply pro Beat:**
- Code-Panels → ECHTER verwundbarer Code (`db.query("SELECT * FROM users WHERE id="+id)` mit roter wavy-underline) statt grauer Balken.
- Fund-/Listen → echte Namen mit Severity + `file:line` (SQL Injection · api/users.js:13 · HIGH).
- Agenten → benannte Rollen (Architektur mappen, Threat-Model bauen, Lücken jagen, Cross-File-Analyse, Funde verifizieren).
- Terminal → echter Befehl + echtes Menü (`/claude-security` → Scan codebase / Scan changes / Suggest patches).
- Diff/Fix → echter Patch-Hunk mit Kontextzeilen + `- rote` / `+ grüne` Zeile (parameterisierte Query).
- „Riesige Software" → Code-Minimap aus hunderten Zellen, rote Vulns spaltenweise aufleuchtend.
- **Karten auf Inhaltshöhe schrumpfen** (oder mit echtem Inhalt füllen): eine 660px-Karte mit 380px Inhalt = genau der Leerraum, den er hasst. Layout-Check `container_overflow` warnt beim Gegenteil (Inhalt zu hoch) → Höhe minimal anpassen.

Set als Referenz für dichten Code-/Security-Stil: `tag169-claude-security-plugin-broll` (Theme 1, GrillMe-Benchmark). Echte Fakten immer recherchieren (Plugin `/claude-security`, Multi-Agent, doppelte Verifikation, 3-Kriterien-Patch-Gate).

---
name: hyperframes-lint-gsap-set-and-loops
description: Lint-Regel gsap_timeline_set_initial_hide (tl.set am Timeline-Start ist jetzt verboten -> gsap.set), Linter kann Schleifen nicht auflösen (Timings literal ausrollen), rausfallende Elemente = leerer End-Frame. Tag 173.
metadata:
  type: reference
---

# HyperFrames-Lint: gsap.set statt tl.set + keine Schleifen (Tag 173)

## 1. ⚠️ `tl.set(el,{opacity:0},0)` ist jetzt eine Lint-WARNUNG
Neue Regel `gsap_timeline_set_initial_hide`: "A zero-duration set at 0 does not render while the playhead sits exactly at 0, so frame 0 shows the un-hidden state."

**Das ersetzt die alte Tag-169-Regel** (dort war `tl.set(...,0)` noch die Lösung gegen den Set-am-Timeline-Ende-Bug). Neuer verbindlicher Weg: **alle Startzustände per `gsap.set(...)` DIREKT nach `window.__timelines = ...` und VOR `const tl = gsap.timeline(...)`** — außerhalb der Timeline, sofort wirksam. Damit ist auch der alte Positions-Bug erledigt (kein `tl.set` mehr im Spiel).

```js
window.__timelines = window.__timelines || {};
gsap.set(['#a1','#b1'],{opacity:0,y:16});
gsap.set('#fill',{scaleY:0});
const tl = gsap.timeline({ paused: true });
```
Rückwärts-Seek funktioniert weiterhin, weil die Tween-Startwerte beim ersten Render aufgezeichnet werden.

## 2. ⚠️ Der Linter wertet Schleifen NICHT aus → Timings literal ausschreiben
`for`/`forEach` mit berechneten Positionen (`t0[i]`, `t + 0.5`, `0.56 + i*0.17`) meldet der Linter als `overlapping_gsap_tweens`, weil er die Positionen statisch nicht auflösen kann und alle Iterationen auf dieselbe Zeit legt. **Jede Timeline-Zeile mit literalem Zahlenwert ausschreiben.** Auch Proxy-Objekte für Typewriter (`const o={i:0}` in der Schleife) betrifft das → eigene Variablen q1..q5 pro Zeile.

Gilt auch für geteilte Elemente: ein einziger `#plus`-Chip, der pro Runde neu einfliegt, wirft Overlaps → **pro Runde ein eigenes Element** (`#plus1/2/3`).

Echte Overlaps trotzdem prüfen: zwei Tweens auf dasselbe Property brauchen **mindestens ~0.1 s Abstand**, ein Ende-auf-Anfang (`…1.90` / `1.90…`) wird noch gemeldet.

## 3. Rausfallende Elemente hinterlassen einen leeren End-Frame
Metapher "Schmeichelei fällt aus dem Chat" sah in der Timeline gut aus, aber Frame 145 zeigte ein halbleeres Fenster (nur noch die User-Bubbles) — genau der Leerraum, den Sebastian hasst. **Besser entwerten statt entfernen:** Strike-Linie durchziehen, Text + Avatar auf `opacity:.34` dimmen, ein volles `ENTFERNT`-Tag dazu ploppen. Fläche bleibt gefüllt, Aussage ist dieselbe.

Wichtig: das Dimmen gehört auf **Text-Span + Avatar**, nicht auf den Bubble-Container — sonst dimmt das Tag mit (Opazität multipliziert sich über die Eltern). Dafür den Bubble-Text in ein eigenes `<span class="tb">` wrappen. Danach meldet der Check `text_occluded #tb1 inside #st1` (Strike über Text) → `data-layout-allow-occlusion` auf das **verdeckte** `#tb`-Element.

## 4. Hängende Elemente an rotierenden Eltern
Waagschalen als Kinder eines rotierenden Balkens (`.hang` unter `#beam`) werfen `escaped_container` → `data-layout-allow-overflow` an die Hänger. Rotation selbst: Balken rotieren, Karten mit exakt gegenläufigem `rotation`-Tween (gleiche Zeit + Ease) horizontal halten.

## 5. Scroll-Container: das bewegte Innere aus der Layoutprüfung nehmen (Tag 174)
Ein per `y`-Tween gescrollter Inhalt in einem `overflow:hidden`-Fenster (Chat-Verlauf, Trefferliste, Zeitachse) erzeugt beim Check eine **Lawine von `content_overlap` / `text_occluded`-Errors**: der Checker rechnet die Boxen an ihrer verschobenen Position, ignoriert aber das Clipping — Bubbles "überlappen" dann den Kicker oder die Fensterleiste. `data-layout-allow-overflow` reicht NICHT. Lösung: **`data-layout-ignore` auf das bewegte Innen-Element** (`.roll`, `.res`, `.rail`), der clippende Container bleibt geprüft. Dafür den Inhalt im End-Frame per Auge kontrollieren.

Dazu: Inhalt muss **deutlich höher sein als der Container** (Container + Scrollweg), sonst scrollt man in die Leere. Und der Payoff-Balken gehört **unter** ein scrollendes Fenster (Fensterhöhe auf 546 statt 596 kürzen), sonst liegt er mitten im Verlauf.

## 6. Wander-Metaphern: die Ausgangsseite darf nicht leer zurückbleiben
Beat "geteilte Chats wandern von PRIVAT nach ÖFFENTLICH": wenn ALLE Karten rüberwandern, ist die linke Bühnenhälfte im End-Frame leer. Fix: die Ausgangsseite behält Elemente, die bewusst bleiben (2 nie geteilte Chats "bleibt privat") — das schärft die Aussage sogar (nur die geteilten sind draußen) und hält beide Hälften gefüllt.

## 7. "Zeig den Klickweg in der App" — UI-Walkthrough-Beat (Tag 174)
Sebastian fragt regelmäßig nach einem **hochrealistischen Nachbau des Klickwegs** ("erst im Chat, dann aufs Profilbild, dann Settings"). Bewährtes Rezept, 2 Beats à 5s:
1. **App-Fenster** (Traffic-Lights, Sidebar mit „Neuer Chat" + Suchzeile + ZULETZT-Chatliste + Account-Zeile unten links, Chatbereich mit echten Nachrichten + Eingabefeld) → Cursor fährt nach unten links, Hover-Highlight auf der Account-Zeile, Klick-Ring, **Profil-Popup klappt nach oben auf** (Name + Beispiel-Mail, Einstellungen / Hilfe / Abmelden) → Cursor hoch, zweiter Klick → Settings-Fenster fährt auf.
2. **Settings-Fenster** (Kategorien: Profil, Darstellung, Konto, Datenschutz, Datenkontrollen, Verbindungen) → Klick auf die Kategorie, Content-Crossfade, Klick auf den Button im Zielabschnitt → Overlay-Popup mit der Liste.

Regeln dafür: **Menüpunkte vorher per Support-Doku verifizieren** (support.claude.com / privacy.claude.com) — bei den geteilten Chats stimmte Sebastians Wortlaut exakt: Privacy → „Shared links" → Button **Verwalten** → Pop-up mit den geteilten Chats + Unshare. Nie echte Mail/echten Namen zeigen (Beispielperson nutzen). Cursor = gezeichneter Pfeil, Bewegung nur per x/y, Klick = `scale .86` yoyo + Ring `fromTo(opacity .9/scale .3 → opacity 0/scale 1)` mit x/y auf dem Klickpunkt. **Jedes vom Menü/Modal verdeckte App-Element braucht `data-layout-allow-occlusion`** (Sidebar-Items, Suchzeile, Chat-Bubbles, Eingabefeld) — sonst hagelt es `text_occluded`-Errors. Und das aufgehende Settings-Fenster mit **echtem Inhalt** füllen, nie mit grauen Platzhalter-Balken.

Set als Referenz: `tag173-sycophancy-prompt-broll` (Chat-Replicas, Waage, Settings-Replica) und `tag174-geteilte-chats-broll` (Scan-Fund-Tags, Browser-Scroll, Suchergebnisse, Settings-Liste mit Löschen, Schloss).

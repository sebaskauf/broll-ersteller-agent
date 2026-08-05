---
name: website-recordings-grid-stage
description: Neuer Beat-Typ ab 26.07. — Sebastians eigene Website-Screen-Recordings auf einer Raster-Bühne (weiß + Coral als Tiefenfarbe) mit Browser-Replica und Detail-Zoom. Set tag172.
metadata:
  type: reference
---

# Website-Recordings auf der Coral-Raster-Bühne (Tag 172, 26.07.2026)

## Die alte Regel ist überholt
Im Agent-File stand jahrelang „⛔ Screenshots/Website-Recordings". **Das gilt nicht mehr für Tool-/Website-Videos.** Sebastian hat als Referenz ein Reel von @felixfbravo geschickt („These 5 websites completely changed how I…") und explizit gesagt: er nimmt die Websites selbst auf, ich soll nur Logos beschaffen und verpacken. Bei Videos über konkrete Tools/Websites ist echtes Recording **besser** als gebaute Metapher.

**Bleibt gültig:** Für abstrakte Themen („so denkt Claude", „Kontext-Fenster läuft über") weiter gebaute Metaphern — da gibt es nichts zu recorden.

## Das Bühnen-Rezept (von Sebastian gewünscht: „weiß als Color, orange als Tiefenfarbe")
- BG `#FAF9F5`
- Feinraster 96px, **gestrichelt** als SVG-`background-image` (`stroke-dasharray='10 10'`, `#DA7756`, opacity .34). ⚠️ NICHT mit `repeating-linear-gradient` + Mask bauen — das sieht aus wie Textil-Rauschen, nicht wie ein Raster (erster Versuch, verworfen).
- Major-Raster 384px, durchgezogen `#B85939` opacity .30, **plus kleine Plus-Kreuze an den Kreuzungen** (opacity .72) — das macht den CAD-/Blueprint-Look.
- `.warm`: drei gestapelte Radial-Gradienten (Mitte, unten, oben) in `rgba(218,119,86,.30)` = die Tiefenfarbe. Pulst am Ende yoyo für Leben bis 4,9s.
- `.glow`: radialer Coral-Halo direkt hinter der Karte, `filter:blur(22px)`.
- Karten-Schatten coral getönt: `0 54px 96px -34px rgba(184,89,57,.50)`.

## Layout (1920×1080)
Kicker top 74 → Logo-Badge (92px hoch, Breite variabel!) + Name 46/800 + Subline 23 → Browser-Replica x380 y258 1160×698 (Chrome 46px + Screen 1160×652) → Fußzeile bottom 44: zwei helle Chips (★-Counter, Lizenz) + dunkle Install-Pill mit Spark.
- Badge-Breite **variabel** halten: Wortmarken (anime.js 580×118) brauchen ~214px, quadratische Icons 92px. `nmx = 380 + badgeW + 30`.
- Badge `z-index:3`, Name/Sub `z-index:2` → der Name kommt beim Entrance hinter der Badge hervor statt darüber zu rutschen.
- Domain gehört in die **Adressleiste** des Replicas (mit gezeichnetem Schloss), nicht in eine Foot-Pill.

## Detail-Zoom (der Kern des Referenz-Formats)
Sebastian will „die detaillierten kleinen Zooms auf den relevanten Inhalt". Lösung:
```html
<div class="screen"><div class="zoom" id="zoom" data-layout-allow-overflow><video …></video></div></div>
```
`tl.fromTo('#zoom',{scale:1},{scale:1.26,duration:2.95,ease:'power1.inOut',transformOrigin:'56% 48%'},2.00)`
- Erst ab 2,0s zoomen → erste Hälfte Überblick, zweite Hälfte Detail. Dramaturgisch deutlich besser als durchgehender Zoom.
- `transform-origin` **pro Beat** auf den relevanten Bildbereich legen.
- Memory-Regel „nur den Wrapper animieren, nie das video-Element" bleibt: der `.zoom`-Div ist der Wrapper, das `<video>` bleibt unangetastet.
- **Schärfe-Rechnung vorher machen:** Clip auf 1440×810 backen, Screen 1160 breit → bei Zoom 1,26 ist man bei ~1462px aus 1440px Quelle, also praktisch 1:1. Über 1,3 wird es weich.
- Zusätzlich `.win` selbst nur ganz leicht (1,05) pushen = Parallax. Achtung Falle 5: Push-in erst NACH dem Entrance-Tween starten (Entrance endet ~1,21s → Push-in ab 1,25s), sonst `overlapping_gsap_tweens`.

## Clips auswählen: objektiv + visuell kombinieren
Bei einem 3-Minuten-Recording nicht raten. Ablauf, der funktioniert hat:
1. Kontaktblätter 0,5fps über das ganze Video → Segmentgrenzen pro Tool.
2. **Bewegungsanalyse**: `ffmpeg -vf "fps=10,select='gte(scene,0)',metadata=print:file=scene.txt"`, dann in Python 5s-Fenster bewerten: hoher Mittelwert = Bewegung, aber `max(w) > 0.30` verwerfen = harter Cut/Sprung im Fenster. Liefert eine Rangliste cut-freier, bewegter Fenster.
3. Top-Kandidaten als 6-Frame-Streifen (`fps=1.2` + `tile=6x1`) visuell gegenprüfen — die Bewegungsmetrik allein belohnt auch Scroll-Rucke.
4. ⚠️ **Immer Start- UND Endframe jedes gebackenen Clips prüfen** (`select='eq(n,0)+eq(n,74)+eq(n,149)'`). Zwei von fünf Clips lagen daneben: einer erwischte am Ende einen Szenenwechsel, einer hatte am Anfang noch die Google-Suchergebnisseite. Übergänge danach per 0,2s-Raster exakt einmessen.
5. Google-Suchen, Doku-Fließtext und Terminal-Passagen taugen nicht — zu textlastig.

## Logos beschaffen (Subagent-Auftrag, hat gut funktioniert)
Reihenfolge: `/favicon.svg` → `/logo.svg` → Inline-SVG aus der Startseiten-HTML → GitHub-Raw → Wikimedia. **Jede Datei mit `file` prüfen** — 404-Seiten kommen als 44KB HTML zurück und sehen wie Treffer aus.
- Logos danach **visuell verifizieren**: Vorschau-HTML mit allen Logos auf hell UND dunkel bauen, per Playwright screenshotten, anschauen. `~/.skaile/scripts/claude-screenrec/node_modules/playwright` ist da.
- Weiße Logos (anime.js) sind auf Cream unsichtbar → dunkle Badge nutzen statt umzufärben.
- SVGs mit `@media (prefers-color-scheme)`-`<style>` (KokonutUI): `<style>`-Block rausschneiden, Fills per eigenem CSS fest setzen.
- SVGs mit `currentColor` (Bklit): `color:` auf dem Container setzen.
- `width`/`height`-Attribute im SVG überschreiben die CSS-Größe → per CSS-Klasse (`height:Xpx;width:auto`) erzwingen.

## Zahlen
GitHub-Stars/Lizenz **selbst per API gegenprüfen**, auch wenn ein Subagent sie geliefert hat (`api.github.com/repos/<owner>/<repo>`). Bei shadcn/ui waren es zwischen Recherche und Render 2 Stars mehr — on-screen muss die Zahl stimmen.

Set: `~/Documents/Projects/tag172-5-websites-broll/` (Generator-Script-Ansatz: fünf fast identische Beats aus einem Python-Template erzeugt, das hält das Set konsistent und Änderungen sind ein Sed weit).

## Motion Blur in HyperFrames (funktioniert, render-verifiziert)
Chrome rendert keinen nativen Motion Blur. Lösung ohne Post-Processing: **drei deckungsgleiche Ebenen** desselben Inhalts, per SVG-Filter unterschiedlich stark horizontal verwischt, dazwischen wird per **Opacity** gecrossfadet — Opacity ist lint-sicher, animierte `filter`-Werte wären es nicht.
```html
<svg width="0" height="0" style="position:absolute" data-layout-ignore>
  <filter id="mb"  x="-30%" y="-10%" width="160%" height="120%"><feGaussianBlur stdDeviation="18 0"/></filter>
  <filter id="mb2" x="-20%" y="-8%"  width="140%" height="116%"><feGaussianBlur stdDeviation="7 0"/></filter>
</svg>
<div class="track" id="trkA" style="filter:url(#mb)"  data-layout-allow-overlap data-layout-allow-overflow>…</div>
<div class="track" id="trkB" style="filter:url(#mb2)" data-layout-allow-overlap data-layout-allow-overflow>…</div>
<div class="track" id="trkC"                          data-layout-allow-overlap data-layout-allow-overflow>…</div>
```
- `stdDeviation="18 0"` = nur horizontal verwischen. Das ist der Unterschied zwischen echtem Smear und billigem Weichzeichner. Über 20 wird der Inhalt unkenntlich.
- Alle drei Ebenen mit demselben `x`-Tween fahren (`power4.out`), Crossfades bei ~50% und ~75% der Tween-Dauer.
- Filter-`<svg>` und die Ebenen brauchen `data-layout-ignore` bzw. `allow-overlap`+`allow-overflow`.
- Weiche Seitenmaske auf dem Bühnen-Container (`mask-image:linear-gradient(90deg,transparent 0,#000 9%,#000 91%,transparent)`), sonst schneiden die Karten hart an der Bildkante ab.
- ⚠️ Beim Einrasten sind auch die **Nachbarkarten** links und rechts sichtbar. Die mittleren N Karten als `.keep`, den Rest als `.edge` markieren und `.edge` beim Stopp ausblenden.

## Viele Logos in einer Comp: `<symbol>` + `<use>`
Logos NICHT mehrfach als vollständige SVGs einbetten. Das wirft `composition_file_too_large` (Lint-**Warning**, bricht das 0/0-Gate) und dupliziert Gradient-IDs (Falle 8).
Stattdessen ein `<defs>`-Block mit `<symbol id="sym-<key>" viewBox="…">` und pro Verwendung `<svg viewBox="…"><use href="#sym-<key>"/></svg>`.
⚠️ **CSS greift nicht durch die `<use>`-Shadow-Grenze.** Alle Fills vorher hart ins Symbol-Markup schreiben (`class="theme-primary"` → `fill="#0C0C0C"`, `currentColor` → `#141413`, fehlende Fills ergänzen), sonst rendern die Logos schwarz oder unsichtbar.

## Nummern-Beat (Sebastians „große Eins und darunter das Logo")
Große Ziffer in **Newsreader 600, 400px** mit einem **Coral-Zwilling dahinter**, der beim Entrance nach `x:17,y:15` wegdriftet = Offset-Print-Look. Dazu gestrichelter Coral-Ring (rotiert langsam bis zum Ende), Coral-Rule als Trenner, darunter Logo-Badge + Name als zentrierte Flex-Zeile, unten Domain-Pill.
- Zentrieren **nie** per `left:50%;transform:translateX(-50%)` wenn GSAP das Element skaliert (Falle 12) → `left:0;right:0` + `text-align:center` bzw. `display:flex;justify-content:center`.
- Beide Ziffern brauchen `data-layout-allow-overlap`, die hintere zusätzlich `data-layout-allow-occlusion`.

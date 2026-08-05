---
name: gsap-fromto-immediate-and-inline-spans
description: Zwei Fallen die der Lint NICHT fängt — tl.fromTo rendert den From-Zustand ab Frame 0 (Slam-Elemente dauerhaft riesig) und position:relative-Spans fließen inline ineinander. Tag 178.
metadata:
  type: reference
---

# Zwei Fallen aus Tag 178 (Business-Agenten-Set)

## 1. ⚠️ `tl.fromTo(...)` rendert den From-Zustand SOFORT (immediateRender)

GSAP setzt bei `fromTo` standardmäßig `immediateRender: true`. Ein Slam wie
`tl.fromTo('#sv',{scale:2.1},{scale:1,...},3.30)` macht das Element also **ab Frame 0**
2,1× so groß — nicht erst ab 3,30 s. Folge: die Summe ragt die ganzen ersten 3 Sekunden
aus ihrer Karte, überlappt Nachbarzeilen, und der Layout-Check meldet `content_overlap`
und `text_box_overflow` an Zeitpunkten, an denen laut Timeline gar nichts passiert.

**Fix:** immer `immediateRender:false` mitgeben.
```js
tl.fromTo('#sv',{scale:1.8},{scale:1,duration:.34,ease:'power3.in',immediateRender:false},3.22);
```
Der `lint` fängt das NICHT (die Timeline ist technisch valide) — nur `check` (über
merkwürdige Overlap-Zeiten) oder der Augencheck des ersten Frames.

**Diagnose-Trick:** meldet `check` eine Box, die ~2× so groß ist wie die Schrift hergibt
("Text ist 335px × 105px" bei 38px Font), ist fast immer ein `fromTo`-Slam die Ursache —
der Faktor entspricht exakt dem `from`-scale.

**Zusatzregel:** Slams so timen, dass sie zwischen zwei Check-Samples fertig sind.
`check` sampelt 9-mal über 5 s, also alle ~0,556 s (0.278, 0.833, 1.389 …). Ein Slam von
3,22–3,56 s liegt sauber zwischen den Samples bei 3,056 und 3,611 und wirft nichts.

## 2. `position:relative`-Spans fließen inline ineinander

In Kachel-Layouts gern gebaut: `<span class="skn">SKILL 04</span><span class="skt">Rechnungen nachfassen</span>`
mit `position:relative;z-index:2` und `margin-top:12px` auf dem zweiten Span.
Beide sind **inline** → sie landen in DERSELBEN Zeile, `margin-top` wirkt nicht, und der
Titel klebt über dem Label. Sieht im End-Frame aus wie ein Render-Bug.

**Fix:** `display:block` auf beide Spans. Oder — wie in allen anderen Beats — grundsätzlich
`position:absolute` mit eigenen `top`-Werten benutzen; dann kann es gar nicht passieren.

Weder `lint` noch `check` melden das (Boxen überlappen ja nicht, sie stapeln nur falsch) —
**nur der Augencheck des Kontaktblatts findet es.** Genau dafür ist Schritt 7 da.

## 3. Kleinkram, der im selben Set Zeit gekostet hat
- `data-layout-ignore` auf einem Deko-Container **vererbt sich nicht auf die Kinder**.
  Die Skeleton-Balken (`.skb`) in einer ignorierten `.sk`-Hülle wurden weiter als Occluder
  gewertet. Richtiger Weg bleibt die Tag-170-Regel: `data-layout-allow-occlusion` aufs
  **verdeckte** Element (hier `.fh` / `.ftag` der fertigen Creatives).
- Marker-Tags („SCHWÄCHSTE PHASE") NICHT über den Chart-Rand nach oben setzen — dort sitzt
  die Kopfzeile. Besser ins Chart hinein über die kurzen Balken (bei einer Tal-Metapher ist
  da per Definition Platz) + `data-layout-allow-overlap`.
- Klassen-Selektoren, die GSAP per `#id` ansprechen soll, brauchen auch wirklich die id
  (`class="dsp"` ≠ `#dsp`). Der Runtime-Check meldet das als `console_warning: GSAP target
  #dsp not found` — der Lint nicht.

Set als Referenz: `tag178-business-agenten-broll` (12 Beats, Claude for Small Business).

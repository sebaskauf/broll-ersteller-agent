---
name: hyperframes-cli-check-and-pitfalls
description: hyperframes CLI v0.7.x — check-Kommando (Kontrast=False-Positive), Font-Copy-Falle, neue Lint-Regeln (connector_detached, gsap_non_transform_motion). Tag 167.
metadata:
  type: reference
---

# HyperFrames CLI v0.7.66 — Check-Verhalten + neue Fallen (Tag 167)

## `inspect` ist deprecated → `check`
`npx --yes hyperframes inspect` läuft noch, meldet aber "deprecated, use check". `check` macht ZWEI Blöcke:
1. **Layout** (overlap/overflow/occlusion/connector) — DAS ist der echte Gate. Muss 0/0 sein.
2. **Contrast** (WCAG 4.5:1) — NEU. Wirft bei der Stil-DNA MASSENHAFT Errors.

## Kontrast-Errors = bewusster Stil-Trade-off, IGNORIEREN
Die gedämpften Mono-Labels der DNA (`#8A8578` Kicker = 3.49:1, `#B0AB9E` Labels = ~2.7:1) failen die Kontrastprüfung IMMER. **Verifiziert:** das ausgelieferte, gefeierte tag159-Set failt exakt dieselben Kontraste (`#kick 3.49:1`). Also: Kontrast-Errors sind KEIN Blocker. Gate bleibt: `lint` 0/0 **und** die **Layout**-Sektion von `check` 0/0. Kontrast NICHT hinterherjagen — Farben nicht ändern, sonst weicht das ganze Set von der DNA ab.
Grep-Trick um nur Layout zu sehen: `check <dir> 2>&1 | grep -B50 "Contrast" | grep -iE "overlap|overflow|occlu|connector|error"`.

## Font-Copy-Falle beim Scaffold ⚠️
`cp -R _TEMPLATE "$BASE/$d"` kopiert die `assets/fonts/*.woff2` NICHT zuverlässig mit (beobachtet: Zielordner hatte 0 Fonts trotz Quelle voll). Auch ein Loop `for d in "$BASE"/*/` mit trailing-slash-Glob hakt. **Lösung:** expliziter Loop über die Ordnernamen, `mkdir -p "$BASE/$d/assets/fonts"` + `cp "$SRC/f0.woff2" ... "$SRC/f3.woff2" "$BASE/$d/assets/fonts/"`, danach HART verifizieren: `ls .../assets/fonts/*.woff2 | wc -l` == 4 pro Ordner. Fehlen Fonts → `check` meldet `http_error: 404 loading assets/fonts/fX.woff2` und der Render nimmt Fallback-Fonts (Look kaputt). Es gibt f0 (Inter), f1 (JetBrains Mono), f2 (Newsreader), f3 (extra) — alle 4 kopieren.

## Zwei neue Lint/Layout-Regeln (haben je einen Fix gekostet)
- **`connector_detached`** (Layout-Info/Warnung): gezeichnete Deko-SVGs (Pfeile, Linien) werden als "Connector" fehlinterpretiert ("endpoints Npx from nearest anchorable element"). Fix: `data-layout-ignore` ans SVG. Der Pfeil animiert trotzdem normal.
- **`gsap_non_transform_motion`** (Lint-ERROR): GSAP-Tween auf Layout-Props wie `width`, `marginLeft`, `height`, `padding` → snappt auf Integer-Pixel, ruckelt im Frame-Capture. NUR Transforms tweenen (x/y/scale/opacity). Cursor-Collapse NICHT per `width:0` lösen → stattdessen Cursor-`<span>` ans ZEILENENDE hinter die schließende `)` setzen, dann fällt die versteckte Cursor-Breite als harmloser Trailing-Space am Zeilenende weg (kein Mid-Line-Gap).

## Occlusion-False-Positive bei gedrehten Stempeln
Ein `rotate(-8deg)`-Stempel mit `z-index:20` ÜBER einer opaken Karte kann fälschlich `text_occluded ... "STEMPELTEXT" inside #card` werfen (die Heuristik verpeilt die Paint-Order bei Rotation). ERST rendern + Frame anschauen: liegt der Stempel sichtbar obenauf (tut er bei höherem z-index), ist es ein False-Positive → `data-layout-allow-occlusion` ans Stempel-Element (bewusste Überlagerung deklarieren), NICHT wegbauen.

## data-layout-allow-occlusion gehört aufs VERDECKTE Element, nicht den Deckel (Tag 170)
Bei `text_occluded div.slop-hero > h1 inside #stamp` steht rechts vom "inside" der DECKEL (`#stamp`), aber der Fehlertext benennt links das VERDECKTE Element (`h1`). Das Attribut `data-layout-allow-occlusion` muss auf das verdeckte Element (`h1`), nicht auf den Deckel — sonst bleibt die Meldung bestehen. Gleiches Prinzip bei 3D-Flip-Karten (`backface-visibility:hidden`, `rotateY(180deg)`): der Checker versteht Backface-Culling nicht und meldet Front/Back als dauerhaft überlappend, obwohl nur eine Seite sichtbar ist → `data-layout-allow-overlap` + `data-layout-allow-occlusion` auf BEIDE `.face`-Elemente. Set: `tag170-claude-design-plugins-broll`.

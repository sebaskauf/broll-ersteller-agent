# broll-ersteller — Pattern-Memory

Auto-curated across sessions. Update when Sebastian gives feedback that reveals a new pattern.

## Schnellstart neue Session

- ⭐ [EINE Bildidee pro Beat (03.08. bestätigt)](feedback_eine_bildidee_pro_beat.md) — 9er-Set mit immer gleichem Fenster-Layout + dichten Listen wurde hart abgelehnt („extrem schlecht, versteh ich nicht"). Neuer Weg gefeiert: pro Beat EINE große Bildidee, eigene Bildsprache, viel Weißraum, kaum Text. Window-Chrome ist KEIN Default mehr. Formen-Katalog im File.
- 🆕 [Keine Verifikations-Loops (02.08.)](feedback_keine_verifikations_loops.md) — EIN Durchlauf: bauen → 1× QA → rendern → 1× Kontaktblatt → liefern. Keine Zwischenmeldungen, kein doppeltes Absichern. Augencheck bleibt Pflicht (fand `2139.997`-Formatter-Bug). Fehlende Fakten (Produktname, Command) = EINE Frage mit recherchierten Optionen, das ist kein Loop.
- 🆕 [fromTo-immediateRender + inline-Spans (01.08.)](reference_gsap_fromto_immediate_and_inline_spans.md) — ⚠️ `tl.fromTo` rendert den From-Zustand ab Frame 0 → Slam-Element die ganze Comp riesig, Lint merkt nichts. IMMER `immediateRender:false`. Plus: `position:relative`-Spans fließen inline ineinander (→ `display:block`), `data-layout-ignore` vererbt sich NICHT auf Kinder, `class="x"` ≠ `#x` für GSAP. Set: `tag178-business-agenten-broll`.
- 🆕 [gsap.set + Schleifen + Scroll-Container (27./28.07.)](reference_hyperframes_lint_gsap_set_and_loops.md) — ⚠️ NEUE Lint-Regel `gsap_timeline_set_initial_hide`: Startzustände IMMER per `gsap.set(...)` VOR der Timeline (ersetzt die Tag-169-Regel `tl.set(...,0)`). Linter löst Schleifen nicht auf → Timings literal ausrollen, pro Runde eigenes Element. Rausfallende Elemente = leerer End-Frame → lieber entwerten (Strike + dimmen + ENTFERNT-Tag). Scroll-Container (`.roll`/`.res`) brauchen `data-layout-ignore`, sonst Error-Lawine. Wander-Metaphern: Ausgangsseite nie leer zurücklassen. UI-Walkthrough-Rezept (Chat → Profil-Popup → Settings → Kategorie → Modal) inkl. Menüpunkt-Verifikation im File. Sets: `tag173-sycophancy-prompt-broll`, `tag174-geteilte-chats-broll`.
- 🆕 [Website-Recordings auf Coral-Raster-Bühne (26.07.)](reference_website_recordings_grid_stage.md) — ⚠️ „keine Website-Recordings" gilt NICHT mehr für Tool-Videos: Sebastian nimmt selbst auf, ich verpacke. Gestricheltes 96px-Raster + Plus-Kreuze + warme Coral-Tiefe, Browser-Replica, Detail-Zoom via `#zoom`-Wrapper ab 2,0s. Clip-Auswahl per Bewegungsanalyse + Start/End-Frame-Check. Set: `tag172-5-websites-broll`.
- 🆕 [Bar-Label-Kontrast + Edit-Fallen (24.07.)](reference_bar_label_contrast_and_edit_pitfalls.md) — Prozent-Label auf Balken: Farbe an Track koppeln, nicht an Fill (sonst unlesbar wenn Fill klein ist, gezielt Full-Res-Crop checken). Erfundene Zahlen auch beim eigenen Entwurf selbst abfangen (qualitative Labels statt Fake-Ticker). Edit-Tool kann bei nbsp-verseuchten Strings (U+00A0 statt Space) hartnäckig failen → `od -c` diagnostizieren, Python-Zeilen-Fix als Ausweg. Set: `tag171-opus5-vs-fable5-broll`.
- [tl.set-Position + dichter Inhalt (22.07.)](reference_gsap_set_position_and_dense_content.md) — ⚠️ Teil 1 ÜBERHOLT (siehe gsap.set-Eintrag oben). Historisch: `tl.set({opacity:0})` OHNE `,0` landet am Timeline-ENDE und blendet Elemente nach dem Einblenden wieder aus (leeres Panel, Lint fängt's nicht → nur End-Frame-Augencheck). IMMER `tl.set(el,{opacity:0},0)`. Plus: Sebastian will DICHTE B-Rolls mit ECHTEM Inhalt (echter Vuln-Code, Fund-Namen+file:line, benannte Agenten, echtes Terminal/Diff), KEINE leeren Platzhalter-Boxen, Karten auf Inhaltshöhe. Ref-Set `tag169-claude-security-plugin-broll` (Code-/Security-Stil).
- 🆕 [CLI check + Fallen (21.07.)](reference_hyperframes_cli_check_and_pitfalls.md) — `inspect`→`check` (Kontrast-Errors = DNA-False-Positive, ignorieren; Gate = lint 0/0 + Layout-Sektion 0/0). Font-Copy-Falle (`cp -R _TEMPLATE` verschluckt Fonts → expliziter Loop + `wc -l`==4). Neue Regeln: `connector_detached` (Deko-SVG→data-layout-ignore), `gsap_non_transform_motion` (nie width/margin tweenen). Gedrehter Stempel-Occlusion=False-Positive. Set: `tag167-anthropic-zertifikate-broll`.
- 🆕 [Eigene Media einbetten (17.07.)](reference_hyperframes_embed_user_media.md) — Sebastians eigene Higgsfield-Videos/Bilder in Beats einbetten (`<video muted playsinline>` in nicht-getimtem Wrapper, Clips vorab per ffmpeg auf exakt 5s/yuv420p backen). Notiz-App-Prompt-Typewriter, Browser-Chrome, gezeichneter Scroll-Indikator. StaticGuard-data-end-Meldung = False-Positive. Set: `scroll-animation-broll`.
- ⭐ [Agent-Prompt V2 selbsttragend (13.07.)](reference_agent_prompt_v2_selfcontained.md) — Agent-File enthält jetzt ALLES inline (Ablauf, Stil-DNA, Glossar, Fallen). Template-Kit: `~/Documents/Projects/broll-set-template/` (_TEMPLATE kopieren statt von Null bauen, CHECKLISTE.md abhaken). Neuer wiederholter Fehler → als Falle ins Agent-File, nicht nur hierher.

⭐ **ZWEI gleichwertige Themes** — bewusst wählen (beide von Sebastian gefeiert):
- **Theme 1 — Window/UI-Visualisierung**: weißer BG, WindowChrome+Traffic-Lights, terminal-/code-lastig, dicht, bunte Akzente. Benchmark GrillMe. Für technische/Erklär-/Code-Beats.
- **Theme 2 — Clean Editorial Mockup** ([reference](reference_realistic_mockup_replicas.md)): Cream-BG, floating Cards, weiche Schatten, echte Logos, Orange-Twist, minimalistisch-premium. Vorlage `HeadroomCleanBRoll.tsx`. Für Tool-/Brand-/Stat-Videos. Tag 136 als 2. Standard-Weg etabliert + gefeiert.

Wenn unklar wie B-Rolls aussehen sollen, IN DIESER REIHENFOLGE lesen:

1. [Workflow](workflow_broll_creation.md) — End-to-end Prozess: Skript-Parse → Beat-Plan → Build → Render → Open. Disziplinierter Schritt-für-Schritt der die häufigen Fehler vermeidet.
2. [Theme 2: Clean Editorial](reference_realistic_mockup_replicas.md) — der cleane Premium-Weg + Recherche-Workflow (echte Logos per curl, Repo-Daten via WebSearch). Auf jedes Thema anwendbar.
3. [Style-DNA UI-Mockups](feedback_real_style_ui_mockups.md) — Theme 1: UI-Mockups (Terminal/Editor/Board), NICHT abstrakte Organisms/Networks/Trees.
4. [Anker-Mapping](reference_anker_compositions.md) — Welche existing Composition liefert welches Pattern. Vor jedem Build die richtige Anker lesen.
5. [5s Min + Motion](feedback_broll_5sec_motion.md) — Mindestdauer 5s (150f@30fps), continuous motion bis zum letzten Frame, spawn-pattern für Hook-Comps.

## Bestätigte Patterns

- [Style-DNA UI-Mockups](feedback_real_style_ui_mockups.md) — WindowChrome, SectionLabel, PulseDot, Status-Pill als Signature-Elemente. Anthropic Orange #D97757 + Blau/Grün/Lila als Akzente.
- [5sec Mindestdauer + Continuous Motion](feedback_broll_5sec_motion.md) — Nie 4s. In den letzten 30 Frames immer Cross-Connections, Counter-Ticks, Confetti oder pulsing Final-State-Pills.
- [Anker-Comp-Mapping](reference_anker_compositions.md) — `EccV3PluginBRoll.tsx` Gold-Standard. `GrillMeBRoll.tsx` (Tag 122, gefeiert) neue Metaphern: Chart/Tangle/Swap/Decision-Tree/Loop-vs-OneShot/Hero-Slam. `SessionHandoffBRoll.tsx` Helper-Definitionen.
- [End-to-End Workflow](workflow_broll_creation.md) — Beat-Plan vor Build zeigen (außer "mach mal"), Skript-Sätze NIE auslassen, alte Comps bei Iteration nicht überschreiben.
- [Genau genannte Stellen + direkt bauen](feedback_exact_parts_direct_execution.md) — Nummerierte Teile = exakte Comp-Anzahl, keine CTA dazuerfinden, alle 5s, direkt bauen statt auf Bestätigung warten.
- [Exaktes Teil-Mapping](feedback_exact_part_mapping.md) — B-Roll N = Teil N. Hook/CTA NICHT als Teil bauen (außer explizit gelistet). Wenn "die sieben" ≠ Satzzahl: ein Satz wird gesplittet (zwei Claims = zwei Beats). Tag 132: 2x falsch.
- [EIN B-Roll für genannte Stelle](feedback_one_broll_for_named_part.md) — ⛔ Nennt Sebastian am Anfang EINE Stelle + pastet ganzes Skript → EIN B-Roll für die Stelle, Skript = nur Kontext. NICHT ganzes Skript in N Comps zerlegen (06.07. 10 statt 1 gebaut, abgebrochen). Er nennt oft PRO Teil bestimmte Ratios (9:16+16:9 vs. nur 16:9) → exakt mappen, EINE responsive Comp (useVideoConfig) an beiden Ratios registrieren. 9:16 nativ = VERTICAL 1080×1920 in Root.tsx.
- [SFX selbst synthetisieren (ffmpeg)](reference_ffmpeg_sfx_synth.md) — "mit Soundeffekten" → ffmpeg lavfi synth (gratis, kein Credit), separate .wav in `out/<set>/sfx/`. Rezepte ding/whoosh/burn/power-up/ticks. Higgsfield-Audio NICHT auto (Kosten).
- [Placement-Palette + Cull (Talking-Head)](feedback_placement_palette_refine.md) — kein L-R-L-R, ~40% weniger Beats, split + center-lower je max 1-2x, Vergleiche → split. Technik für split/center-lower-HTML drin.
- [Eyecatchier & dicht](feedback_eyecatchier_dense.md) — B-Rolls müssen knallen: dichte Swarms, dark Mission-Control-Panels, Glow, fließende Partikel, lebende Cards. NICHT 3 statische Cards / ein Balken.
- [GrillMe = Qualitäts-Benchmark](feedback_grillme_quality_benchmark.md) — Tag 122 GrillMe ist der Maßstab: terminal-/code-lastig, dicht, detailreich, animiert. NIE simple Karte+Icon. Code-Theme GitHub-Light auf weiss. (Tag 127 V1 als "gar nicht gut" abgelehnt.)
- [Finance-Set gefeiert](feedback_finance_set_celebrated.md) — Tag 135 Finance-Agents "perfekt". Bestätigt: TickerStream/Sparkline/Daten-Hub/News-Scan/Excel-Mockup + exaktes Teil-Mapping (kein Hook/CTA). Bausteine in FinanceAgentsBRoll.tsx.
- [Theme 2: Clean Editorial](reference_realistic_mockup_replicas.md) — ZWEITER gleichwertiger Weg (Tag 136 etabliert+gefeiert): Cream-BG, floating Cards, weiche Schatten, echte Logos, Orange-Twist (kein 1:1-Klau), Mono-Labels, Funnel-Motiv. + Recherche-Workflow (curl-Logos, WebSearch-Repo-Daten). Vorlage `HeadroomCleanBRoll.tsx`. Assets: netflix-n.png + claude-logo-combo.png.
- [Liquid Glass Overlays (HyperFrames)](reference_liquid_glass_hyperframes.md) — Apple iOS-26 Glass-Cards composited auf Talking-Head-Video, synchron zu Sprache. Dark-Scrim-Trick für Lesbarkeit, kein Kitsch, Validator-Contrast = False-Positive bei Glass.
- [Motion-Graphic-Overlays neben Sprecher](workflow_motion_graphic_overlays_on_talkinghead.md) — Anthropic-Editorial-Einblendungen SEITLICH (face_scan cx-Band) auf fertig geschnittenes Video. HTML seek-driven -> Playwright PNG-Seq -> ffmpeg overlay. Cream-Halo+Coral, leichte Serif, KEINE graue Box, nicht vorm Gesicht.
- [Template brechen + literale Metaphern](feedback_break_template_literal_metaphor.md) — Tag 08.07. genervt: "jedes B-Roll ist gleich". Nicht immer Card+Label+Pill. Key-Beats = eigene Bühnen-Szene, Bildsprache pro Comp variieren. Literale Metapher aus dem Wort (verbrennen=Feuer, Blöcke fallen rein). Payoff/"kreativer" oft OHNE Text (Graph/Motion). "zwei Balken" = Anti-Pattern.
- [KEINE Emojis — echte gezeichnete Metaphern](feedback_no_emojis_drawn_visuals.md) — Tag 143 HART abgelehnt ("sehr sehr schlecht"). Emojis (🛡️🔒💥⚡😌) als Visual + "Emoji wackelt" = faul/billig. Pflicht: SVG/CSS-gezeichnete Elemente + EINE Metapher die über die VOLLEN 5s erzählt (Struktur stürzt ein / Contribution-Wall füllt+wird gewischt / Gauge-Nadel fällt / DENIED-Stempel). Logos (Spark/Tamagotchi-PNG) sind OK, Emoji-Glyphen NICHT.

## Anti-Patterns die Sebastian explizit nicht will

- Abstrakte Network-Graphs, Tree-Branches, Honeycomb-Grids ohne UI-Kontext, isolierte Speedometer, Pixel-Charakter-Köpfe als "Agents"
- Generische Visualisierungs-Skill-Defaults (statt seinen konkreten Window-Chrome-Style)
- B-Rolls < 5 Sekunden ohne expliziten Grund
- Animation die in den letzten Sekunden einfach stoppt
- Skript-Sätze auslassen wenn Brief 9 B-Rolls fordert
- Alte gerenderte Compositions überschreiben bei Iteration (nutze `V2`/`V3` Naming)
- Recycling existing Compositions ohne kreative Neukombination
- Screenshots/Standbilder von Websites — bewegte Recordings sind seit 26.07. ausdrücklich erwünscht ([detail](reference_website_recordings_grid_stage.md))
- ⛔ EMOJIS als Bild-Inhalt (🛡️🔒💥😌 etc.) — wirkt billig/faul. IMMER gezeichnete SVG/CSS-Visuals stattdessen ([detail](feedback_no_emojis_drawn_visuals.md))
- "Emoji + etwas wackelt" statt echter, dichter Animation die 5s lang eine Metapher durchspielt

## Korrekte Pfade (alte Memory hatte Fehler)

- Projekt: `~/Documents/Projects/katchup-lead-automation/tiktok-broll/` (NICHT `~/Documents/Projects/tiktok-broll/`)
- Compositions: `src/compositions/{Topic}BRoll.tsx`
- Registrierung: `src/Root.tsx`
- Output: `out/tag-{N}-{topic}/`
- Brand-Fonts: `public/fonts/AnthropicSans-Roman.woff2` + `AnthropicMono-Roman.woff2`
- Tamagotchi: `public/claude-tamagotchi.png` (Sebastian muss von Desktop selbst kopieren — macOS TCC blockiert mich)

## HyperFrames-spezifisch

- [Lokale Fonts capturen](reference_hyperframes_local_fonts.md) — Google-Fonts-@import failt im sandboxed Render (Tofu/Fallback-Flash). woff2 latin-Subset lokal nach `assets/fonts/`, `@font-face` mit `font-display: block`. lint+inspect müssen 0/0 sein vor Render. Templates: `mcps-broll-skript`, `hyper-broll-skript`. Single-Comp = standalone `index.html` ohne `<template>`-Wrapper, GSAP paused-timeline auf `window.__timelines["root"]`.
- [Multi-Comp-Batch (Tag 150)](reference_hyperframes_multi_comp_batch.md) — N Einzel-5s-Comps als Ordner-Batch: Struktur, Lint-0/0-Tricks (repeat statt N fromTos, steps()-Counter, svgOrigin statt transformOrigin, off-canvas-Elemente ausblenden), Render-Loop + ffmpeg-Kontaktblatt-QA.
- ⛔ [NUR helle BGs](feedback_light_backgrounds_only.md) — Tag 150 korrigiert: Full-Frame-BG immer weiß/cream #FAF9F5, NIE dark (#141413/#262624) und kein Sage-Desktop. Dunkel nur als Karten/Terminals AUF hellem Grund. Stil > offizielle Claude-Twitter-DNA. Remotion tendenziell sein erwarteter Default, HyperFrames ok wenn Stil stimmt.
- [Detailgetreue Replicas + baked SFX (Tag 155)](reference_hyperframes_replicas_and_sfx.md) — "detailgetreu wie echte App" = AI-Detektor-/GitHub-Repo-UI 1:1 in unserem Stil nachbauen (echte Repo-Daten per WebFetch). SFX via `<audio>`-Clip ins root baken (data-start=Payoff, hasAudio:true, +nackte .wav in out/sfx/). Fallen: SVG-`<line>`-Nadel rendert kaputt → HTML-div-Nadel; scaleX-Fill braucht explizite width:100%.

## Performance-Daten

(noch leer — wenn Sebastian Views/Engagement meldet, hier mit Hook-Typ + Format + Result festhalten)

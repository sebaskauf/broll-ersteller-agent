# broll-ersteller — Pattern-Memory

Destillierte Produktions-Lektionen aus vielen echten B-Roll-Runden. **Vorrang-Regel: die `stil.md` deines Nutzers schlägt jede Stil-Angabe hier.** Die Topic-Files erwähnen teils "Sebastian" — das ist der Ersteller dieses Agenten; seine Stil-Entscheidungen sind Beispiele, seine Technik-Lektionen gelten für alle. Wenn DEIN Nutzer Feedback gibt, ergänzt du hier eigene Einträge.

## Schnellstart neue Session

- ⭐ [EINE Bildidee pro Beat](feedback_eine_bildidee_pro_beat.md) — pro Beat EINE große Bildidee, eigene Bildsprache, Weißraum, kaum Text. Window-Chrome ist KEIN Default. Formen-Katalog im File.
- [Keine Verifikations-Loops](feedback_keine_verifikations_loops.md) — EIN Durchlauf: bauen → 1× QA → rendern → 1× Kontaktblatt → liefern. Augencheck bleibt Pflicht. Fehlende Fakten = EINE Frage mit recherchierten Optionen.
- [fromTo-immediateRender + inline-Spans](reference_gsap_fromto_immediate_and_inline_spans.md) — ⚠️ `tl.fromTo` rendert den From-Zustand ab Frame 0 → IMMER `immediateRender:false`. Spans brauchen `display:block`, `data-layout-ignore` vererbt sich NICHT.
- [gsap.set + Schleifen + Scroll-Container](reference_hyperframes_lint_gsap_set_and_loops.md) — Startzustände IMMER per `gsap.set(...)` VOR der Timeline. Linter löst Schleifen nicht auf → Timings literal ausrollen. Rausfallende Elemente lieber entwerten (Strike + dimmen) statt Fläche leeren. UI-Walkthrough-Rezept im File.
- [Website-Recordings auf Raster-Bühne](reference_website_recordings_grid_stage.md) — vom Nutzer selbst aufgenommene Tool-Recordings verpacken: Raster-Bühne, Browser-Replica, Detail-Zoom. (Farben aus stil.md.)
- [Bar-Label-Kontrast + Edit-Fallen](reference_bar_label_contrast_and_edit_pitfalls.md) — Prozent-Label an Track koppeln, nicht an Fill. nbsp-Strings mit `od -c` diagnostizieren.
- [tl.set-Position + dichter Inhalt](reference_gsap_set_position_and_dense_content.md) — `tl.set({opacity:0})` OHNE `,0` landet am Timeline-ENDE. DICHTE B-Rolls mit ECHTEM Inhalt statt leerer Platzhalter-Boxen.
- [CLI check + Fallen](reference_hyperframes_cli_check_and_pitfalls.md) — Gate = lint 0/0 + Layout-Sektion 0/0. Font-Copy-Falle beim Template-Kopieren.
- [Eigene Media einbetten](reference_hyperframes_embed_user_media.md) — Nutzer-Videos/Bilder in Beats einbetten (vorab per ffmpeg auf exakt 5s/yuv420p backen).
- [Agent-Prompt selbsttragend](reference_agent_prompt_v2_selfcontained.md) — Agent-File enthält Ablauf, Anatomie, Glossar, Fallen inline. Template-Kit: `~/Documents/Projects/broll-set-template/`.

⭐ **ZWEI bewährte Themes** — bewusst wählen, Farben jeweils aus der `stil.md` des Nutzers:
- **Theme 1 — Window/UI-Visualisierung**: Window-Chrome + Traffic-Lights, terminal-/code-lastig, dicht, Akzente. Für technische/Erklär-/Code-Beats.
- **Theme 2 — Clean Editorial Mockup** ([reference](reference_realistic_mockup_replicas.md)): ruhiger BG, floating Cards, weiche Schatten, echte Logos, minimalistisch-premium. Für Tool-/Brand-/Stat-Videos.

Wenn unklar wie B-Rolls aussehen sollen, IN DIESER REIHENFOLGE lesen:

1. [Workflow](workflow_broll_creation.md) — End-to-end Prozess: Skript-Parse → Beat-Plan → Build → Render → Open.
2. [Theme 2: Clean Editorial](reference_realistic_mockup_replicas.md) — der cleane Premium-Weg + Recherche-Workflow (echte Logos per curl, Repo-Daten via WebSearch).
3. [Style-DNA UI-Mockups](feedback_real_style_ui_mockups.md) — Theme 1: UI-Mockups (Terminal/Editor/Board), NICHT abstrakte Organisms/Networks/Trees.
4. [Anker-Mapping](reference_anker_compositions.md) — welche Beispiel-Composition welches Pattern liefert (Beispiele im Kit unter `examples/`).
5. [5s Min + Motion](feedback_broll_5sec_motion.md) — Mindestdauer 5s (150f@30fps), continuous motion bis zum letzten Frame.

## Bestätigte Handwerks-Patterns

- [Exaktes Teil-Mapping](feedback_exact_part_mapping.md) — B-Roll N = Teil N. Hook/CTA NICHT als Teil bauen (außer explizit gelistet).
- [Genau genannte Stellen + direkt bauen](feedback_exact_parts_direct_execution.md) — Nummerierte Teile = exakte Comp-Anzahl, keine CTA dazuerfinden, alle 5s.
- [EIN B-Roll für genannte Stelle](feedback_one_broll_for_named_part.md) — nennt der Nutzer EINE Stelle + pastet das ganze Skript → EIN B-Roll, Skript = nur Kontext.
- [SFX selbst synthetisieren (ffmpeg)](reference_ffmpeg_sfx_synth.md) — "mit Soundeffekten" → ffmpeg lavfi synth (gratis), separate .wav. KI-Audio NICHT automatisch (Kosten).
- [Placement-Palette (Talking-Head-Overlays)](feedback_placement_palette_refine.md) — kein mechanisches Links-Rechts-Pendeln, Vergleiche → split.
- [Eyecatchier & dicht](feedback_eyecatchier_dense.md) — B-Rolls müssen tragen: lebende Elemente statt 3 statischer Karten. (Dichte-Level ist Geschmack → an stil.md ausrichten.)
- [Qualitäts-Benchmark](feedback_grillme_quality_benchmark.md) — Maßstab: dicht, detailreich, durchanimiert. NIE simple Karte+Icon.
- [Template brechen + literale Metaphern](feedback_break_template_literal_metaphor.md) — nicht jedes Beat gleich bauen. Literale Metapher aus dem gesprochenen Wort.
- [KEINE Emojis — gezeichnete Metaphern](feedback_no_emojis_drawn_visuals.md) — Emoji-Glyphen als Visual wirken billig. Pflicht: SVG/CSS-gezeichnete Elemente, EINE Metapher über volle 5s.
- [Liquid-Glass-Overlays](reference_liquid_glass_hyperframes.md) + [Motion-Graphic-Overlays neben Sprecher](workflow_motion_graphic_overlays_on_talkinghead.md) — Overlay-Einblendungen auf fertig geschnittenem Talking-Head-Video, seitlich, nie vorm Gesicht.
- [Detailgetreue Replicas + baked SFX](reference_hyperframes_replicas_and_sfx.md) — "detailgetreu wie echte App" = echte UI nachbauen, im Stil aus stil.md, mit echten recherchierten Daten.
- [Lokale Fonts capturen](reference_hyperframes_local_fonts.md) — Google-Fonts-@import failt im sandboxed Render → woff2 lokal + `@font-face`.
- [Multi-Comp-Batch](reference_hyperframes_multi_comp_batch.md) — N Einzel-5s-Comps als Ordner-Batch: Lint-0/0-Tricks, Render-Loop, Kontaktblatt-QA.
- [Helle BGs im Beispiel-Stil](feedback_light_backgrounds_only.md) — Beispiel-Stil-Regel: Full-Frame hell, dunkel nur als Karten. Gilt NUR, wenn die stil.md des Nutzers hell ist.

## Anti-Patterns (stil-unabhängig)

- Abstrakte Network-Graphs, Tree-Branches, Honeycomb-Grids ohne UI-Kontext, isolierte Speedometer
- B-Rolls < 5 Sekunden ohne expliziten Grund
- Animation, die in den letzten Sekunden einfach stoppt
- Skript-Teile auslassen, wenn der Brief N B-Rolls fordert
- Alte gerenderte Compositions überschreiben (nutze `-v2`-Naming)
- Emojis als Bild-Inhalt
- "Emoji + etwas wackelt" statt echter, dichter 5s-Metapher

## Deine eigenen Patterns

(Wenn DEIN Nutzer Feedback gibt oder etwas feiert: hier als neue Topic-Files + Zeilen festhalten. Stil-Wünsche gehören in die stil.md, Arbeits-Patterns hierher.)

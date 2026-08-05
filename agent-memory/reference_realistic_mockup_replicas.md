---
name: theme-clean-editorial
description: THEME 2 (gleichwertig) — Clean-Editorial-Mockup-Stil für B-Rolls. Cream-BG, floating Cards, weiche Schatten, echte Logos, Anthropic-Orange-Twist. Plus Recherche-Workflow für echte Logos/Repo-Daten. Auf JEDES Video anwendbar.
metadata:
  type: reference
---

# Theme 2: Clean Editorial Mockup (gleichwertiger zweiter Weg)

Ich habe ZWEI gleichwertige B-Roll-Themes. Beide von Sebastian gefeiert. Bei einem neuen Video bewusst eins wählen (oder fragen, wenn unklar). Tag 136 hat Theme 2 etabliert ("Perfekt, richtig gutes B-Roll, extrem clean") — als zweiten Standard-Weg merken, auch mit frischem Kontext sofort treffen.

- **Theme 1 — Window/UI-Visualisierung** (bisheriger Default): weißer BG + `DotGrid`, `WindowChrome` mit Traffic-Lights, terminal-/code-lastig, dichte Swarms, bunte Akzente, GitHub-Light-Code-Theme. Benchmark = GrillMe (Tag 122). Details: [[anker-compositions-mapping]], [[grillme-quality-benchmark]], [[eyecatchier-dense-brolls]]. Gut für: technische/Erklär-Beats, Code, Terminals, dichte Visualisierungen.
- **Theme 2 — Clean Editorial Mockup** (dieses File): minimalistisch-premium, Cream-BG, floating Cards mit großen weichen Schatten, echte Logos, viel Whitespace. Vorlage-Datei: `HeadroomCleanBRoll.tsx` (Prefix `Hc_`). Gut für: Tool/Plugin-Videos, Brand-/Credibility-Momente, Zahlen/Stats, "premium & teuer aussehen".

Wenn ein Video nach "clean / premium / nicht zu busy / wie Tag 136" klingt → Theme 2. Wenn nach "viel zu sehen / terminal / dicht / technisch" → Theme 1. Im Zweifel Theme 2 für Tool-Vorstellungen.

## ⚠️ Clean heißt NICHT leer (Tag 137)

Theme 2 clean = premium/luftig, ABER nicht "eine kleine Card mittig + viel Whitespace" — das fand Sebastian "langweilig, nicht viel zu sehen". Auch im cleanen Stil muss "viel zu sehen" + viel Bewegung rein, so dicht/lebendig wie das gefeierte GridPhones-Intro. Mittel die FUNKTIONIEREN (Tag 137 V2, `CarouselFlowV2BRoll.tsx`): Urknall (1 Input → ~10 radiale Output-Cards + Shockwaves), Orbit (Icons kreisen um den Agent), rotierender Kreislauf (Stationen + glühender Punkt), Cockpit (Quellen→Claude→Docs mit fließenden Partikeln), aktive Skill-Cards (jede mit Live-Mini-Animation: Text tippt / Spark generiert / Layout-Blöcke), Terminal-Cockpit (voller Flow live), echte Slide-Videos, Feed-Upload mit Progress, lebendige IG-Kommentare, DM-Paket das Inhalte rausschleudert. → Pro Beat MEHRERE animierte Elemente + Motion bis zum letzten Frame, nicht ein statisches Kärtchen.

## Stil-DNA Theme 2

- **BG:** warm-grauer Cream-Verlauf `radial-gradient(ellipse at 50% 38%, #F8F6F3 0%, #ECE9E3 62%, #E4E0D9 100%)`. Für Brand-Reveals dunkel `#0A0A0A`.
- **Floating Cards:** weiß `#FFFFFF`, borderRadius 26, großer weicher Schatten `0 40px 90px rgba(60,50,40,0.16), 0 8px 24px rgba(60,50,40,0.07)`, leichte Sin-Float-Bewegung (`translateY = sin(frame*0.05)*4-6`), scale-in beim Entrance (0.92→1 spring).
- **Unser Twist (macht es ZU UNS, nicht 1:1-Kopie eines Creators)** — Pflicht, sonst beschwert sich Sebastian es sei eine Kopie:
  - Dünner Anthropic-Orange Top-Accent-Stripe (`height:5, background:#D97757`) an Haupt-Cards.
  - Kleiner Brand-Tag oben rechts in der Card: Icon + Mono-Name (bei Headroom: Funnel + "headroom"). Generisch: `BrandTag` mit dem Tool-Namen.
  - Alle kleinen Labels in **AnthropicMono**, UPPERCASE, letter-spacing 0.16em (`MonoLabel`).
  - Ein wiederkehrendes Signature-Icon zum Tool (Headroom = Funnel-SVG).
  - Warm getönte Glows (#FFF7F0) statt rein weiß.
- **Farben:** ink #161513, text #3A3733, muted #9A958C, orange #D97757 (Leit-/Akzent), green #15803D (gut/Ersparnis), red #DF5B4C (warm, Müll/Problem). Sparsam, max 1 Akzent pro Beat + orange.
- **Fonts:** Zahlen/Headlines AnthropicSans 800 (riesig, letterSpacing -0.02em); Labels AnthropicMono.

## Wiederverwendbare Bausteine (in `HeadroomCleanBRoll.tsx`)

- `CreamFrame({dark})` — BG-Wrapper, 1200×700 inner.
- `CleanCard({w,pad,accent,dark})` — weiße floating Card, optional orange Stripe / dark (GitHub-Style).
- `MonoLabel`, `Center` (mittig positionieren), `TopLabel` (Mono-Label über zentrierter Card), `useFloat()`.
- `TokenCard({label,value,valueColor,brand,tag,sub})` — die "TOKENS PER RUN"-Statkarte (Claude-Code-Logo + Mono-Label + Riesenzahl). Generisch für jede Stat/Zahl. Zahl per `interpolate` hoch→runter zählen lassen.
- `RepoCard({blur,dim})` — realistisches GitHub-Repo-Mockup (dark). Per blur/dim in den Hintergrund schieben, davor Glow+Logo.
- `Funnel`, `Spark` (=`claude-logo-combo.png`), `BrandTag`/`HeadroomTag`.
- Bewährte Beat-Typen: Stat-Card mit count, Vergleich zwei Cards + "=" / "−90%", Filter-Flow (Card→Funnel→Card mit Partikeln), Credibility (Brand-Logo-Card + Stat-Card), Input-Flow (Item-Cards → Tool-Card), Install-Steps-Card, Brand-Reveal (Logo scale+blur-in + diagonaler Shine-Sweep `skewX(-18deg)`).

## Recherche-Workflow (VOR dem Bauen, themen-basiert)

Bei Tool-/Plugin-/Produkt-Videos immer zuerst:
1. **WebSearch** nach dem Tool/Repo → echten Namen, Owner, Beschreibung, Stars, Sprache, Lizenz. (Tag 136: Headroom = echtes Repo `chopratejas/headroom`, Apache-2.0, "Compress tool outputs, logs, files, and RAG chunks before they reach the LLM. 60–95% fewer tokens, same answers.") Echte Beschreibung im Repo-Mockup verwenden.
2. **Echte Logos holen** (Sebastian besteht drauf, nicht faken): `curl -sL -A "Mozilla/5.0..."` von Wikimedia Commons. UA-Header Pflicht sonst 403. Ins `public/` legen.
3. **Vorhandene Assets prüfen** (`ls public/*.png *.svg`): bereits da → `claude-logo-combo.png` (orange Claude-Spark/Asterisk — DAS Claude-Logo, nicht der 8-Punkt-Helper), `netflix-n.png` (NETFLIX-Wortmarke rot/transparent), `anthropic-logo.png` (schwarze Wortmarke), `claude-tamagotchi.png` (Maskottchen).
4. Zahlen/Claims ehrlich gegenchecken und Sebastian im Report flaggen (z.B. "50k Stars / 700k$ vor Posten prüfen") — siehe [[knowledge-cutoff-research-first]].

## Instagram-Phone-Mockup (Social-Post-Videos)

Für Videos über Social-Posts/Carousels (Tag 137, `CarouselPostBRoll.tsx`): iPhone-Mockup (dunkler Frame #17151A, Dynamic Island, radius 58) mit echtem **Instagram-Post-UI** (IG-Glyph-Topbar, Avatar+Username+blauer Verify-Haken, Carousel-Media mit Snap-Swipe durch die Slides + Dots + "n/6"-Badge, Like/Comment/Share/Save-Row, "X Gefällt mir" + Caption). **IG-Logo** = inline-SVG Kamera-Glyph mit offiziellem Gradient (#FEDA75→#FA7E1E→#D62976→#962FBF→#4F5BD5). **Virality-Signale**: Aufrufe-Counter-Chip (count-up + "▲ geht viral"), aufsteigende Herzen, Doppeltipp-Like-Burst, "VIRAL 🔥"-Badge. **Carousel-Slides** als `OffthreadVideo` (playbackRate 0.8 für 4s→5s) im Snap-Swipe (per-Slide halten, dann smoothstep weiterwischen). BG: kühl-hell #F1F0F4 + dezenter IG-Gradient-Radial-Glow hinter dem Phone — NICHT denselben BG wie die gezeigten Posts nehmen (Sebastian Tag 137: "darf nicht 1:1 wie der Carousel-Hintergrund aussehen"). Tamagotchi als Profilbild passt für Claude-erstellte Posts.

## Papercut-Personen-Cutout (echte Person als sprechender Sticker)

Für Intros mit einer echten Person (Tag 139, Boris Cherny, `CcSetupBRoll.tsx`): echtes Foto holen (YouTube-Talk-Thumbnail `https://img.youtube.com/vi/<ID>/maxresdefault.jpg` ist oft die beste eyecatchy Quelle — Person spricht/lacht auf Bühne) → **freistellen mit `rembg`** (Python, lokal vorhanden): `from rembg import remove; remove(PIL_image)` → transparentes PNG, vorher mit PIL auf die Person croppen + `getbbox()` auto-trim. **Papercut-Outline** = transparentes PNG ~16-20× gestapelt auf Kreisbahn (radius ~8-10px) mit `filter:'brightness(0) invert(1)'` (weiße Silhouette) HINTER dem Farb-Original → weißer Sticker-Rand. + `drop-shadow`. **Spricht-Effekt** (ohne echtes Lip-Sync, das ist zu unzuverlässig): Sprechblase mit Tail zum Mund + Schallwellen-Balken am Mund + subtiler `translateY`-Bob (sin*4). Assets in `public/boris/`. Sebastian-Wunsch Tag 139 so erfüllt.

## X / Twitter-Post-Mockup (Creator-sagt-X-Momente)

Für Intros/Beats wo ein bekannter Creator etwas "gepostet" hat (Tag 139 Hook V1, `CcSetupBRoll.tsx`): realistische X-Post-Card. Bausteine:
- **Offizielles X-Glyph** als inline-SVG (zuverlässiger als curl): `<path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24h-6.66l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231 5.45-6.231Zm-1.161 17.52h1.833L7.084 4.126H5.117L17.083 19.77Z"/>` (viewBox 0 0 24 24), oben rechts in der Card.
- **Verified-Badge** = blauer Kreis #1D9BF0 + weißes ✓ (kein komplexes SVG nötig).
- **Avatar** = die freigestellte Person (boris-cut.png) in einem `overflow:hidden`-Kreis, Bild leicht größer + negativ-offset positioniert damit Gesicht zentriert.
- **Link-Preview-Card** drin = Weg um das **Tool-/Brand-Logo** unterzubringen (Claude-Spark + "Claude Code Setup" + claude.com/code), orangener Soft-BG.
- **Engagement-Row** (💬/🔁/❤) mit count-up Likes per interpolate für Lebendigkeit. Plain Zahlen, KEIN toLocaleString (ICU im Render unsicher).
- ⚠️ Tweet-Text NIE als echtes Zitat einer realen Person faken das Gegenteil ihrer öffentl. Haltung sagt (Boris' reale Aussage: "läuft out-of-the-box gut"). Text illustrativ + positiv halten, im Report flaggen.

## Strang-/Ideen-Explosion aus einer Person/Node (max-visuell)

Wenn Sebastian "viel zu sehen / richtig krass cool visualisiert, was er sagt" will (Tag 139 Hook V2 + S6b): zentrale Figur (Boris-Cutout) + radiale Stränge zu Konzept-Chips drumherum.
- Nodes auf Ellipse: `a = (i/N)*2π - π/2; x = cx+cos(a)*430; y = cy+sin(a)*250` (breit nutzen, 1200×700).
- Stränge = SVG-`line` cx,cy→node, **draw-on** per interpolate (ex/ey = lerp), + Partikel-`circle` das mit `t=(frame*0.02+i*0.2)%1` nach außen fließt. Bei Bezier-Strängen (S6b): `strokeDasharray={1400} strokeDashoffset={(1-draw)*1400}`.
- Person zuletzt im DOM + `zIndex:5` → liegt VOR den Strang-Ursprüngen. Nodes staggered spring-pop, leichtes sin-float.
- S6b-Variante (Playbook fließt aus ihm raus): Boris links, 4 Regel-Cards rechts gefächert, Stränge Boris→Cards. Hook-V2-Variante: Boris zentral, 9 Capability-Chips rundum (CLAUDE.md/Hooks/MCPs/Skills/Subagents/...).

## Radar-Scan-Animation (Setup/Prüfung "live" zeigen)

Für "ein Befehl prüft alles" o.ä. (Tag 139 S8a `Cd_S8a_CheckRun`): rotierender Radar-Sweep der Module-Chips nacheinander grün abhakt.
- Sweep: `sweep = (max(0,frame-startF)*speed)%360`, SVG `<g transform="rotate(sweep cx cy)">` mit Linie + Trail-Wedge (`path A R R 0 0 0 ...` opacity 0.12).
- **Deterministisches Abhaken nach Winkel:** node bei Grad θ → `checkedAt = startF + θ/speed`; `checked = frame > checkedAt` → Chip wird grün (greenSoft + ✓) mit kurzem scale-pop. Sweep-speed 5°/f = 72f/Umdrehung.
- Center-Readout = % count-up. Concentric rings als Skala.
- "leicht geblurrter Fake-Command": dunkle Terminal-Pill, mono-Text mit `filter:blur(1.1px)` + Block-Glyphen ░░░ (NICHT echter Command) + heller "Prüf jetzt!"-Button mit pulsierendem Glow (`boxShadow 0 0 ${18+sin*8}px orange`).

## A/B-Hook-Lieferung

Wenn Sebastian zwei Versionen zum Testen will: beide als eigene Comps (`_V1`/`_V2`), alte Comp + Renders NIE überschreiben, neue IDs registrieren, beide rendern → er pickt. V1 = "nah am Original + kleine Verbesserungen", V2 = "max-visuell zum Testen".

## Papercut-Cutout: Foto-Quelle + generische Helper (jede Person)

Die Papercut-Technik generalisiert auf jede public figure (Boris Tag 139, Karpathy Tag 141). Generischer Helper `Cutout({src,w,bob,out,rings})` (in `KarpathyMdBRoll.tsx`) = 16× weiße Silhouette auf Kreis (radius `out` ~7-10) + Farb-Original + drop-shadow. **Foto-Quelle die zuverlässig klappt: Wikimedia Commons `Special:FilePath`** → `curl -sL -A "<Chrome-UA>" "https://commons.wikimedia.org/wiki/Special:FilePath/<Datei Name>.png"` (Leerzeichen/Kommas im Dateinamen gehen, -L folgt dem Redirect). Bühnen-/Talk-Fotos wo die Person lacht/spricht sind am eyecatchiesten. ⚠️ **Vor rembg Vordergrund-Clutter wegcroppen** (Monitor/Podium/zweite Person) sonst hält rembg es als Foreground — bei Karpathy unteres Monitor-Drittel via PIL `.crop((0,0,W,455))` weg, dann `remove()` + `getbbox()`-Autocrop + 8px transparenter Rand. Weiße Outline kaschiert ohnehin Kanten-Artefakte (z.B. Rest-Arm).

## Mascot/Node Partikel-Emitter-Intro (eyecatchy Hook "viel fliegt raus")

Wenn Sebastian "viel soll davon weggehen / viel Bewegung / eyecatchy" für ein Intro will (Tag 141, `Km_00_Intro` mit Claude-Tamagotchi): zentrales Maskottchen/Node + N=~30 Partikel die kontinuierlich radial nach außen fliegen.
- Pro Partikel i: Winkel `a=(i/N)*2π + (i%3)*0.18`, Loop-Progress `p=((frame*0.011*spd + phase)%1+1)%1`, `dist=80+p*470`, `x=cx+cos(a)*dist*1.5` (×1.5 nutzt 16:9-Breite), `y=cy+sin(a)*dist`. Opacity = fadeIn(`p/0.15`)·fadeOut(`(1-p)/0.28`)·`min(1,frame/10)`. → läuft bis zum letzten Frame, nie leer.
- Partikel-Mix (kind `i%5`): ⭐, Mono-Code-Chips (`</>`,`{ }`,`fn()`), Brand-Chips (`CLAUDE.md`), Sans-Keyword-Pills (Regelwörter), `✦`. Maskottchen `claude-tamagotchi.png` zuletzt im DOM + `zIndex:6`, pop-in + sin-pulse. Top-Mono-Label + späte Pill als Kontext.

## Konstellations-Intro (Maskottchen + Chips ringsum, Stil Tag 124)

Bewährter eyecatchy Intro-Stil (Referenz `out/tag-124-setup2/01-Intro.mp4`, Tag 141 als Intro-V2 reproduziert): **weißer BG (#FCFBF9) + Dot-Grid** (`radial-gradient(circle, rgba(60,45,30,0.05) 1.2px, transparent 1.2px)` size 28px) — Theme-1, NICHT Cream. Tamagotchi zentral + warmer Radial-Glow + 2-3 gepunktete konzentrische Ringe (`strokeDasharray "2 7"`). Drumherum ~12 farbige Pill-Chips (weiß, 1.5px farbiger Border, Dot+Mono-Label, Farben orange/blau/lila/grün rotierend) auf einer Ellipse, je mit gestrichelter Connector-Linie zum Zentrum + fließendem Partikel. **Chips steigen gestaffelt hoch** (`translateY (1-spring)*30 → 0`) = „viel nach oben". Bottom-Pill.
- ⚠️ **Chips gleichmäßig über den Kreis verteilen, NICHT clustern** (sonst Top-Gedränge + abgeschnittene Labels). Trick gegen Überlappung: **Radius pro Chip alternieren** (`f = i%2 ? 1.16 : 1`), Winkel gleichmäßig, linke Wedge (~150-210°) freilassen wenn dort ein Doc sitzt.
- Sebastian-Wunsch Tag 141: zusätzlich eine **CLAUDE.md-Doc-Karte (📄 + Markdown-Zeilen) direkt neben den Tamagotchi** (links, eigener kurzer Connector) als Quelle. Funktioniert als zweite, dichtere Intro-Variante neben dem ruhigen Cream-Intro.

## ⚠️ Render-Crash bei vielen gestapelten gefilterten Imgs (Papercut)

Papercut-Cutout mit 16-20 gestapelten `<Img filter:brightness(0) invert(1)>` desselben PNGs kann den **Voll-Render (alle 150 Frames) reproduzierbar zum Absturz** bringen (headless-Chrome react-dom dispatchEvent-Fehler), obwohl der Einzel-`still` sauber durchläuft (Tag 141 Beat 02 Karpathy, 17 Stacks @ 320px). Tag 139 Boris (16-20 Stacks) lief noch — Grenzfall, abhängig von Bildgröße/Anzahl. **Fix-Optionen falls es crasht:** Ring-Anzahl runter (8-12 statt 16-20), Outline-Img kleiner skalieren, ODER die weiße Outline EINMAL vorbacken (rembg-Cutout in PIL als weiße Silhouette dilatieren + hinter das Original compositen → ein einziges PNG mit Rand, statt N Stacks im Render). Bei Crash nicht endlos retryen — Sebastian fragen ob nötig.

## Brand-Logo-Mockups (dark, GitHub-Style)

GitHub-dark Farben: bg #0D1117, border #30363D, text #C9D1D9, muted #8B949E, link #58A6FF, green #3FB950, star #E3B341, tag-bg rgba(56,139,253,0.15). Header "owner / repo" + Public-Pill + Watch/Fork/Star-Buttons (mit echtem Star-Count), echte Beschreibung, blaue Topic-Pills, Footer: Sprach-Dot + Stars + Lizenz + "Updated x ago". Per `filter:blur(Npx)` + dim-Overlay nach hinten.

Verwandt: [[finance-set-celebrated]], [[real-style-ui-mockups]], [[anker-compositions-mapping]], [[workflow-broll-creation]].

---
name: one-broll-for-named-part
description: Wenn Sebastian am Anfang EINEN konkreten Teil/Satz nennt und "B-Roll dafuer" will, dann EIN B-Roll fuer genau diese Stelle bauen — auch wenn er das ganze Skript mitschickt. Skript = Kontext, nicht Auftragsumfang.
metadata:
  type: feedback
---

# "B-Roll fuer diesen Teil" = EIN B-Roll fuer die genannte Stelle, nicht das ganze Skript zerlegen

Sebastian nennt oft am Anfang der Nachricht eine konkrete Stelle ("ich brauche B-Roll fuer diesen Teil ...") und pastet danach das GANZE Skript. Das ganze Skript ist nur Kontext (Ton, Anschluss, Wording) — der Auftrag ist EIN gutes B-Roll fuer die genannte Stelle.

**Why:** Am 06.07.2026 (Profil/Memory-Skript, "Claude hat heimlich ein Profil ueber dich gebaut") hab ich das komplette Skript in 10 Comps zerlegt, alle 10 in 9:16 gebaut + gerendert. Sebastian hat mitten im QA abgebrochen: *"was chill ich wollte nur ein broll fuer den einen teil den ich am anfang genannt habe fuer das 9:16 format, meinte nur dafuer ein gutes."* → massive Ueberproduktion, an der Aufgabe vorbei.

**How to apply:**
- Zaehl NICHT automatisch Beats ueber das ganze Skript, wenn er eine einzelne Stelle nennt. Bau 1 (max 2 Varianten) starke Comp NUR fuer diese Stelle.
- Der Teil den er "am Anfang" nennt ist der Auftrag. Der Rest des gepasteten Skripts ist Kontext.
- Nur wenn er EXPLIZIT "das ganze Skript" / "alle Teile" / nummerierte Teile ("die 7 Teile", "erstens... zweitens...") sagt → mehrere Comps. Siehe [[exact-part-mapping]], [[exact-parts-direct-execution]].
- Im Zweifel: EINE gute Comp liefern + kurz fragen ob mehr Stellen gewuenscht sind. Lieber 1 sauber als 10 am Ziel vorbei.
- Aufwand-Check vor Batch-Render: "Hat er wirklich N Stellen genannt, oder EINE?" Wenn EINE → nicht batchen.

## Teile JEDE Nachricht neu zählen + Gesamtzahl checken (07.07.2026)
Sebastian splittet denselben Satz zwischen Nachrichten unterschiedlich (mal 1 Teil, mal 2). IMMER die `für diesen Teil:`-Marker der AKTUELLEN Nachricht zählen, nicht von letzter Nachricht ausgehen. Er nennt oft die Gesamtzahl ("insgesamt sind es 8 B-Rolls") — als Gegenprobe nutzen: `Gesamt = Anzahl Teile + 1 Extra für den dual-format Teil (9:16+16:9)`. Wenn meine Fileanzahl ≠ seine Zahl → fehlenden Teil finden + nachgenerieren (07.07.: Problem in 2 Teile gesplittet → 7 Teile → 8 Files, ich hatte nur 7). Sauber durchnummerieren (Files per `mv` reverse-order umbenennen, kein Re-Render nötig; SFX mit umbenennen).

## Mehrere Ratios pro Teil (07.07.2026)
Sebastian fordert manchmal PRO Teil bestimmte Ratios ("von dem Teil eine 9:16 UND eine 16:9 Version, von dem anderen nur 16:9"). Exakt mappen, nicht pauschal.
- Technik: EINE responsive Comp bauen (Layout aus `useVideoConfig().width/height`, `vertical = height>=width`, content-Breite `Math.min(width-130, vertical?940:1220)`), dann in Root.tsx DIESELBE Component an VERTICAL **und** HORIZONTAL registrieren. Ein File, beide Ratios sauber. Vorlage: `AboCheckBRoll.tsx` `AboCheck_Saved`.
- Für 16:9-nur-Teile ruhig ein eigenes horizontales Layout (Phone links, Flow rechts) statt responsive. Vorlage: `AboCheck_Banking`.
- Wenn er "ganz normal 16:9" sagt = natives Vollbild 1920×1080, NICHT in die 1200×700-Zoom-Safe-Box zwängen (die ist nur für 16:9-das-in-9:16-gecropt-wird). Er will die Ratio nativ nutzen.

## "Screenshots" im Skript = Aktion animieren, kein echtes Material
Wenn der Skript-Text sagt "mach Screenshots von der Banking-App", ist das der ZU ZEIGENDE Handlungsschritt, kein Auftrag echte Screenshots einzubetten. Bau ein animiertes Mockup (Phone + Transaktionsliste + Screenshot-Flash + Thumbnail-Stack → in Claude werfen). Bleibt regelkonform zu [[videos-only / keine screenshots]].
- Phone-Mockup-Falle: App-Header MUSS fixiert + höher-z sein, Transaktionsliste in einem darunter liegenden `overflow:hidden`-Viewport scrollen — sonst scrollt die Liste UNTER den Header und überlappt (Tag Abo-Check V1 Bug, in V2 gefixt).

## Was in dem Fall trotzdem gut war (behalten)
- Native 9:16 (VERTICAL 1080x1920 in Root.tsx) full-frame, heller Cream-BG, gezeichnete SVG-Metaphern statt Emojis, Anthropic-Orange, WindowChrome. Die Comp selbst (`ProfilBRoll.tsx` `Profil_02_MemoryFile` / `Profil_01_Hook`) hat gut getroffen — nur die MENGE war falsch.
- Umlaute: echte ae/oe/ue/ss NICHT ausweichen — AnthropicSans woff2 rendert ae/oe/ue/ss=ä/ö/ü/ß sauber. Immer echte Umlaute schreiben (Sebastian-Global-Regel).

Verwandt: [[exact-part-mapping]], [[exact-parts-direct-execution]], [[workflow-broll-creation]]

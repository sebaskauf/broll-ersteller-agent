---
name: ffmpeg-sfx-synth
description: Passende Soundeffekte fuer B-Rolls selbst mit ffmpeg synthetisieren (kostenlos, kein API-Credit) — wenn Sebastian "mit Soundeffekten" will. Rezepte fuer ding/whoosh/burn/power-up/ticks.
metadata:
  type: reference
---

# SFX fuer B-Rolls selbst synthetisieren (ffmpeg)

Sebastian will manchmal "passende Soundeffekte" zu den B-Rolls, als separate Files zum Reinziehen in CapCut (07.07.2026, Loop-System-Set). Higgsfield `generate_audio` kostet Credits → NICHT auto-nutzen (Kosten-Regel). Freesound/Pixabay-Direktdownload ist unzuverlaessig (Login/API). **Loesung: mit ffmpeg lavfi synthetisieren** — gratis, deterministisch, exakt auf Cut-Laenge, klingt sauber (Beeps/Whooshes wie Standard-TikTok-SFX). Ehrlich labeln als "synthetisiert", anbieten dass er lieber Library-SFX nehmen kann.

Output als `.wav` (48k) in `out/<set>/sfx/`, benannt passend zum jeweiligen B-Roll (`sfx-01-burn.wav` etc.).

## Rezepte (bewaehrt)

Pluck-Note (Bell/Ding-Baustein):
```
ffmpeg -y -f lavfi -i "sine=frequency=$F:duration=$D:sample_rate=48000" \
  -af "afade=t=in:d=0.004,afade=t=out:st=0.04:d=$DECAY,volume=0.55" note.wav
```
Chord (3 Toene amix): drei `-f lavfi -i "sine=frequency=..."` + `-filter_complex "[0][1][2]amix=inputs=3,...,volume=1.4"`.
Arpeggio/Sequenz: Einzelnoten rendern, dann `-filter_complex "[0][1][2]concat=n=3:v=0:a=1"`.
Stille zum Spacen: `-f lavfi -i "anullsrc=r=48000:cl=mono" -t $D`.

Konkret die 6 Typen:
- **Ding/Verify (success)**: 3 Noten aufsteigend concat (880 -> 1174 -> 1568 Hz), Decay 0.26-0.38.
- **Power-Up (payoff)**: 4 kurze Plucks 523/659/784/1046 + Schluss-Chord 1046/1318/1568.
- **Burn/Zap (Problem, abwaerts)**: `aevalsrc='0.4*sin(2*PI*(460*t-150*t*t)) + 0.12*(2*random(0)-1)':d=1.2:s=48000` + `lowpass=f=1400`.
- **Rising Shimmer (Reveal)**: `aevalsrc='0.3*sin(2*PI*(240*t+300*t*t)) + 0.18*sin(2*PI*(480*t+600*t*t))':d=1.2:s=48000` + `highpass=f=180`.
- **Whoosh (Handoff/Transition)**: `anoisesrc=color=pink:duration=0.6:amplitude=0.6` + `bandpass=f=1000:width_type=h:w=1400` + Swell-Envelope (afade in/out).
- **Ticks + Chime (Loop/Countdown)**: 3x kurze 1500 Hz Plucks (0.06s) mit Stille dazwischen, dann Chord.

Immer `afade` in/out gegen Klick-Artefakte. Laenge grob an den Cut/Beat anpassen (0.6-1.4s reicht als Akzent, kein Loop noetig).

Verwandt: [[one-broll-for-named-part]] (Dual-Ratio + benannte Teile), [[anker-compositions-mapping]]

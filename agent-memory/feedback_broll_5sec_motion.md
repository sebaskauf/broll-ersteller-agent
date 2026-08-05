---
name: 5sec-min-continuous-motion
description: Jeder B-Roll mindestens 5 Sekunden (150f bei 30fps). Continuous Motion bis zum letzten Frame — niemals einfach Animation stoppen.
metadata:
  type: feedback
---

# 5-Sekunden Pflicht + Continuous Motion bis letztes Frame

Sebastian am 26.05.2026 explizit korrigiert: "Warum sind manche B-Rolls 4 Sekunden lang? Die sollen bitte alle 5 Sekunden lang sein. Dann bitte auch nicht: nur weil sie jetzt von 4 auf 5 Sekunden erhöht werden, dann einfach die Animation stoppen, sondern wirklich sicherstellen, dass auch in den letzten Sekunden, die wir jetzt noch hinzufügen, alle B-Rolls bitte 5 Sekunden lang sind."

**Why:** Bei CapCut-Cuts braucht Sebastian Headroom. 5 Sekunden ist die Untergrenze für ein einzelnes B-Roll. Wenn die Animation in den letzten 1-2 Sekunden tot ist, sieht das gepasted aus statt absichtlich. Continuous Motion = "diese Composition lebt von Anfang bis Ende".

**How to apply:**

## Mindest-Dauer-Regeln

| Beat-Typ | Dauer | Frames @ 30fps |
|---|---|---|
| Standard B-Roll | **5s minimum** | 150f |
| Hook / Opener (z.B. Tamagotchi-Reveal) | 6s | 180f |
| Komplexe Multi-State-Animation (z.B. Install + Activate + All-Synced) | 5-6s | 150-180f |
| Kurzer Transition (selten, NUR auf explizite Anweisung) | 3s | 90f |

**Default: 150f bei 30fps. Nie 120f es sei denn explizit gewünscht.**

## Pflicht für die letzten 30 Frames (1 Sekunde)

Wenn eine Composition länger gezogen wird oder generell die ersten 4s alle "spawn-Animationen" durch sind, MUSS die letzte Sekunde neue Bewegung haben. Optionen:

| Pattern | Beispiel |
|---|---|
| **Cross-Connection-Lines** | Zwischen mehreren Cards entstehen Linien mit flowing Particles |
| **Final-State-Pill mit Pulse** | "ALLE 5 PROJEKTE · SYNCED" Banner pulsiert + Count-up |
| **Cross-Counter ticks** | Counter zählt nochmal hoch (z.B. von 5 auf 61) |
| **Confetti / Particle-Float** | Bei "Complete"-Momenten kleine Particles floaten hoch |
| **Connection-Web** | Zwischen allen Cards entstehen Verbindungslinien |
| **Sweep-Banner** | Mega-Pill rutscht rein mit subtle scale-pulse |

## Continuous-Motion-Background (in JEDER Composition aktiv)

Nicht nur am Ende — die GANZE Composition muss "atmen":

- **Floating-Dots im BG** (z.B. `FloatingDots` Helper, 6-8 dots, sin/cos-orbits)
- **Breathing-Scales** auf Cards: `1 + 0.018 * Math.sin((frame + i * 14) * 0.13)`
- **PulseDots** mit continuous opacity: `0.4 + 0.6 * (0.5 + 0.5 * Math.sin(frame * 0.18))`
- **LIVE-Indikatoren** auf WindowChrome: `live={true}` prop
- **Spring-Pop-Animationen** mit `damping: 9, stiffness: 280` für snappy spawn-feel

## Code-Patterns für Last-Frame-Motion

### Cross-Connection mit flowing Particles
```tsx
{frame > 100 && (
  <svg width={CARD_W} height={CARD_H} style={{ position: "absolute", inset: 0, pointerEvents: "none" }}>
    {[...].map((conn, i) => {
      const since = frame - conn.t;
      if (since < 0) return null;
      const grow = interpolate(since, [0, 14], [0, 1], { extrapolateLeft: "clamp", extrapolateRight: "clamp" });
      return (
        <g key={i}>
          <line x1={...} y1={...} x2={...} y2={...} stroke={conn.color} strokeWidth={2}
                strokeDasharray="5 4" strokeDashoffset={-(frame * 1.4)} opacity={0.5} />
          {since > 10 && [0, 1].map((p) => {
            const cycle = (((since + p * 14) % 30) / 30);
            const px = ..., py = ...;
            return <circle key={p} cx={px} cy={py} r={3.5} fill={conn.color} opacity={1 - cycle} />;
          })}
        </g>
      );
    })}
  </svg>
)}
```

### Sweep-Banner mit pulse
```tsx
{frame > 105 && (() => {
  const since = frame - 105;
  const pulse = 1 + 0.05 * Math.sin(frame * 0.2);
  return (
    <div style={{
      marginTop: 14, padding: "12px 18px", background: C.green, borderRadius: 12,
      display: "flex", alignItems: "center", gap: 10,
      opacity: spring({ frame: since, fps, config: { damping: 12, stiffness: 180 } }),
      transform: `scale(${pulse})`,
      boxShadow: `0 8px 24px ${C.green}50`,
    }}>
      <PulseDot color="#FFF" size={6} />
      <span style={{ fontFamily: F.mono, fontSize: 13, color: "#FFF", fontWeight: 800, letterSpacing: "0.1em" }}>
        FINAL STATE LABEL
      </span>
    </div>
  );
})()}
```

### Cross-Counter ticks
```tsx
{frame > 95 && (() => {
  const counter = Math.floor(
    interpolate(frame, [95, 135], [start, end], { extrapolateLeft: "clamp", extrapolateRight: "clamp" })
  );
  return <span>{counter} / 61 AGENTS · ACTIVE</span>;
})()}
```

### Confetti-Dots floating up
```tsx
<svg style={{ position: "absolute", inset: 0, pointerEvents: "none" }} width="100%" height="100%">
  {Array.from({ length: 14 }).map((_, i) => {
    const seed = (i * 73 + 31) % 100;
    const startX = 30 + (seed / 100) * 900;
    const startDelay = (i * 4) % 30;
    const localSince = frame - 95 - startDelay;
    if (localSince < 0) return null;
    const cycle = (localSince % 35) / 35;
    const py = 470 - cycle * 180;
    const wob = Math.sin(localSince * 0.18 + i) * 8;
    const color = [C.green, C.amber, C.blue, C.orange, C.purple][i % 5];
    return <circle key={i} cx={startX + wob} cy={py} r={3} fill={color} opacity={(1 - cycle) * 0.8} />;
  })}
</svg>
```

## Spawn-Patterns für Hook-Compositions (Tamagotchi & Co.)

Sebastian am 26.05.2026: "schneller aufpoppen lassen verstreut in unterschiedlichere richtungen und sich dann umkreisen lassen".

**Standards:**

| Property | Wert |
|---|---|
| Spawn-Delay-Stagger | `2 + i * 1.8` (alle 30 in ~55 Frames) |
| Spawn-Spring | `damping: 9, stiffness: 280` (snappy pop, nicht weich) |
| Initial-Scale | `0.3 → 1` (mehr Pop-Feel als 0.5→1) |
| Verteilung | Pre-defined "random-feeling" pattern: verstreute angles & Distanzen (z.B. 175-365px Range) |
| Orbit-Start | 8 Frames nach Spawn |
| Orbit-Speed | Ring-abhängig: `ring < 220 → 0.011`, `< 280 → 0.008`, `< 330 → 0.006`, sonst `0.004` |
| Orbit-Direction | Alterniere: `i % 3 === 0 ? -1 : 1` |
| Breathing-Scale | `1 + 0.04 * Math.sin((frame + i * 5) * 0.14)` |

**Konkretes Beispiel im Code:** siehe `EccV3PluginBRoll.tsx::EccV3_01_TamagotchiCenter` und `SATS_V3` array.

## Related

- [[real-style-ui-mockups]]
- [[anker-compositions-mapping]]

---
name: liquid-glass-hyperframes
description: Working recipe for Apple iOS-26 "Liquid Glass" overlay cards composited onto a talking-head video via HyperFrames (not Remotion)
metadata:
  type: reference
---

Apple "Liquid Glass" overlay cards on a talking-head video, built in HyperFrames (HTML/GSAP), confirmed rendering correctly.

**When to use:** Sebastian wants glassy semi-transparent cards integrated INTO a talking-head video (synced to speech), not a fixed presentation panel. Distinct from his Remotion UI-mockup B-rolls.

**Project setup:**
- `npx hyperframes init <name> --width 1280 --height 720` (match source video specs — his edited videos are 720p/30fps).
- Background = `<video muted playsinline>` on `data-track-index="0"` + separate `<audio>` (the real voice) on a high track. Both `data-start="0"`, `data-duration` = clip length.
- Trim the source to the sample range first (`ffmpeg -t 50 -an` for bg, `-vn -c:a aac` for audio) so renders are fast.
- Overlay cards = timed `div class="clip"` with `data-start/data-duration/data-track-index`.

**Glass material CSS (the look):**
- Two-layer background: light highlight gradient (white 0.20→0.04) OVER a dark adaptive scrim (rgba(18,20,26,0.42→0.52)). The dark scrim is what makes white text readable over bright video — this is authentic to iOS Liquid Glass adaptive dimming.
- `backdrop-filter: blur(24px) saturate(170%)` (works in HyperFrames bundled Chromium render).
- box-shadow stack: `inset 0 1px 0 rgba(255,255,255,.55)` (top highlight) + `inset 0 0 0 1px rgba(255,255,255,.18)` (rim) + soft outer drop shadows for depth.
- `::before` = radial specular sheen top-left corner. `::after` = 1px hairline rgba white border. border-radius 28px.
- White text with `text-shadow: 0 2px 14px rgba(0,0,0,.45)`.
- NO particles/sparkles — Sebastian explicitly does not want kitsch. Clean, calm motion only.

**Motion:** entrance = `gsap.from({opacity:0, scale:.92, y/x offset, filter:"blur(14px)"}, ease power3.out)`. Stagger inner rows with `back.out(1.4)`. Mid-composition cards (not final scene) NEED an exit `gsap.to({opacity:0, scale:.96, filter:"blur(10px)"})` because they must clear before the next beat — this is the documented exception to the "no exit animation" rule.

**Placement:** screenshot the actual video frames (`ffmpeg -ss N -frames:v 1`) to find the subject. Sebastian sits center, slightly right; free zones are left wall (dachschräge) and lower-left. Put cards there, never over face/hands.

**Fonts:** use `Inter` (auto-embedded by compiler). `-apple-system`/`SF Pro` trigger a lint warning (renderer can't supply them).

**Gotchas:**
- The contrast validator FALSE-POSITIVES on glass cards (samples the bright video pixel through the translucent overlay, reports ~2.6:1). Judge contrast from the actual rendered frame, not the validator. With the dark scrim it reads fine.
- Trimmed bg video gets a "sparse keyframes" warning. Harmless at high quality, but for the full build re-encode the source with dense GOP: `ffmpeg -i in.mp4 -c:v libx264 -r 30 -g 30 -keyint_min 30 -movflags +faststart out.mp4`.
- `<br>` in a short display title is OK (deliberate two-line title) despite the general skill rule against `<br>`.

**Verify before reporting:** `lint` + `inspect` (layout) must be clean, then render and pull frames at each beat to confirm look + that the bg isn't frozen (compare poses at two timestamps).

Project lives at: `video-editor/liquidglass/`. Source video + transcript: `video-editor/work/install-1/`.

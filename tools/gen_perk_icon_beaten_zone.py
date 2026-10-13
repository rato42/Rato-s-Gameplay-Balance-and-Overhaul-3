"""Beaten Zone perk icon: MG on bipod, cone of fire arcing onto a stippled ellipse, in the vanilla perk style.

Vanilla perk icons (UI/Icons/Perks/*.dds) are 68x68 RGBA: bevelled metal fill lit from the top-left,
a thin bright rim and a near-black 1-2px outline. Drawn at S x 68 and downsampled.

    python tools/gen_perk_icon_beaten_zone.py [out.png]
"""
import math
import sys

import numpy as np
from PIL import Image, ImageDraw
from scipy import ndimage

SIZE = 68
S = 8
W = SIZE * S

GOLD = ((236, 206, 138), (124, 94, 44))   # top, bottom of the fill gradient
OLIVE = ((150, 150, 112), (72, 74, 52))
OUTLINE = (6, 5, 3)


def P(x, y):
    return (x * S, y * S)


def rot(points, ang_deg, origin, offset):
    a = math.radians(ang_deg)
    ca, sa = math.cos(a), math.sin(a)
    ox, oy = origin
    out = []
    for x, y in points:
        dx, dy = x - ox, y - oy
        out.append((offset[0] + dx * ca - dy * sa, offset[1] + dx * sa + dy * ca))
    return out


GUN_ANGLE = -42
GUN_ORIGIN = (0, 0)
GUN_POS = (3.0, 62.0)
GUN_SCALE = 0.84
# (spread from barrel deg, launch handle, landing handle, landing x)
ARCS = [(-4, 32.0, (69.0, 3.0), 64.5), (20, 14.0, (46.0, 42.0), 50.0)]
BIPOD_FEET = [(29.5, 10.5), (36.5, 9.5)]


def gun(points):
    pts = [(x * GUN_SCALE, y * GUN_SCALE) for x, y in points]
    return [P(*p) for p in rot(pts, GUN_ANGLE, GUN_ORIGIN, GUN_POS)]


def gun_point(x, y):
    return rot([(x * GUN_SCALE, y * GUN_SCALE)], GUN_ANGLE, GUN_ORIGIN, GUN_POS)[0]


def draw_gun(d):
    """Side view of a bipod GPMG (M60/PKM-like), muzzle to the right."""
    parts = [
        [(0, -3.2), (3, -3.6), (11, -2.6), (11, 2.4), (5, 4.4), (0, 5.6)],   # stock
        [(11, -3.4), (24, -3.4), (24, 2.8), (11, 2.8)],                      # receiver
        [(13, -5.4), (22, -5.4), (23.5, -3.4), (12, -3.4)],                  # feed cover
        [(14.5, 2.8), (20.5, 2.8), (20, 8.0), (15, 8.0)],                    # ammo box
        [(21.5, 2.4), (24.6, 2.4), (23.6, 8.2), (20.6, 8.2)],                # pistol grip
        [(24, -2.6), (31, -2.6), (31, 1.8), (24, 1.8)],                      # gas cylinder / handguard
        [(31, -1.6), (41, -1.6), (41, 1.0), (31, 1.0)],                      # barrel
        [(41, -2.3), (44, -2.3), (44, 1.7), (41, 1.7)],                      # flash hider
    ]
    for poly in parts:
        d.polygon(gun(poly), fill=255)
    hinge = gun_point(33.0, 1.0)
    for foot in BIPOD_FEET:
        d.line([P(*hinge), P(*gun_point(*foot))], fill=255, width=int(1.9 * S))
    return gun_point(44.0, -0.3)


def bezier(p0, p1, p2, p3, n=400):
    pts = []
    for i in range(n + 1):
        t = i / n
        u = 1 - t
        pts.append(tuple(u ** 3 * a + 3 * u * u * t * b + 3 * u * t * t * c + t ** 3 * e
                         for a, b, c, e in zip(p0, p1, p2, p3)))
    return pts


ZONE_X = (46.0, 67.0)
ZONE_Y = 60.0
ZONE_RY = 2.4
DASH, GAP = 4.2, 2.6


def draw_cone(d, muzzle):
    """Two dashed trajectories: the high one lands at the far end of the zone, the low one at the near end."""
    # drag-like cubic: leaves along (barrel + spread), falls steeply onto the zone
    for spread, reach, ctrl2, end_x in ARCS:
        a = math.radians(GUN_ANGLE + spread)
        x0, y0 = muzzle[0] + 1.5 * math.cos(a), muzzle[1] + 1.5 * math.sin(a)
        ctrl1 = (x0 + reach * math.cos(a), y0 + reach * math.sin(a))
        pts = bezier((x0, y0), ctrl1, ctrl2, (end_x, ZONE_Y - 1.2))
        travelled, on = 0.0, True
        seg = [pts[0]]
        for a, b in zip(pts, pts[1:]):
            travelled += math.dist(a, b)
            seg.append(b)
            if travelled >= (DASH if on else GAP):
                if on:
                    d.line([P(*q) for q in seg], fill=255, width=int(2.0 * S), joint="curve")
                travelled, on, seg = 0.0, not on, [b]
        if on and len(seg) > 1:
            d.line([P(*q) for q in seg], fill=255, width=int(2.0 * S), joint="curve")


def draw_zone(d):
    x0, x1 = ZONE_X
    d.ellipse([P(x0, ZONE_Y - ZONE_RY), P(x1, ZONE_Y + ZONE_RY)], fill=255)


def zone_dots():
    return np.zeros((W, W), bool)


def shade(mask, colors):
    """Bevelled metal: vertical gradient, bevel lit from the top-left, bright rim."""
    top, bot = np.array(colors[0], float), np.array(colors[1], float)
    ys, xs = np.nonzero(mask)
    y0, y1 = ys.min(), ys.max()
    t = np.clip((np.arange(W) - y0) / max(1, y1 - y0), 0, 1)[:, None, None]
    base = top * (1 - t) + bot * t
    base = np.broadcast_to(base, (W, W, 3)).copy()

    dist = ndimage.distance_transform_edt(mask)
    h = np.minimum(dist, 2.2 * S)
    h = ndimage.gaussian_filter(h, 0.6 * S)
    gy, gx = np.gradient(h)
    light = np.array([-0.7, -0.7])  # from the top-left
    lam = (gx * -light[0] + gy * -light[1]) / (0.9 * 1.0)
    lam = np.clip(lam, -1, 1)[..., None]
    out = base + np.where(lam > 0, lam * (255 - base) * 0.55, lam * base * 0.45)

    rim = (dist > 0) & (dist < 0.9 * S)
    out[rim] = out[rim] * 0.7 + np.array([255, 245, 200]) * 0.3
    return np.clip(out, 0, 255)


def main(out_path):
    gun_m = Image.new("L", (W, W), 0)
    muzzle = draw_gun(ImageDraw.Draw(gun_m))
    gold_m = Image.new("L", (W, W), 0)
    gd = ImageDraw.Draw(gold_m)
    draw_cone(gd, muzzle)
    draw_zone(gd)

    gun_mask = np.array(gun_m) > 127
    gold_mask = (np.array(gold_m) > 127) & ~gun_mask

    rgb = np.zeros((W, W, 3))
    rgb[gold_mask] = shade(gold_mask, GOLD)[gold_mask]
    rgb[gun_mask] = shade(gun_mask, OLIVE)[gun_mask]
    dots = zone_dots() & gold_mask
    rgb[dots] = rgb[dots] * 0.35

    shape = gun_mask | gold_mask
    outline = ndimage.binary_dilation(shape, iterations=int(1.4 * S)) & ~shape
    # gap between the gun and the cone so the two read as separate objects
    sep = ndimage.binary_dilation(gun_mask, iterations=int(0.9 * S)) & gold_mask
    rgb[outline | sep] = OUTLINE
    alpha = (shape | outline).astype(float) * 255

    img = Image.fromarray(np.dstack([rgb, alpha]).astype(np.uint8), "RGBA")
    # premultiply before the downsample so the outline does not bleed into transparent pixels
    pre = np.array(img).astype(float)
    pre[..., :3] *= pre[..., 3:4] / 255
    small = Image.fromarray(pre.astype(np.uint8), "RGBA").resize((SIZE, SIZE), Image.LANCZOS)
    s = np.array(small).astype(float)
    a = s[..., 3:4]
    s[..., :3] = np.where(a > 0, s[..., :3] * 255 / np.maximum(a, 1), 0)
    Image.fromarray(np.clip(s, 0, 255).astype(np.uint8), "RGBA").save(out_path)
    print("wrote", out_path)


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "Images/perk_BeatenZone.png")

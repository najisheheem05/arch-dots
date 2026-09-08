-- Managed by ryoku-monitor (Ryoku Settings layout). The per-output modes are
-- the ones chosen in the Displays section; edits here may be overwritten.

hl.monitor({ output = "eDP-1", mode = "1920x1080@144.00", position = "0x0", scale = 1, cm = "srgb", bitdepth = 8, sdrbrightness = 1 })

-- Keep GTK and XWayland apps crisp (nearest whole scale when every monitor
-- agrees, else 1).
hl.env("GDK_SCALE", "1")

-- Catch-all for monitors not listed above. A hotplugged display comes up at
-- its preferred mode (always valid on an untrained link; autoscale + settle
-- then raise it to highrr), placed to the right at 1x, never mirrored.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

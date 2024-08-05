# Breakout - The Remake

## Art Bible

## Table of content

- [Other Design Documents](#other-design-documents)
- [Art Style](#art-style)
    - [General](#general)
    - [Visual Hook](#visual-hook)
    - [2D](#2d)
    - [Color Palette](#color-palette)
    - [Animation](#animation)
- [Entities](#entities)
- [Environments](#environments)
- [UI](#ui)
- [Camera](#camera)
- [Marketing](#marketing)
    - [General](#general-6)
    - [Internal](#internal)
    - [External](#external)
- [Technical Guidelines](#technical-guidelines)
    - [Software](#software)
    - [File Formats](#file-formats)
    - [Restrictions](#restrictions)
    - [Naming Conventions](#naming-conventions)
    - [Workflows](#workflows)

### Other Design Documents:

- [GDD](../game-design-document/gdd.md)
- [LDD](../level-design-document/ldd.md)
- [ADD](../audio-design-document/add.md)

# Art Style

## General

The art style will be as close to the original as possible, with some small improvements on minimal animations and visual effects.

### Original

![original_gameplay_moodboard](./assets/breakout_original_gameplay_moodboard.png)

### The Remake

![assets_moodboard](./assets/breakout_assets_moodboard.png)

## Visual Hook

It will look as the original game, with some small improvements.

## 2D

- Top down 2D
- Flat, simple colors

## Color Palette

Similar to the original, with some small improvements to the saturation/darkness.

## Animation

Since the original didn't have any animations, this remake will only add minimal animations to be a bit more pleasing and at the same time true to the original.

These could be the transition of filling the screen with bricks, destroying bricks, and UI states.

# Entities

## Paddle

![paddle_moodboard](./assets/breakout_paddle_moodboard.png)

## Bricks

![bricks_moodboard](./assets/breakout_bricks_moodboard.png)

## Ball

![ball_moodboard](./assets/breakout_ball_moodboard.png)

# Environments

## Level

As the original, environment should be simple with a dark, flat colored background.

What might not be included from the original game are the white boarders.

# UI

## General

The font that will be used is yet to be decided, but similar to the font found in the original game.

Windows should have a light, flat colored border, as a reference to the white borders of the main level.

All UI elements should have a similar light/dark contrast as the main level has with the background and border.

## Mouse cursor

Be the same shape and color as the ball.

## Main menu

Buttons for the main menu could maybe be custom and be inspired of the bricks, both in color, shape, and animation when clicked on (gets destroyed).

The buttons should be stacked, and maybe limited to 4 (the same as amount of brick types):

- Start (red)
- Settings (orange)
- Stats (green)
- Quit (yellow)

The background should be of the same color as the main level background: dark, flat color.

No borders.

## Settings menu

A pop-up window with tabs that include:

- Gameplay (tab 1)
    - Toggle for classic mode (enabling highscore)
    - Slider for paddle width
    - Slider for ball size
    - Slider for rows of each brick color
    - Slider for brick columns
    - Select for speed-increase type (classic, brick hit, paddle hit, none)
    - Toggle for shrink paddle on ceiling hit
- Graphics (tab 2)
    - Toggle for particle effects
    - Toggle for screen-shake
- Audio (tab 3)
    - Toggle/Volume slider for Music
    - Toggle/Volume slider for SFX

## Pause menu

A simple pop-up window.

Buttons should be stacked and include:

- Continue
- Restart
- Quit

# Camera

Static, top-down.

# Marketing

## General

Should aim to be similar to the original art style for marketing.

## Internal

How is the art for marketing the game or the studio from within the game designed? Such as the splash screen, videos, ads, or anything similar.

Make sure to include moodboards and inspirations.

## External

### Original art

![original_marketing_moodboard_moodboard](./assets/breakout_original_marketing_moodboard.png)

### Remake

How is the art for marketing the game or studio from outside the game designed? Such as icons, banners, cover art, screenshots, gif:s, trailers, videos, or anything similar.

# Technical Guidelines

## Software

- `Aseprite`
- `Krita`

## File Formats

- **2D assets:** `.png`

## Restrictions

Keep the size of the files as small as possible.

One limitation is GitHub's size limit for single files: 100MB.

## Naming Conventions

As Godot's naming convention: [snake_case](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html#naming-conventions).

## Workflows

### Moodboards

Both `Aseprite` and `Krita` are used.

Most are entirely made in `Aseprite` in `128x128` canvases, which are then exported as `PNG`, and imported in `Krita` for up-scaling on a `512x512` canvas.

For moodboards with more than just pixel art, they are created directly in `Krita` in a `512x512` canvas. When pixel art elements, such as texts, are present in these, they are first made in `Aseprite` and exported/imported to `Krita` in a similar way as described above.

Pixel font used: either hand-drawn or [TeenyTinyPixls](https://www.fontspace.com/teeny-tiny-pixls-font-f30095). If generating text in `Aseprite` with the `TeenyTinyPixls` font, use font size `5`.

NOTE: to use installed fonts in `Aseprite`, make sure to install them for the entire system and not only for one user. On Linux this is automatically installed on the user when installing it normally, so you need to manually make sure it is installed on the system.

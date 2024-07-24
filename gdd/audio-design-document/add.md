# Breakout - The Remake

## Audio Design Document

## Table of content

- [Other Design Documents](#other-design-documents)
- [Outline/Objectives](#outlineobjectives)
    - [General](#general)
    - [Music](#music)
    - [SFX](#sfx)
    - [UI](#ui)
- [Research](#research)
- [Implementation](#implementation)
    - [General](#general-1)
    - [Music](#music-1)
    - [SFX](#sfx-1)
    - [UI](#ui-1)
- [Content List](#content-list)
    - [Music](#music-2)
    - [SFX](#sfx-2)
    - [UI](#ui-2)
- [Technical Guidelines](#technical-guidelines)
    - [Software](#software)
    - [File Formats](#file-formats)
    - [Restrictions](#restrictions)
    - [Naming Conventions](#naming-conventions)
    - [Workflows](#workflows)

### Other Design Documents:

- [GDD](../game-design-document/gdd.md)
- [Art Bible](../art-bible/art-bible.md)
- [LDD](../level-design-document/ldd.md)

# Outline/Objectives

## General

Sticking to the original Breakout, the audio should be 8- or 16-bit.

## Music

Simple arcade-style music.

## SFX

Sticking to the original Breakout, the SFX should be minimal, with few added sounds.

## UI

Some simple state sounds in the same genre as the SFX.

# Research

### Software

To create simple 8-bit music the [Bosca Ceoil: The Blue Album](https://yurisizov.itch.io/boscaceoil-blue) is a great choice, but [1BITDRAGON](https://1bitdragon.com/) is also something to have look for.

One is free and open-source, and the other costs around 29$ at the moment but looks to have a better overview.

Both are also available to all major platforms (Windows, Mac, and Linux), which is important since the game will mostly be developed on Linux devices but also on Windows and Mac.

### File formats, compression, and size

#### Lossless uncompressed:

Size: Big
Quality: Best
Formats: `WAV`, `AIFF`

#### Lossless compressed:

Size: Medium
Quality: High
Formats: `FLAC`, `WMA Lossless`, `ALAC`

#### Lossy compression:

Size: Small
Quality: Low
Formats: `OGG`, `MP3`, `AAC`, `WMA`

#### OPUS (for dialog)

Size: Small
Quality: High
Formats: `OPUS`

As of writing this, [Godot supports 3 audio formats](https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_audio_samples.html):

- WAV
- OGG Vorbis
- MP3

According to [Audio File Formats | Godot Basics Tutorial | Ep 59](https://www.youtube.com/watch?v=ChJIKW2Y_U8) and [several comments online](https://www.reddit.com/r/godot/comments/s0p6ik/music_file_type_and_size/), the best practice is to use:

- `OGG` for game music or long runtime sounds
- `WAV` for sfx or short sounds

According to one of the comments in the above Redit post the MP3 format should be avoided for short audio files, such as SFX, since it could lag/delay.

# Implementation

## General

There should be 3 audio busses:

- Master
- Music
- SFX

## Music

The music should be added to an audio player which is added to the main menu and main level.

The menu music should start when the menu is loaded.

The game music should start/restart when the ball is served. It should also stop the music when the player loses the ball and when pausing the game.

## SFX

The ball have an audio player attached to it which the ball is responsible for to send and play a specific sound effect when bouncing against different surfaces.

All bricks have their own audio player attached to them which they are responsible for to send and play an explosion sound effect when being destroyed.

A game manager have an audio player attached to it to play sound effect when different game events are triggered.

## UI

The different menus will have an audio player attached to it, which the different UI elements sends the sound effects to and play on different UI events.

# Content List

## Music

| Status | Type | Name |
|---|---|---|
| To do | Menu | Menu music |
| To do | Game | Game music |

## SFX

| Status | Type | Name |
|---|---|---|
| To do | Bounce | Wall ball-bounce |
| To do | Bounce | Paddle ball-bounce |
| To do | Bounce | Brick ball-bounce |
| To do | Explosion | Brick destroyed |
| To do | Game event | Refilling the screen |
| To do | Game event | Clearing the screen |
| To do | Game event | Losing a life |
| To do | Game event | Game over |
| To do | Game event | New highscore |


## UI

| Status | Type | Name |
|---|---|---|
| To do | Button | Button click |

# Technical Guidelines

## Software

- [Audacity](https://www.audacityteam.org/) (collecting and editing audio)
- [Pro SFXR](https://pro.sfxr.me/) (generating SFX)
- [Bosca Ceoil: The Blue Album](https://yurisizov.itch.io/boscaceoil-blue) (creating music)

## File Formats

- **Music:** .ogg
- **SFX:** .wav

## Restrictions

Sticking to the original Breakout, the audio should be 8- or 16-bit.

Keep the size of the files as small as possible.

One limitation is GitHub's size limit for single files: 100MB.

## Naming Conventions

As Godot's naming convention: [snake_case](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html#naming-conventions).

## Workflows

What are the workflows for creating any audio mentioned in this ADD?

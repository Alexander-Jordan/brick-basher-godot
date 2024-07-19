# GAME TITLE - SUBTITLE

## Level Design Document

## Table of content

- [Other Design Documents](#other-design-documents)
- [Outline/Objectives](#outlineobjectives)
- [Research](#research)
- [Implementation](#implementation)
- [Content List](#content-list)
- [Technical Guidelines](#technical-guidelines)
    - [Software](#software)
    - [File Formats](#file-formats)
    - [Restrictions](#restrictions)
    - [Naming Conventions](#naming-conventions)
    - [Workflows](#workflows)

### Other Design Documents:

- [GDD](/game-design-document/gdd.md)
- [Art Bible](/art-bible/art-bible.md)
- [ADD](/audio-design-document/add.md)

# Outline/Objectives

As in the original Breakout, there is only 1 level that is repeated when finished.

The gameplay should be similar to the original Breakout.

# Research

What are the inspirations for this games level design? What prototypes and experiments have been done? What file formats have been tested/used?

This section can prove to be valuable in looking back at past experiments on the project.

Make sure to include moodboards of inspirations, prototypes, or experiments.

# Implementation

The goal of the game is in one way to clear the screen without losing all 3 lives.

But the main goal of the game is to get as much points as you can, and this stretch beyond clearing 1 screen.

The difficulty should not increase when a screen is cleared and refilled, but instead while progressing in the current screen.

The difficulty should increase due to changes to the ball and paddle:

- Speed of the ball when hitting different blocks (progressively)
- Size of the paddle of ceiling hit

# Content List

| Status | Type | Name |
|---|---|---|
| To do | UI | Main menu |
| To do | UI | Settings menu |
| To do | UI | Pause menu |
| To do | Level | Level 1 |

# Technical Guidelines

## Software

- Godot game engine (for building scenes and levels)
- Aseprite (for mocking up scenes and levels)
- Krita (for mocking up scenes and levels)

## File Formats

- **Mockup images:** .png
- **Levels:** .scene

## Restrictions

Keep the size of the files as small as possible.

One limitation is GitHub's size limit for single files: 100MB.

## Naming Conventions

As Godot's naming convention: [snake_case](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html#naming-conventions).

## Workflows

What are the workflows for creating a level?

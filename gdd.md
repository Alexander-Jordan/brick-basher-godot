# Breakout
### The remake

## Table of content

- [Overview](#overview)
	- [Theme](#theme)
	- [Hook & loop](#hook--loop)
- [Story](#story)
	- [Characters](#characters)
- [Gameplay](#gameplay)
	- [Skills](#skills)
	- [Mechanics](#mechanics)
	- [Entities](#entities)
	- [Progression](#progression)
	- [Losing](#losing)
- [Assets](#assets)
	- [2D](#2d)
	- [UI](#ui)
	- [Audio](#audio)
	- [Animation](#animation)
- [Level design](#level-design)
	- [Main menu](#main-menu)
	- [Settings menu](#settings-menu)
	- [Main level](#main-level)
- [Technical](#technical)
	- [Platform](#platform)
	- [Tools](#tools)
- [Marketing & funding](#marketing--funding)
	- [Target](#target)
	- [Localization](#localization)

## Overview

1 player `Pong` is all about destroying all brick layers with the help of a paddle and a ball.

```
At the top are multiple layers of bricks.
The player controls a paddle at the bottom.
In order to destroy the bricks and breakout of prison, a ball needs to be bounced off the paddle repeateadly and hit the bricks.
The goal is to clear all bricks and get the highest score.
Missing a ball leads to losing one life.
If 3 lifes are lost, it's game over.
```

### Theme

This is a remake of the original arcade-game Breakout, and the theme will take much inspiration from it.

### Hook & Loop

The hook is to destroy bricks and get the highest score.
The loop is all about both keeping the ball alive, while trying to keep destroying bricks and earning points.

## Story

In the original game the story is about a prisoner trying to breakout of prison with a hammer, brick by brick.

### Characters

#### The Hammer/Paddle:

```
The hammer (or paddle) is controlled by the prisoner (the player).
With it the prisoner tries to breakout of prison by destroying all bricks to the prison wall.
```

## Gameplay

```
The player controls a paddle at the bottom of the screen, steering it left or right.
Destroy all bricks on the top of the screen by repeatedly bounce a ball off of the paddle and hit the bricks.
Destroying bricks will earn you points, and the main objective is to earn as much points as possible before losing all 3 lives.
```

### Skills

- Reaction
- Aim
- Accuracy
- Speed

### Mechanics

The paddle is steerable left or right, and used to repeatedly bounce a ball and destroy bricks.

The ball will never stop or decelerate, but only increase in speed on different occasions. The player needs to navigate the paddle so the ball bounces off of the paddle to keep it in play. At the same time the paddle can be used to steer the ball in a specific direction, in order to aim on and destroy bricks.

When all bricks are destroyed the screen is refilled with the same bricks again.

### Entities

#### Bricks

_Per Brick_:

| Color | Rows | Points |
|---|---|---|
| Yellow | 2 | 1 |
| Green | 2 | 3 |
| Orange | 2 | 5 |
| Red | 2 | 7 |

_Per Screen_:

| Rows | Columns | Bricks | Points |
|---|---|---|---|
| 8 | 14 | 112 | 448

### Progression

Destroy bricks using the ball and paddle. If a screen is cleared, it will be refilled with a new set of bricks. The goal is to earn as much points as possible without losing all 3 lives.

The speed of the ball will increase at key moments in the game, and reset upon losing a life or clearing the screen:

| Event | Speed |
|---|---|
| 4 brick hits | Init speed x 2 |
| 12 brick hits | Init speed x 4 |
| Orange/Red brick hit | Init speed x 8 |

NOTE: the speed will not decrease due to any of these events.
For example: after clearing a path to an orange/red brick before losing the ball, then on the next ball hitting an orange/red brick, and finally having a 4th brick hit after that will not decrease the speed from `init speed x 8` to `init speed x 2`.

Upon hitting the ceiling of the screen with the ball the paddle is shrunk to half the size. This is also reset upon losing a life or clearing the screen.

### Losing

The player has 3 lives and loses 1 life if a ball is missed and pass the paddle at the bottom of the screen.

If all 3 lives are lost it's game over.

## Assets

### 2D

#### Brick

#### Ball

#### Bricks

#### Splash screen

#### Game Icon

#### Mouse cursor

### UI

#### Font

#### Buttons

### Audio

#### SFX

- Ball bounce off of paddle
- Ball bounce off of wall
- Ball bounce off of bricks
- Brick destroyed
- Button hover
- Button click

#### Music

### Animation

#### Bricks

- Filling the screen
- Being destroyed

#### Screen

- Screen-shake on destroying bricks

## Level design

There will only be one level that gets reset each time it's cleared.

### Main menu

Simple start, stats, settings, and quit buttons.

### Settings menu

Custom settings should include:

- Size of paddle/ball
- Amount of rows for each brick color
- Amount of brick columns
- Speed increase type (classic, brick hit, paddle hit, none)
- Enable/disable halving the paddle upon ceiling hit
- Toggle classic mode (enabling highscore)
- Audio toggle/volume
- Particle effects
- Screen-shake

### Main level

8x14 bricks are at the top.

The paddle is at the bottom of the screen.

The ball rests on the paddle on game init, re-serve, and resets.

## Technical

### Platform

- PC (Windows, Mac, & Linux)
- Web

### Tools

- Godot
- Aseprite
- Git/GitHub
- JSFXR (SFX)

## Marketing & funding

Will be released on Itch.io for free and marketed on YouTube by showing how it was made.

### Target

Classic breakout enthusiasts or anyone interested in game development.

### Localization

- English

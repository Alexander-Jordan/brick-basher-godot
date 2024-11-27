# Breakout - The Remake (Game Design Document)

## Table of content

- [Overview](#overview)
	- [Skills](#skills)
- [Story](#story)
- [Gameplay](#gameplay)
	- [Gameplay Hook](#gameplay-hook)
	- [Loops](#loops)
	- [Entities](#entities)
	- [Progression](#progression)
	- [Losing](#losing)
- [Assets](#assets)
	- [Sensory Hook](#sensory-hook)
	- [Art](#art)
	- [Level Design](#level-design)
	- [Audio](#audio)
- [Technical](#technical)
	- [Platform](#platform)
	- [Tools](#tools)
- [Marketing & funding](#marketing--funding)
	- [Target](#target)
	- [Localization](#localization)

# Overview

A remake of the original arcade game `Breakout` that's all about destroying layers of bricks with the help of a paddle and a ball, earning points for each brick destroyed, and setting the highest score.

## Skills

The game revolves around **precision** and **speed**, forcing the player to **react** quickly while **aiming** precisely.

# Story

In the original game, the story is about a prisoner trying to break out of prison brick by brick. The story is mainly driven by the game title and marketing art.

The narrative is a third-person perspective, with the only story progression being destroying bricks.

# Gameplay

## Gameplay Hook

It will play as the original Breakout with some customizable gameplay settings.

## Loops

Bounce the ball off the paddle repeatedly to keep it in play and destroy bricks with it to earn points.

When all bricks are destroyed the screen is refilled with the same bricks again.

Upon losing all 3 lives the score is saved if it beats the highest score reached, making the player want to beat it next time.

## Entities

### Paddle

Grip the paddle and steer it horizontally with a mouse or finger.

The ball bounces off the paddle in different directions depending on the collision point of the paddle:
 - Hitting dead center will send the ball back in a straight line.
 - The further away from the center the collision is the more of an angle it will be sent back (this is clamped to prevent too much of an angle).

Upon hitting the ceiling of the screen with the ball the paddle is shrunk to half the size. The size is reset upon clearing the screen or losing a life.

### Ball

Serve a ball off the paddle by clicking or tapping the screen.

It bounces off of walls, bricks, and the paddle.

The ball will have a init speed that will increase at specific events determined by the bricks, and reset to the init speed upon losing a life or clearing the screen.

| Event | Speed |
|---|---|
| 4 brick hits | Init speed x 2 |
| 12 brick hits | Init speed x 4 |
| Orange/Red brick hit | Init speed x 8 |

NOTE: the speed will not decrease due to any of these events.
For example: after clearing a path to an orange/red brick before losing the ball, then on the next ball hitting an orange/red brick, and finally having a 4th brick hit after that will not decrease the speed from `init speed x 8` to `init speed x 2`.

The ball will never stop or decelerate once it's in play.

Failing to keep the ball in play loses you 1 life out of 3 total lives.

### Bricks

#### Per Brick

| Color | Rows | Points |
|---|---|---|
| Yellow | 2 | 1 |
| Green | 2 | 3 |
| Orange | 2 | 5 |
| Red | 2 | 7 |

#### Per Screen

| Rows | Columns | Bricks | Points |
|---|---|---|---|
| 8 | 14 | 112 | 448

## Progression

Destroy bricks using the ball and paddle. If a screen is cleared, it will be refilled with a new set of bricks. The goal is to earn as much points as possible without losing all 3 lives.

## Losing

The player has 3 lives and loses 1 life if a ball is missed and pass the paddle at the bottom of the screen.

If all 3 lives are lost it's game over.

# Assets

## Sensory Hook

It will look like the original Breakout with small customizable visuals and sounds.

## Art

[Art Bible](../art-bible/art-bible.md)

## Level Design

[Level Design Document](../level-design-document/ldd.md)

## Audio

[Audio Design Document](../audio-design-document/add.md)

# Technical

## Platform

- PC (Windows, Mac, & Linux)
- Web

## Tools

- Godot
- Aseprite
- Git/GitHub
- JSFXR (SFX)

# Marketing & funding

Will be released on Itch.io for free and marketed on YouTube by showing how it was made.

## Target

Classic breakout enthusiasts or anyone interested in game development.

## Localization

- English

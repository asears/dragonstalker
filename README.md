# Dragon Stalker - Night Stalker Clone

A recreation of the classic Intellivision Night Stalker game, built with Intellivision BASIC and a JavaScript/WASM container.

## Game Description

Navigate through a maze filled with dangerous enemies while managing your ammunition. Seek refuge in the bunker to reload your weapon, and survive as long as possible!

### Features

- **Authentic Maze Design**: Based on the original Night Stalker layout
- **Multiple Enemy Types**:
  - 🕷️ Spider (Magenta) - Slow but persistent
  - 🦇 Bat (Blue) - Fast and erratic
  - 🤖 Robot (Red) - Patrol patterns
- **Safe Bunker**: Reload bullets in the central bunker
- **Progressive Difficulty**: Each level increases the challenge
- **No Sound**: Silent gameplay focusing on strategy

## Files

- `nightstalker.bas` - Intellivision BASIC source code
- `index.html` - WASM container with JavaScript emulator
- `README.md` - This file

## How to Play

### Running the Game

1. Open `index.html` in a modern web browser
2. Click "START GAME" button
3. Use keyboard controls to play

### Controls

- **Arrow Keys**: Move your character
- **Space Bar**: Fire weapon
- **R Key**: Restart game

### Objective

- Avoid or destroy enemies
- Collect bullets in the bunker (center safe zone)
- Survive as long as possible
- Earn points by defeating enemies:
  - Spider: 100 points
  - Bat: 150 points
  - Robot: 200 points
  - Level completion: 500 points

## Technical Details

### Intellivision BASIC

The `nightstalker.bas` file contains the original game logic written in Intellivision BASIC, featuring:
- Classic BASIC syntax with GOTO/GOSUB structures
- Sprite-based character rendering
- Color-coded enemies and environment
- Collision detection
- AI routines for enemy behavior

### WASM Container

The HTML file includes a JavaScript-based interpreter that emulates the Intellivision BASIC environment:
- Canvas-based rendering
- Sprite extraction from the original game image
- Keyboard input handling
- Game state management
- Authentic color palette from original Intellivision

## Sprite Design

All sprites are designed based on the provided Night Stalker game image:
- **Player**: White stick figure character
- **Walls**: Dark green maze structure
- **Paths**: Yellow corridors
- **Bunker**: Light green safe zone with striped entrance
- **Enemies**: Color-coded for easy identification

## Development Notes

This implementation focuses on:
- Authentic gameplay mechanics
- Clean, readable BASIC code
- Modern web-based delivery via WASM container
- No audio (as specified)
- Sprite fidelity to original game

## Browser Compatibility

Works best in:
- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)

## License

This is a fan recreation for educational purposes.

## Credits

Based on the classic Intellivision Night Stalker game.

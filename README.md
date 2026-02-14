# Dragon Stalker - Night Stalker Clone

A recreation of the classic Intellivision Night Stalker game, built with Intellivision BASIC and a JavaScript/WASM container.

## Game Description

Navigate through a maze filled with dangerous enemies while managing your ammunition. Seek refuge in the bunker to reload your weapon, and survive as long as possible!

### Features

- **Authentic Maze Design**: Based on the original Night Stalker layout with bumpy wall textures
- **Spider Web Graphics**: Decorative spider web in the top-left corner
- **Bunker with Bars**: Central safe zone with vertical bar graphics and entrance
- **Left Door System**: Robot enemy enters through door on the left wall
- **Projectile Bullets**: Black bullets with white glowing dots fire in player's direction
- **6 Detailed Enemy Types**:
  - 🕷️ **Spider** (Magenta) - 100pts - Slow but persistent with animated legs
  - 🦂 **Scorpion** (Blue) - 150pts - Medium speed with curved tail
  - 🐍 **Snake** (Red) - 175pts - Slow S-pattern movement
  - 🦇 **Bat** (Brown) - 200pts - Fast with wing-flap animation
  - 🐉 **Dragon** (Pink) - 250pts - Fast with charge attacks
  - 🤖 **Robot** (Gray) - 300pts - Enters randomly from left door, aggressive hunter
- **Animated Player**: Running animation with moving legs and directional gun
- **Safe Bunker**: Reload bullets in the central bunker
- **Progressive Difficulty**: Each level increases the challenge
- **Enhanced Graphics**: Bumpy wall textures, animated sprites, detailed enemies
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
- **Space Bar**: Fire weapon (shoots in direction you're facing)
- **R Key**: Restart game

### Objective

- Avoid or destroy enemies
- Collect bullets in the bunker (center safe zone with bars)
- Survive as long as possible
- Watch for the robot entering from the left door!
- Bullets fire as projectiles in the direction you're facing
- Earn points by defeating enemies:
  - Spider: 100 points
  - Scorpion: 150 points
  - Snake: 175 points
  - Bat: 200 points
  - Dragon: 250 points
  - Robot: 300 points
  - Level completion: 500 points

## Technical Details

### Intellivision BASIC

The `nightstalker.bas` file contains the original game logic written in Intellivision BASIC, featuring:
- Classic BASIC syntax with GOTO/GOSUB structures
- Sprite-based character rendering
- Color-coded enemies and environment
- Collision detection
- AI routines for enemy behavior

### WASM Containern advanced JavaScript-based interpreter that emulates the Intellivision BASIC environment:
- High-performance Canvas 2D rendering with animation
- Sprite system with frame-based animation
- Textured wall rendering with bumpy edges
- Spider web decorative graphics
- Bunker with vertical bar visualization
- Keyboard input handling
- Game state management with frame counters
- Authentic color palette from original Intellivision
- Enhanced enemy AI with type-specific behaviors
- Game state management
- Authentic color palette from original Intellivision
animated stick figure with running animation and directional gun
- **Walls**: Dark green maze structure with bumpy, organic texture
- **Paths**: Bright yellow corridors
- **Spider Web**: Decorative web pattern in corner
- **Bunker**: Light green safe zone with 5 vertical bars and bottom entrance
- **Enemies**: Fully animated with unique behaviors:
  - Spider: 8-legged with white eyes
  - Scorpion: Blue with claws and curved tail with yellow stinger
  - Snake: Red S-shaped body with animated sway
  - Bat: Brown with wing-flap animation
  - Dragon: Pink with horns, tail, and red eyes
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

# Dragon Stalker - Quick Start Guide

## Running the Game (Multiple Options)

### Option 1: Direct Browser (Simplest)
1. Simply open `index.html` in your web browser
2. Click "START GAME" and play!

### Option 2: Local Web Server (Recommended)
```powershell
# Install http-server (one time only)
npm install

# Start the server
npm start
```
The game will open automatically at http://localhost:8080

### Option 3: Docker Container (WASM)
```powershell
# Build the Docker image
npm run docker:build

# Run the container
npm run docker:run
```
Then visit http://localhost:8080 in your browser

### Option 4: Manual Docker
```powershell
# Build
docker build -t dragonstalker .

# Run
docker run -p 8080:80 dragonstalker
```

## Game Controls

- **↑ ↓ ← →** : Move character
- **SPACE** : Fire weapon
- **R** : Restart game

## Gameplay Tips

1. **Bunker is Safe**: Hide in the center bunker to reload bullets
2. **Manage Ammo**: You only have limited bullets - make them count!
3. **Enemy Patterns**:
   - Spider (Magenta): Slow but persistent tracker
   - Bat (Blue): Fast and unpredictable
   - Robot (Red): Patrols randomly
4. **Scoring**:
   - Spider: 100 pts
   - Bat: 150 pts
   - Robot: 200 pts
   - Level Clear: 500 pts

## Troubleshooting

- **Game won't start**: Make sure JavaScript is enabled in your browser
- **Controls not working**: Click on the game canvas first to focus it
- **Docker issues**: Ensure Docker Desktop is running

Enjoy the game! 🐉

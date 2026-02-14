REM Night Stalker Clone for Intellivision
REM Based on the classic Intellivision game
REM No sound implementation

    REM Initialize variables
    DIM score
    DIM px, py          REM Player position
    DIM lives
    DIM bullets
    DIM level
    DIM e1x, e1y        REM Enemy 1 (Spider) position
    DIM e2x, e2y        REM Enemy 2 (Bat) position
    DIM e3x, e3y        REM Enemy 3 (Robot) position
    DIM dx, dy          REM Direction vectors
    DIM i, j, k
    DIM gamestate       REM 0=playing, 1=dead, 2=level complete
    
    REM Game initialization
    score = 1000
    lives = 5
    level = 1
    bullets = 5
    
    GOSUB InitGame
    
MainLoop:
    REM Clear screen
    CLS
    
    REM Draw maze
    GOSUB DrawMaze
    
    REM Draw HUD
    GOSUB DrawHUD
    
    REM Draw bunker (safe zone)
    GOSUB DrawBunker
    
    REM Draw player
    GOSUB DrawPlayer
    
    REM Draw enemies
    GOSUB DrawEnemy1
    GOSUB DrawEnemy2
    GOSUB DrawEnemy3
    
    REM Handle input
    GOSUB HandleInput
    
    REM Move enemies
    GOSUB MoveEnemies
    
    REM Check collisions
    GOSUB CheckCollisions
    
    REM Game state check
    IF gamestate = 1 THEN GOSUB PlayerDied
    IF gamestate = 2 THEN GOSUB NextLevel
    IF lives = 0 THEN GOTO GameOver
    
    REM Frame delay
    WAIT
    
    GOTO MainLoop

InitGame:
    REM Set player starting position (center bunker area)
    px = 10
    py = 6
    
    REM Set enemy starting positions
    e1x = 2
    e1y = 2
    e2x = 18
    e2y = 2
    e3x = 18
    e3y = 10
    
    gamestate = 0
    RETURN

DrawMaze:
    REM Draw outer walls (green)
    FOR i = 0 TO 19
        PRINT AT (i) COLOR 2, CHR$(128)      REM Top wall
        PRINT AT (i + 220) COLOR 2, CHR$(128) REM Bottom wall
    NEXT i
    
    FOR i = 1 TO 10
        PRINT AT (i * 20) COLOR 2, CHR$(128)     REM Left wall
        PRINT AT (i * 20 + 19) COLOR 2, CHR$(128) REM Right wall
    NEXT i
    
    REM Draw internal maze walls (dark green pattern)
    REM Top-left section
    FOR i = 2 TO 4
        FOR j = 2 TO 6
            PRINT AT (i * 20 + j) COLOR 2, CHR$(128)
        NEXT j
    NEXT i
    
    REM Top-right section
    FOR i = 2 TO 5
        FOR j = 13 TO 17
            PRINT AT (i * 20 + j) COLOR 2, CHR$(128)
        NEXT j
    NEXT i
    
    REM Bottom-left section
    FOR i = 7 TO 9
        FOR j = 2 TO 5
            PRINT AT (i * 20 + j) COLOR 2, CHR$(128)
        NEXT j
    NEXT i
    
    REM Bottom-right section
    FOR i = 7 TO 10
        FOR j = 14 TO 17
            PRINT AT (i * 20 + j) COLOR 2, CHR$(128)
        NEXT j
    NEXT i
    
    REM Middle vertical walls
    FOR i = 3 TO 8
        PRINT AT (i * 20 + 8) COLOR 2, CHR$(128)
        PRINT AT (i * 20 + 11) COLOR 2, CHR$(128)
    NEXT i
    
    RETURN

DrawBunker:
    REM Draw bunker in center (greenish safe zone with entrance)
    FOR i = 5 TO 6
        FOR j = 9 TO 10
            PRINT AT (i * 20 + j) COLOR 6, CHR$(219)
        NEXT j
    NEXT i
    
    REM Bunker entrance (bottom)
    PRINT AT (6 * 20 + 9) COLOR 3, CHR$(205)
    PRINT AT (6 * 20 + 10) COLOR 3, CHR$(205)
    
    RETURN

DrawHUD:
    REM Draw score at top
    PRINT AT 2 COLOR 7, "SCORE:"
    PRINT AT 8 COLOR 7, score
    
    REM Draw lives indicator (bottom right)
    PRINT AT 230 COLOR 7, "LIVES:"
    PRINT AT 236 COLOR 7, lives
    
    REM Draw bullets indicator
    PRINT AT 210 COLOR 7, "BULLETS:"
    PRINT AT 218 COLOR 7, bullets
    
    RETURN

DrawPlayer:
    REM Player sprite (white character)
    IF px >= 0 AND px < 20 AND py >= 0 AND py < 12 THEN
        PRINT AT (py * 20 + px) COLOR 7, CHR$(2)
    END IF
    RETURN

DrawEnemy1:
    REM Enemy 1 - Spider (magenta/pink)
    IF e1x >= 0 AND e1x < 20 AND e1y >= 0 AND e1y < 12 THEN
        PRINT AT (e1y * 20 + e1x) COLOR 5, CHR$(14)
    END IF
    RETURN

DrawEnemy2:
    REM Enemy 2 - Bat (blue)
    IF e2x >= 0 AND e2x < 20 AND e2y >= 0 AND e2y < 12 THEN
        PRINT AT (e2y * 20 + e2x) COLOR 4, CHR$(15)
    END IF
    RETURN

DrawEnemy3:
    REM Enemy 3 - Robot (red)
    IF e3x >= 0 AND e3x < 20 AND e3y >= 0 AND e3y < 12 THEN
        PRINT AT (e3y * 20 + e3x) COLOR 1, CHR$(16)
    END IF
    RETURN

HandleInput:
    REM Get controller input
    dx = 0
    dy = 0
    
    REM Disc direction
    IF CONT1.UP THEN dy = -1
    IF CONT1.DOWN THEN dy = 1
    IF CONT1.LEFT THEN dx = -1
    IF CONT1.RIGHT THEN dx = 1
    
    REM Move player
    IF dx <> 0 OR dy <> 0 THEN
        px = px + dx
        py = py + dy
        
        REM Keep in bounds
        IF px < 1 THEN px = 1
        IF px > 18 THEN px = 18
        IF py < 1 THEN py = 1
        IF py > 10 THEN py = 10
        
        REM Simple wall collision (check if on wall)
        GOSUB CheckWallCollision
    END IF
    
    REM Fire button (action buttons)
    IF CONT1.BUTTON THEN
        IF bullets > 0 THEN
            bullets = bullets - 1
            REM Simplified: bullet hits closest enemy
            GOSUB FireBullet
        END IF
    END IF
    
    RETURN

CheckWallCollision:
    REM Simplified wall collision - bounce back if hit wall
    REM Check against maze positions
    IF px < 1 OR px > 18 OR py < 1 OR py > 10 THEN
        px = px - dx
        py = py - dy
    END IF
    RETURN

FireBullet:
    REM Simple bullet mechanic - check if enemy in line of sight
    REM Check enemy 1
    IF e1y = py AND ABS(e1x - px) < 5 THEN
        e1x = -100
        e1y = -100
        score = score + 100
    END IF
    
    REM Check enemy 2
    IF e2y = py AND ABS(e2x - px) < 5 THEN
        e2x = -100
        e2y = -100
        score = score + 150
    END IF
    
    REM Check enemy 3
    IF e3y = py AND ABS(e3x - px) < 5 THEN
        e3x = -100
        e3y = -100
        score = score + 200
    END IF
    
    RETURN

MoveEnemies:
    REM Simple AI - move enemies toward player
    REM Enemy 1 movement
    IF e1x < px THEN e1x = e1x + 1
    IF e1x > px THEN e1x = e1x - 1
    IF e1y < py THEN e1y = e1y + 1
    IF e1y > py THEN e1y = e1y - 1
    
    REM Enemy 2 movement (faster, more erratic)
    IF RND(10) < 7 THEN
        IF e2x < px THEN e2x = e2x + 1
        IF e2x > px THEN e2x = e2x - 1
    END IF
    IF RND(10) < 7 THEN
        IF e2y < py THEN e2y = e2y + 1
        IF e2y > py THEN e2y = e2y - 1
    END IF
    
    REM Enemy 3 movement (patrol pattern)
    IF RND(10) < 5 THEN
        e3x = e3x + RND(3) - 1
        e3y = e3y + RND(3) - 1
    END IF
    
    REM Keep enemies in bounds
    IF e1x < 1 THEN e1x = 1
    IF e1x > 18 THEN e1x = 18
    IF e1y < 1 THEN e1y = 1
    IF e1y > 10 THEN e1y = 10
    
    IF e2x < 1 THEN e2x = 1
    IF e2x > 18 THEN e2x = 18
    IF e2y < 1 THEN e2y = 1
    IF e2y > 10 THEN e2y = 10
    
    IF e3x < 1 THEN e3x = 1
    IF e3x > 18 THEN e3x = 18
    IF e3y < 1 THEN e3y = 1
    IF e3y > 10 THEN e3y = 10
    
    RETURN

CheckCollisions:
    REM Check if player hit by enemy
    IF px = e1x AND py = e1y THEN gamestate = 1
    IF px = e2x AND py = e2y THEN gamestate = 1
    IF px = e3x AND py = e3y THEN gamestate = 1
    
    REM Check if player in bunker (safe zone)
    IF px >= 9 AND px <= 10 AND py >= 5 AND py <= 6 THEN
        REM Safe - reload bullets
        IF bullets < 10 THEN bullets = bullets + 1
    END IF
    
    REM Check if all enemies destroyed
    IF e1x < 0 AND e2x < 0 AND e3x < 0 THEN
        gamestate = 2
    END IF
    
    RETURN

PlayerDied:
    REM Handle player death
    lives = lives - 1
    
    REM Reset positions
    px = 10
    py = 6
    bullets = 5
    
    REM Brief pause
    FOR i = 1 TO 30
        WAIT
    NEXT i
    
    gamestate = 0
    RETURN

NextLevel:
    REM Advance to next level
    level = level + 1
    score = score + 500
    bullets = 10
    
    REM Reset enemy positions with increased difficulty
    e1x = 2
    e1y = 2
    e2x = 18
    e2y = 2
    e3x = 18
    e3y = 10
    
    gamestate = 0
    RETURN

GameOver:
    CLS
    PRINT AT 100 COLOR 7, "GAME OVER"
    PRINT AT 121 COLOR 7, "FINAL SCORE:"
    PRINT AT 141 COLOR 7, score
    
    REM Wait for input to restart
    FOR i = 1 TO 100
        WAIT
    NEXT i
    
    REM Restart game
    lives = 5
    score = 0
    level = 1
    GOSUB InitGame
    GOTO MainLoop
    
    END

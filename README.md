# Another One Bullet Hell Engine (GODOT)
My foolish version of creating bullet hell in godot 4.5. Still in development

### What is that?
It is longterm WIP project in which I slowly develop bullet hell "engine"

### TO DO List and Current known bugs
-Speed changes don't work as intended with stats ovverride\
-Most of the pattern types are not implemented yet\
-Wanna redo logic behind spawner types

## Documentation
**Basic Principles**\
-*Projectiles* only store movement, sprite and damage\
-All patterns are created via *ProjectileSpawners*\
-*ProjectileSpawners* operate trough *Types* and *Layers*
### Projectiles

**Projectile Properties**\
-Has *CMP_Move*, special component that handles movement\
-Has *Sprite* in which HFrames are colors and VFrames are shapes

**Projectile Stats - Basic**\
*Player Attack* - if true doesn't add to "Enemy Projectile" group\
*Damage* - duh\
*Life Time* - how long it exists before destroying itself

**Projectile Stats - Movement**\
*Speed* - duh\
*Post Rotation* - bonus rotation after each spawn

**Projectile Stats - SIN and COS**\
*Sin on X* - applies sin wave to X coordinate\
*Sin on Y* - applies sin wave to Y coordinate\
*Sin Grow* - controls how fast sin changes\
*Sin Frec* - controls frequency\
*Sin Amp* - controls amplitude

*Cos* equivalents are the same
### Projectile Spawners

**Spawner Properties**\
-Has scene to spawn\
-*Activated* decides if it activates immediately or you'll activate it through code

**Spawner Stats - Projectile stats**\
*Projectile Group* - assigns spawned projectiles to this group\
*Stats Override* - if projectile stats need to be overridden\
*Stats New* - resource with projectile stats\
*Rotation* - default rotation for projectiles\
*Post Rotation* - bonus rotation after each spawn

**Spawner Stats - Spawn type**\
*Spawn Type* - changes patterns in which bullet will spawn\
*Type Amount* - how much projectiles will be in this pattern\
*Type Cooldown* - cooldown between spawn of each projectile in pattern\
*Type Speed Change* - additively changes speed of each projectile in pattern\
*Type Centered* - if pattern needs to be centered\
*Type Gap* - distance between each projectile in pattern

**Spawner Stats - Spawn point**\
*Distance from Spawner* - changes where bullet will spawn\
*Distance Expand* - additively changes distance between bullet spawn and spawner after each spawn

**Spawner Stats - Layers**\
*Layers Infinite* - if layers need to be infinite\
*Layers Amount* - how many times pattern will repeat itself\
*Layers Cooldown* - cooldown between layers\
*Layers Speed Change* - additively changes speed of each projectile in layer

**Spawner Stats - Color**\
*Color* - duh\
*Color Cycle* - if you need to cycle trough multiple colors\
*Cycle in Types* - by default color change will appear only in next layer. This allows you to change color after each new bullet\
*Colors in Cycle* - array in which you create color change pattern

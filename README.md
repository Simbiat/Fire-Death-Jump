# Fire Death Jump
"Retheming" assignment done as part of Arcada's [Game Design and Production](https://www.arcada.fi/en/study-arcada/continuing-education/course-calendar/game-design-and-production) course.  
Using the [Game Maker'](https://gamemaker.io/) [Jump Fire](https://gamemaker.io/en/tutorials/fire-jump-dnd) template, apply the new theme of "Death is not the end".  
## Credits:
Design and coding: Dmitry Kustov
New graphical assets: Nguyen Tien
New sound assets: Jade Allen
## Changes already done:
1. Can press any key on starting screen, not just tap
2. Navigate menus using `up` and `down` keys (select with `space` or `enter` keys)
3. Use `escape` key to end ongoing game, return to menu, or quit (depending on what's currently on screen)
4. Use `shift` key to switch characters in the main menu
5. Button to create `foam` by tapping/clicking it (also supports `space` key, as in original)
6. Total (high)score, calculated based on `height`, civilians rescued (200 points) and fires put down with foam (100 points)
7. Adjusted UI on the main game and game over screens
8. `Ghost` variable on `obj_player` as a placeholder for future changes in mechanic
9. Removed death (switches to `ghost` mode instead)
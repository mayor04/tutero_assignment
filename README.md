# tutero_assignment

No changes made after deadline: Last commit apart from readme update was done 5:25 (IST) 

## Getting Started

This project is a basic asteroid game implemented for both windows and web


https://user-images.githubusercontent.com/67462604/163715640-85b5b943-43fd-4b9e-953e-f74ca9acbbd0.mp4

The video shows a mouse cursor due to the type of video recorder that was used


## Features 
1. A tracker ball that follows your mouse (Required For Levels 4-7) - ✅

2. Particles of variable size scattered across the screen (Required for all future levels) - ✅

3. Moving particles - ✅ Although the algorithm use for keeping positive particles could have been better

4. Collision-detection (Required For Level 5) - ✅ Completed but could be improved

5. Add a timer - X -
    Forgot to add this feature but in the UI before the deadline but it was implemented in the state management

6. Add a cursor (Required for level 7) - ✅
   Implemented this feature to allow cursor follow mouse

7. Support shooting on click
   ✅ 

8. Polygonal asteroids - X -
   Unable to complete before the deadline 
   
## Logic 
The application was implemented with a tickers for updating the state of the particles an bullet and also players. This application uses clean architecture and SOLID principle. The major approach was updating the positon of every object every frame. The game controller(view model) was in charge of building widget and the logic no bussiness logic was implemented in the view and every commuinication to the respective models were done through the controller

### Limitation
Allocated less than 7 hours on this project,  The time range given was totally fine 

### TODO
- Use keys to prevent unecessary rebuild
- Delete particles outside the screen and write algorithm to make them appear from outside the screen
- Write test for collision
- Remove unecessary for loop


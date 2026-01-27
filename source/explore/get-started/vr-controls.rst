#########################
Use Your VR Equipment
#########################

To get the best and most immersive experience in Overte, we encourage you to use VR equipment, such as the HTC Vive. With these HMD devices and hand controllers, you will be able to interact with people in 3D, track body movements, and engage with the objects around you. We support both OpenVR and OpenXR, which means we support most currently available HMDs and hand controllers.

We recommend you use SteamVR, which should allow you to use any VR equipment you choose. Monado and Wivrn are also supported, as are any OpenVR or OpenXR runtimes.

.. contents:: On This Page
    :depth: 2

------------------------
VR Controls
------------------------
                
.. image:: _images/controls-oculus.png

.. image:: _images/controls-vive.png
                
.. image:: _images/controls-wmr.png


------------------------
Comfort Mode
------------------------

Motion sickness is a real problem for many people when they put on a HMD and enter VR. This happens because your eyes experience movement in VR, while your body stands still. If you experience motion sickness and discomfort using VR equipment, you are not alone. 

"Comfort mode" is designed to decrease the effects of motion sickness while using Overte. This mode:

* Disables sharp turns 
* Decreases your field of vision by darkening the edges of the screen
* Adds a ground plane and grid

All of these features were developed to help you orient yourself when moving around in VR.

To enable comfort mode, go to **Menu > Settings > Controls** on your tablet. Use the slider to adjust how much of the environment you see in VR. 

.. image:: _images/comfort-mode.png

-----------------------------
Change How You Move in VR
-----------------------------

You can change many avatar movement settings in VR such as jumping, flying, and leaning behavior. To do so:

* In Desktop mode, go to **Settings > Controls** in the menu bar.
* In VR mode, open your Tablet and go to **Menu > Settings > Controls**.

+----------------------------+---------------------------------------------------------------------------------+
| Setting                    | Description                                                                     |
+============================+=================================================================================+
| *VR Movement* >            | Enables teleport controls to move seamlessly between positions within a domain. |
| Teleporting                |                                                                                 | 
+----------------------------+---------------------------------------------------------------------------------+
| *VR Movement* >            | Enables walking controls to move within a domain.                               |
| Walking                    |                                                                                 | 
+----------------------------+---------------------------------------------------------------------------------+
| *VR Movement* >            | Enables strafing controls (to walk sideways).                                   |
| Strafing                   |                                                                                 | 
+----------------------------+---------------------------------------------------------------------------------+
| *VR Movement* >            | Enables jump and fly controls.                                                  |
| Jumping and flying         |                                                                                 |
+----------------------------+---------------------------------------------------------------------------------+
| *VR Movement* >            | Enables floating when there is no longer a surface below your feet.             |
| Hover when unsupported     |                                                                                 |
+----------------------------+---------------------------------------------------------------------------------+
| *VR Movement* >            | This setting controls which direction you move in:                              |
| Movement Direction         |                                                                                 |
|                            | * **HMD-Relative**: Move in the direction your head is pointing.                |
|                            | * **Hand-Relative**: Move in the direction your dominant hand is pointing.      |
|                            | * **Hand-Relative (Leveled)**: Move in the direction your hand is pointing,     |
|                            |   without taking pitch into account.                                            |
+----------------------------+---------------------------------------------------------------------------------+
| *VR Movement* >            | Select 'Left' or 'Right'. Teleport and turn controls move to the controller     |
| Dominant Hand              | in the dominant hand.                                                           |
+----------------------------+---------------------------------------------------------------------------------+
| *VR Movement* >            | This setting controls how you turn in VR:                                       |
| Rotation Mode              |                                                                                 |
|                            | * **Snap turn**: Rotate your avatar sharply to the left or the right.           |
|                            | * **Smooth turn**: Rotate your avatar smoothly as you turn to the left or       |
|                            |   right.                                                                        |
|                            | * **Comfort mode**: Enable `comfort mode`_ and decrease the field of vision     |
|                            |   while moving in VR mode.                                                      |
+----------------------------+---------------------------------------------------------------------------------+
| *VR Movement* >            | This setting determines how you control your walking speed:                     |
| Control Scheme Selection   |                                                                                 |
|                            | * **Default**: Your walking speed will remain the same, no matter how far       |
|                            |   forward you push your controller's joystick. Fully pushing the joystick       |
|                            |   forward will make your avatar run.                                            |
|                            | * **Analog**: Your walking speed changes based on how far forward you push      |
|                            |   your controller's joystick. Fully pushing your joystick forward will make     |
|                            |   your avatar run.                                                              |
|                            | * **Analog++**: Your walking speed changes based on how far forward you push    |
|                            |   your controller's joystick. You can use the slider to change the maximum      |
|                            |   walking speed in meters/second. Fully pushing your joystick forward will make |
|                            |   your avatar run.                                                              |
+----------------------------+---------------------------------------------------------------------------------+
| *VR Movement* >            | When you lean, your avatar would naturally lean too. This setting dictates when |
| Allow my avatar to lean    | your avatar would stand still and lean, or if it would instead move to follow   |
|                            | your head's position.                                                           |
|                            |                                                                                 |
|                            | * **When I'm standing**:  When you are standing and lean your avatar will lean  |
|                            | too, but when you are seating or crouching your body will move with your head   |
|                            | position.                                                                       |
|                            | * **Always**: Your avatar will always lean as your head moves around; ideally   |
|                            | suited when you will stay in place and will not be walking around your play     |
|                            | space.                                                                          |
|                            | * **Never**: Whether standing, sitting or crouching your avatar will always     |
|                            | moved to follow your head position; ideal for room-scale VR.                     |
+----------------------------+---------------------------------------------------------------------------------+
| User real world height     | You can change your real world height for better tracking in VR mode.           |
| (in meters)                |                                                                                 |
+----------------------------+---------------------------------------------------------------------------------+



------------------------------------------
Motion Capture Using Vive Trackers
------------------------------------------

You can enhance your Overte experience using full body tracking (FBT), also known as full body motion capture (mocap). Overte currently supports FBT using any trackers compatible with OpenVR or OpenXR runtimes, including the HTC Vive Trackers.

.. note:: Whilst Overte supports full body tracking in both OpenVR and OpenXR, for best compatibility we recommend you use SteamVR runtime for accurate body tracking.

This section will focus exclusively on HTC Vive Trackers, but any full body trackers should work just as well.

Vive trackers need to be strapped to the body part you wish to track. You can replace the HMD and hand controllers with trackers if you only need to track the movement of your head and hands. 

You can set up different FBT systems:

+---------------------+--------------------------+---------------------------------------------------------+
| Mocap System        | Equipment Needed         | Recommended Straps                                      |
+=====================+==========================+=========================================================+
| Head                | HMD or 1 Vive Tracker    | Head strap for Vive Tracker                             |
+---------------------+--------------------------+---------------------------------------------------------+
| Hands               | Hand controllers or      | Hand strap for Vive Tracker                             |
|                     | 2 Vive Trackers          |                                                         |
+---------------------+--------------------------+---------------------------------------------------------+
| Head + Hands +      | 2 Vive Trackers + HMD +  | Foot straps                                             |
| Feet                | 2 Hand Controllers       |                                                         |
+---------------------+--------------------------+---------------------------------------------------------+
| Head + Hands +      | 3 Vive Trackers + HMD +  | Hip Strap: Drill a hole in the back of a thick leather  |
| Feet + Hips         | 2 Hand Controllers       | belt and attach the tracker using a 1/4" screw.         |
+---------------------+--------------------------+---------------------------------------------------------+
| Head + Hands +      | 4 Vive Trackers + HMD +  | Chest straps                                            |
| Feet + Hips + Chest | 2 Hand Controllers       |                                                         |
+---------------------+--------------------------+---------------------------------------------------------+
| Head + Hands +      | 5 Vive Trackers + HMD +  | Shoulder straps                                         |
| Feet + Hips +       | 2 Hand Controllers       |                                                         |
| Shoulders           |                          |                                                         |
+---------------------+--------------------------+---------------------------------------------------------+

.. note:: You can replace the HMD and hand controllers with trackers if you only need to track the movement of your head and hands.

.. image:: _images/tracker-placement.jpg

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Configure Your Mocap System
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Strap your Vive trackers to your body as shown in the image.
2. Connect your trackers, HMD, and controllers to SteamVR.
3. In Interface, pull up your HUD or Tablet and go to **Menu > Settings > Calibration**.
4. Configure your full body tracking system by:

   * Selecting the right device for your head and hands. If you're using a head tracker instead of an HMD, click 'Use HTC Vive Devices in Desktop Mode'.
   * Selecting the body position of any additional trackers. 
   
   .. image:: _images/vive-config.PNG
   
5. Click 'Apply and Calibrate'.
6. Stand in a T-Pose until the timer counts down to zero:

   * Feet together
   * Arms out
   * Head looking straight ahead.
   
7. Check to see that each tracker is tracking the corresponding joint on your avatar. 
8. You can also calibrate your trackers without using your tablet. Once you apply your configuration, stand in a T-Pose and hold the following four buttons together for 1 second: Left Trigger, Right Trigger, Left Menu Button, Right Menu Button. You can press the same buttons together for a second to remove your calibration from the trackers.

.. note:: When you setup your Vive, you choose which way to point the arrow as your reference. During calibration,  it is important that you face the same direction. If you can not remember the arrow's direction, press the Vive System Menu Button and look on the ground for a marker. This is important to make sure your joints are oriented correctly.

^^^^^^^^^^^^^^^^^^^^
Troubleshooting 
^^^^^^^^^^^^^^^^^^^^

+---------------------------------+-------------------------------------------------------------------------------------------+
| Issue                           | Troubleshooting Steps                                                                     |
+=================================+===========================================================================================+
| My calibration failed           | * Check if your trackers are properly connected in SteamVR.                               |
|                                 | * Have you selected the correct configuration in your tablet and do you have enough       |
|                                 |   number of trackers to support that configuration?                                       |
|                                 | * If you are performing and not in HMD, did you select to 'Use HTC Vive in Desktop Mode'? |
|                                 | * Are any of the trackers blinking? If so, they may need to be paired again.              |
|                                 | * Do you have the correct number of dongles plugged in to your computer? You will need    |
|                                 |   one dongle per tracker. If you are performing with all 7, then you may need a USB hub   |
|                                 |   to handle them.                                                                         |
+---------------------------------+-------------------------------------------------------------------------------------------+
| My sensor is jiggling a lot     | Make sure the straps on the sensor are tightened.                                         |
+---------------------------------+-------------------------------------------------------------------------------------------+
| My sensor keeps losing tracking | * If it’s the hip tracker, is your shirt is tucked in and not covering the puck? Also     |
|                                 |   make sure your headphone cord isn’t covering the puck.                                  |
|                                 | * Can the base stations clearly see the tracker?                                          |
|                                 | * Is the signal from the base station conflicting with another Vive setup nearby?         |
|                                 | * Are you clear of reflective surfaces nearby? (such as picture frames, whiteboards,      |
|                                 |   shiny tables).                                                                          |
|                                 | * Is the lighting consistent across the room (minimal outdoor lighting)?                  |
|                                 | * Try restarting SteamVR.                                                                 |
+---------------------------------+-------------------------------------------------------------------------------------------+

.. note:: Remember to charge your trackers when you aren't using them so that you don't have to deal with a low battery tracker negatively impacting your performance.

-------------------------
Gamepad
-------------------------

If your HMD does not come equipped with hand controllers, you can use a gamepad. However, Overte is best experienced with VR equipment or the keyboard in Desktop mode.

.. image:: _images/controls-gamepad.png


**See Also**

+ :doc:`Interact with Your Environment <../interact>`
+ :doc:`Explore in Desktop Mode <desktop>`

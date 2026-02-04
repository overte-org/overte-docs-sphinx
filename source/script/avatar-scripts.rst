##############
Avatar Scripts
##############

Avatar scripts are bound to an avatar. This means that they run when a user puts on a specific avatar. Likewise, avatar scripts stop running when the avatar is removed or changed. Other users in the domain will be able to see the script in action, but they will not be able to run the script themselves.	

With avatar scripts, you can do things like make your hair flow or create particle clouds around your avatar.

.. contents:: On This Page
    :depth: 2

--------------------
Add an Avatar Script
--------------------

There are two different ways you can add an avatar script to your FST file: either by using our Package Model tool or by manually adding the script.

To add an avatar script using the Package Model tools:
1. Create a folder called ``scripts`` in the same location as your FBX, GLB, or glTF file.
2. Copy your avatar script into this new folder.
3. In Interface, go to **Edit > Package Model as .fst**
4. For 'Script Directory', enter the path to the ``scripts`` folder you created above.

To add an avatar script manually:
1. Open the FST file for your avatar in the text editor of your choice.
2. Add a line telling the avatar where to find the script file using the syntax ``script = [SCRIPT URL]``.

.. image:: _images/add-script.png

You can add multiple scripts to your avatar by adding multiple ``script = url`` lines.

---------------------------
Example of an Avatar Script
---------------------------

The following script makes your avatar throw balls when its right hand moves.

.. code-block:: javascript

    (function(){
        "use strict"
        let triggerDistance = 0.0;
        const TRIGGER_THRESHOLD = 0.9;
        const LOAD_THRESHOLD = 0.6
        const rightHandIndex = MyAvatar.getJointIndex("RightHand");
        const rightArmIndex = MyAvatar.getJointIndex("RightArm");
        let triggered = false;

        function fireBall(position, speed) {
            const baseID = Entities.addEntity({
                type: "Sphere",
                color: { blue: 128, green: 128, red: 20 },
                dimensions: { x: 0.1, y: 0.1, z: 0.1 },
                position: position,
                dynamic: true,
                collisionless: false,
                lifetime: 10, // Thrown fireball will despawn after 10 seconds
                gravity: speed,
                userData: "{ \"grabbableKey\": { \"grabbable\": true, \"kinematic\": false } }"
            });
            Entities.editEntity(baseID, { velocity: speed });
        }

        // VR users can push their right hand forwards from their shoulder to throw
        Script.update.connect(function() {
            const rightHandPos = MyAvatar.getJointPosition(rightHandIndex);
            const rightArmPos = MyAvatar.getJointPosition(rightArmIndex);
            const fireDir = Vec3.subtract(rightHandPos, rightArmPos);
            const distance = Vec3.length(fireDir);
            triggerDistance = distance > triggerDistance ? distance : triggerDistance;
            if (!triggered) {
                if (distance < LOAD_THRESHOLD * triggerDistance) {
                    triggered = true;
                }
            } else if (distance > TRIGGER_THRESHOLD * triggerDistance) {
                triggered = false;
                fireBall(rightHandPos, Vec3.normalize(fireDir));
            }
        });
        MyAvatar.scaleChanged.connect(function () {
            triggerDistance = 0.0;
        });

        // Desktop users can press and release "x" to throw
        function keyReleaseEvent(event) {
            if ((event.text.toUpperCase() === "X") && !event.isAutoRepeat && !event.isShifted && !event.isMeta && !event.isControl && !event.isAlt) {
                const rightHandPos = MyAvatar.getJointPosition(rightHandIndex);
                const rightArmPos = MyAvatar.getJointPosition(rightArmIndex);
                const fireDir = getPointingDirection();
                fireBall(rightHandPos, Vec3.normalize(fireDir));
            }
        }
        // Runs desktop function whenever (any) key is released
        Controller.keyReleaseEvent.connect(keyReleaseEvent);
        // It is a good idea to clean up when the script stops
        Script.scriptEnding.connect(function () {
            print("removing key mapping");
            Controller.keyReleaseEvent.disconnect(keyReleaseEvent);
        });
    }());


This example script uses the `MyAvatar <https://apidocs.overte.org/MyAvatar.html>`_ namespace to determine if your avatar's hand moves. Upon detecting movement, the script makes your avatar launch balls. It also uses some other namespaces such as `Entities <https://apidocs.overte.org/Entities.html>`_ (to create the ball you will launch) and `Vec3 <https://apidocs.overte.org/Vec3.html>`_ (to determine the right positions and distances). Add it to your avatar to see how it works.

**See Also**

- `Get Started with Scripting <get-started-with-scripting>`_
- `Write Your Own Scripts <write-scripts>`_
- `API Reference <https://apidocs.overte.org>`_

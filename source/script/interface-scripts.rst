#################
Interface Scripts
#################

Interface scripts run on your local machine, as long as you have Interface up and running. Each user has full control over when interface scripts are started and stopped. The results (such as when your script changes the color of a box) can be seen by everyone in your domain, but the script itself is running on your local machine. Your Interface will communicate that information to the Entity Server, which will communicate it to whoever is visiting the domain. 

With interface scripts, you can do things like add new menus to the Interface, add plug-ins, or add 3D overlays that you have control over.

.. contents:: On This Page
    :depth: 2

------------------------
Load an Interface Script
------------------------

To load and run an interface script:

1. In Interface, go to **Edit > Running Scripts** or press :kbd:`Ctrl+J` on your keyboard.
2. For scripts hosted on the internet, click **From URL**. Enter the URL of your script file and click **OK**.
3. For scripts on your local computer, click **From Disk**. Browse to your script file and click **Open**.

------------------------------
Example of an Interface Script
------------------------------

The following script creates a light cube of a randomised colour in front of you when you load it, and shows how you can spawn a text entity whenever you switch into or out of VR.

.. code-block:: javascript
   :caption: **example-interface-script.js**

    "use strict"

    // Generate a random colour
    function generateColour() {
        const randNum = () => (Math.random() * 256) | 0;
        return [randNum(), randNum(), randNum()];
    }

    // Generate a random colour
    const colour = generateColour();

    // Spawn a bright cube
    const entityID = Entities.addEntity({
        type: "Box",
        name: "example colour box",
        position: Vec3.sum(MyAvatar.position, Vec3.multiplyQbyV(MyAvatar.orientation, { x: 0, y: 0, z: -2 })),
        dimensions: { x: 0.5, y: 0.5, z: 0.5 },
        unlit: true, // Cube will always be fully lit
        billboardMode: "yaw", // Cube will always face you
        color: colour, // random colour generated earlier
        canCastShadow: false, // Cube will not block light
        lifetime: 300  // Delete after 5 minutes.
    }, "avatar");

    // spawn a light inside the cube
    const lightID = Entities.addEntity({
        type: "Light",
        name: "example colour light",
        position: Vec3.sum(MyAvatar.position, Vec3.multiplyQbyV(MyAvatar.orientation, { x: 0, y: 0, z: -2 })),
        dimensions: { x: 20, y: 20, z: 20 },
        parentID: entityID, // Will be a child of the cube entity
        color: colour, // random colour generated earlier
        intensity: 10, // brightness
        falloffRadius: 1.3, // Light intensity reduced by 25% this far out
        lifetime: 300  // Delete after 5 minutes.
    }, "avatar");

    // Display some text welcoming you to your new mode when switching in and out of VR
    HMD.displayModeChanged.connect(function(isHMDMode) {
        if (isHMDMode) {
            print("Welcome to VR!");
            Entities.addEntity({
                type: "Text",
                name: "example text",
                position: Vec3.sum(MyAvatar.position, Vec3.multiplyQbyV(MyAvatar.orientation, { x: 0, y: 0, z: -2 })),
                dimensions: { x: 1.0, y: 0.1, z: 0.5 },
                text: "Welcome to VR!",
                unlit: true, // Text will be fully lit
                billboardMode: "yaw", // Text will always face you
                lifetime: 30  // Delete after 30 seconds.
            }, "local"); // Text is only visible to you
            print("Entity created: " + entityID);
        } else {
            print("Welcome to Desktop!");
            Entities.addEntity({
                type: "Text",
                name: "example text",
                position: Vec3.sum(MyAvatar.position, Vec3.multiplyQbyV(MyAvatar.orientation, { x: 0, y: 0, z: -2 })),
                dimensions: { x: 1.0, y: 0.1, z: 0.5 },
                text: "Welcome to Desktop!",
                unlit: true, // Text will be fully lit
                billboardMode: "yaw", // Text will always face you
                lifetime: 30  // Delete after 30 seconds.
            }, "local"); // Text is only visible to you
            print("Entity created: " + entityID);
        }

    });

    // Clean up when the script stops running
    Script.scriptEnding.connect(function() {
        Entities.deleteEntity(entityID); // Removes the Box entity, including its child Light entity.
    });



**See Also**

- `Get Started with Scripting <get-started-with-scripting>`_
- `Write Your Own Scripts <write-scripts>`_

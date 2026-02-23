#####################
Client Entity Scripts
#####################

You can make content in Overte interactive by attaching scripts to entities. *Client entity scripts* are entity scripts that run locally on each user's computer. When a user encounters the entity by loading it into view, it will "preload" (or run) the script, then "unload" (or stop) the script when the user leaves.

There can be (and typically are) multiple entities in a domain, and each one can have a different client entity script associated with it.

As each client entity script will run on all users' clients simultaneously, it is most suitable for responding to each user interacting with it. If you want to control its behaviour independently, you can give it a brain using a :doc:`server entity script <server-entity-scripts>`.

.. contents:: On This Page
    :depth: 2

------------------------------------------
Attach a Client Entity Script to an Entity
------------------------------------------

To attach a client entity script to an entity:

1. In Interface, pull up your tablet or HUD and go to **Create**.
2. Select the entity you'd like to script by either clicking on it in Interface or finding it in the 'Entity List'.
3. In the **Create** app, go to the 'Properties' tab and select the Scripts icon. |scripts-icon|
4. For Script, enter the URL to your client entity script.

.. note:: For client entity scripts, the URL content must be available to every user who visits the domain. This means the URL should be a public http(s) URL, or an Asset Server (ATP) URL for the domain. It cannot be a file URL. The script property also accepts a string as input, allowing you to insert the code directly.

.. |scripts-icon| image:: _images/create-properties-scripts-icon.png
   :height: 4ex
   :class: no-scaled-link inline
   :alt: paper and quill icon

---------------------------------
Example of a Client Entity Script
---------------------------------

The following script changes the color of a non-model entity (such as a box or a sphere) when you click on it: 

.. code-block:: javascript

    (function () {
        "use strict"
        let clicked = false;
        this.clickDownOnEntity = function (entityID, mouseEvent) {
            if (clicked){
                Entities.editEntity(entityID, { color: { red: 0, green: 255, blue: 255} });
                clicked = false;
            } else {
                Entities.editEntity(entityID, { color: { red: 255, green: 255, blue: 0} });
                clicked = true;
            }
        };
    });

This example is written as a JavaScript class prototype function, and it uses the mouse event `clickDownOnEntity() <https://apidocs.overte.org/Entities.html#.sendClickDownOnEntity>`_. When the user clicks on an entity, ``clickDownOnEntity()`` triggers the function associated with that click event. In this case, it changes the entity's color back and forth between yellow and magenta.

.. note::
    In the above example we include ``"use strict"`` on the first line of the client entity script to enable `strict mode <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode>`_ . This must be inside the class prototype function, not the first line of the file as in other scripts.

**See Also**

- `Get Started with Scripting <get-started-with-scripting>`_
- `Write Your Own Scripts <write-scripts>`_
- `API Reference <https://apidocs.overte.org>`_

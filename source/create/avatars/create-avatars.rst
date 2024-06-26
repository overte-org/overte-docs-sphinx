.. warning::
    This document is outdated and will be revisited in the future.
    FIXME: Mentions services like VRoid Studio even though their skeletons have never been supported (the Unity avatar exporter will not be able to fix that)

##############################
Create Your Own Avatar
##############################

There are three ways to get your own avatar. You can either:

* Create your avatar from scratch using 3D modeling tools such as Mixamo and Blender
* Use MakeHuman or VRoid Studio to create a human or anime avatar
* Download an existing avatar from external sources such as TurboSquid or CGTrader

.. note:: If you get an avatar from an external source such as TurboSquid, CGTrader, MakeHuman, or VRoid Studio, it is likely that the skeleton does not match our :doc:`avatar standards <avatar-standards>`. To use these avatars with Overte, use the `Overte Avatar Exporter for Unity <find-avatars.html#overte-avatar-exporter-for-unity>`_ to correctly map the skeleton and package your avatar.

If you want to create an avatar from scratch, this page covers the steps needed to create, rig, and package your avatar. Learn more about the :doc:`security of your assets <../../security/asset-security>`.

.. contents:: On This Page
    :depth: 2

**In This Section**

.. toctree::
    :maxdepth: 2
    :titlesonly:

    Avatar Standards Guide <avatar-standards>

-------------------------------------
Create an Avatar from Scratch
-------------------------------------

The steps involved in creating your avatar are:

1. Create an avatar with 3D character modeling tool such as Blender or Maya.
2. Rig and animate your avatar with an animation tool such as Mixamo.
3. Fine tune your avatar using a tool such as Blender or Maya.
4. Package the model in Overte for use as an avatar.

* :doc:`Rig Your Avatar in Mixamo <mixamo-tutorial>`
* :doc:`Modify Materials and Textures with Blender <blender-tutorial>`

-------------------------------
Community Tools for Avatars
-------------------------------

As you're creating your avatar, remember that Overte is an open-source project. Many of our community members have created plug-ins, add-ons, toolkits, skeletons and more to help you create content, including avatars. Here are a few for you to play around with.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
`Blender Add-on by Menithal <https://github.com/Menithal/Blender-Metaverse-Addon>`_
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Plugin ("Project Hermes") is a plugin for Blender to allow for easier content creation and importing for the Overte Platform. It features:

- **Material Tools**: Allows for easier pipeline to apply materials to objects so that they are ready to use in Overte.
- **Armature Tools**: Adds a skeleton that is compatible with Overte and let you configure bone names for use in advanced scripts.
- **Avatar Converters**: Translates and fixes models and materials from MMD and Mixamo so that they work in Overte.
- **Export Tools**: Exports avatars and scenes so that they can be used in Overte.
- **Import Tools**: Imports primitive entities from Overte so that you can make modifications to them.

Install it here: `https://github.com/Menithal/Blender-Metaverse-Addon <https://github.com/Menithal/Blender-Metaverse-Addon>`_

Have a project you've been working on that you'd like us to share? Let us know by editing this page in GitHub!


**See Also**

+ :doc:`Find and Use an Existing Avatar <find-avatars>`
+ :doc:`Package and Host Your Avatar <package-avatar>`

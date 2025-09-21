.. warning::
    Parts of this document are outdated and will be revisited in the future.

##############################
Create Your Own Avatar
##############################

There are three ways to get your own avatar. You can either:

* Create your avatar from scratch using 3D modeling tools such as Mixamo and Blender.
* Download an existing avatar from external sources and modify it to conform to Overte's avatar standards using Unity avatar importer tool or Blender.

.. note:: If you get an avatar from an external source such as TurboSquid, CGTrader, MakeHuman, or VRoid Studio, it is likely that the skeleton does not match our :doc:`avatar standards <avatar-standards>`. To use these avatars with Overte, use the `Overte Avatar Exporter for Unity <find-avatars.html#overte-avatar-exporter-for-unity>`_ to correctly map the skeleton and package your avatar. The avatar can also be bodified using Blender to conform to Overte's avatar standards. For more information ad video tutorial check `Blender Avatar import tutorial <blender-tutorial>`_. Unity Avatar Exporter might not be able to export avatars with very unusual armatures, and in such cases reworking armature in Blender might be needed.

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
2. Rig your avatar with an animation tool such as Blender or Mixamo. When rigging avatar with Blender, bone names and orientations must conform to `Avatar Standards Guide <avatar-standards>`.
3. Optionally create custom animations for the avatar (most avatars work well with default animations). 
4. Fine tune your avatar using a tool such as Blender or Maya.
5. Optionally add .fst metadata file containing informations such as flow bone setups and avatar scripts.

* :doc:`Rig Your Avatar in Mixamo <mixamo-tutorial>`
* :doc:`Modify Materials and Textures with Blender <blender-tutorial>`

-------------------------------
Community Tools for Avatars
-------------------------------

As you're creating your avatar, remember that Overte is an open-source project. Many of our community members have created plug-ins, add-ons, toolkits, skeletons and more to help you create content, including avatars. Here are a few for you to play around with.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
`Blender Add-on by Menithal <https://github.com/Menithal/Blender-Metaverse-Addon>`_
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. warning::
    This tool is outddated and needs upgrading to current Blender version. Use Unity avatar importer or Blender (without addons) instead.


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

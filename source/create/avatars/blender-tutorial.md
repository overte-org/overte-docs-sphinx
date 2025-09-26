# Workflow for importing avatars to Overte using Blender

Overte avatars can be created or imported using Blender without any non-standard addons. Preferred export format for avatars using PBR materials is GLB/glTF. Some materials in models exported as FBX may not render correctly.

Typical workflow of importing avatar to Overte using Blender consists of following steps:

1. Import avatar model to Blender.
2. Rename bones according to example armature in [Avatar Standards Guide](avatar-standards).
3. Modify bone rolls so that they are the same as in the Avatar Standards Guide.
4. Set up materials for glTF export.
5. Rename flow bones.
6. Rename blendshapes according to Avatar Standards Guide.
7. Export avatar as GLB/glTF file.
8. Create FST file and setup Flow bones if desired.

# Video tutorial:

Full workflow of modifying an avatar to conform to Overte avatar standards, exporting it as GLB file, creating FST file and setting up the Flow: [https://www.youtube.com/watch?v=IFuZWNppXZY](https://www.youtube.com/watch?v=IFuZWNppXZY)

# Tutorial: Modify Materials and Textures Using Blender

<div class="admonition warning">
    <p class="admonition-title">Warning</p>
    <p>This tutorial is outdated. GLB/glTF models are currently remommended over FBX. FIXME: Contains HiFi hosted content, Blender changed a LOT</p>
</div>

Blender is an open-source 3D modeling tool that you can use to fine tune your avatar and ensure that the materials and textures render correctly in Overte.

In this tutorial, we will walk you through simple modifications you can make to your avatar using Blender. You will need to import an FBX file for your avatar. If you don't have one, see our tutorial for [Mixamo](mixamo-tutorial).

1. In Blender, go to **File > Import > FBX (.fbx)**.
2. Choose your avatar's FBX file and click 'Import FBX'. This will open your avatar in the main view. ![](_images/import-avatar.png)
3. By default, you will not see the materials on your avatar. You can change your view using the toolbar at the bottom of the view. ![](_images/view-materials.png)
4. To get a better view of your avatar, change the lamp settings:
    - From the Outliner, click the Lamp node in Blender.
    - For 'Type of Active Data to display and edit', choose the 'Data' icon.
    - Change the lamp to Sun.
    - Rotate the Lamp to light up your avatar.![](_images/lamp-settings.png)
5. From the Outliner, open the 'Armature' tree and select the item you want to fine tune. You can also click on the item directly on your model.
6. Using the toolbox below, you can change the materials and texture of each body part as desired. We've included an example below that [changes our avatar's eyelashes](#example-update-eyelashes-from-an-image). You can follow similar steps for other avatar items.
    ![](_images/texture-material.png)
    <div class="admonition note">
        <p class="admonition-title">Note</p>
        <p>To remove a metallic feel to your avatar in Overte, we recommend changing the default Specular Intensity for each of the main body parts from 0.500 to 0.000.</p>
    </div>
7. When you're done changing your materials and textures, go to **File > Export > FBX (.fbx)**.
8. Change the 'Path Mode' to 'Copy', then click the 'Embed Textures' icon. This makes sure that all of the textures are embedded into your model. ![](_images/blender-export.png)
9. Give your avatar a unique name.
10. Click the 'Export FBX' button.

Now, you are ready to bring your avatar into Overte.

## Example: Update Eyelashes from an Image

<div class="admonition warning">
    <p class="admonition-title">Warning</p>
    <p>This tutorial is outdated. GLB/glTF models are currently remommended over FBX. FIXME: Contains HiFi hosted content, Blender changed a LOT</p>
</div>

1. Save [this texture](http://hifi-content.s3.amazonaws.com/DomainContent/Event%20/Images/mixamo_eyelashes.png) to a directory where you will remember.
2. From the Outliner, open the 'Armature' tree and select 'Eyelashes'.
3. In the Toolbox below, click the 'Materials' icon. ![](_images/materials-tab.png)
4. Click the '+' button next to the material list to create a new material slot.
5. Click '+ New' to add a new material.
6. Rename the new material to 'lashes'.
7. At the bottom of the Blender window, switch to 'Edit Mode'. ![](_images/edit-mode.png)
8. Under the material list, click 'Assign'.
9. Scroll to the 'Transparency' section. Check the Transparency box and change the 'Alpha' value to `0.00`. ![](_images/transparency-setting.png)
10. Scroll to the 'Specular' section. Set the specular color to black. ![](_images/specular-setting.png)
11. Change to the 'Textures' view. ![](_images/texture-tab.png)
12. Click '+ New' to add a new texture.
13. Scroll to the Image section. Click 'Open' and find the lashes texture named 'mixamo_eyelashes' you previously downloaded. Click 'Open Image'. ![](_images/image-setting.png)
14. Check the 'Alpha' options in the following sections: Image, Preview, Texture, Influence
15. Go to **File > External Data > Pack All Into .blend**. This will include the texture in your model.

**See Also**

+ [Tutorial: Rig Your Avatar in Mixamo](mixamo-tutorial)
+ [Create Your Own Avatar](create-avatars)

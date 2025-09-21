-<div class="admonition warning">
-    <p class="admonition-title">Warning</p>
-    <p>This document is outdated. FIXME: mentions JSON for wearables, which is not documented anywhere?</p>
-</div>


# Wearables

Wearables are objects that attach to your avatar. They can be hats, skirts, glasses, headphones and anything else that can accessorize your look in-world. You can express your individuality by creating wearables of your own and [putting them on](../explore/personalize/add-wearables).

Overte supports soft and hard wearables. Soft wearables deform together with the avatar, so they need to share same or very similar armature. Hard wearables don't deform, and instead attach to chosen bone of the armature. As an example hat can be a hard wearable that attaches to `Head` bone.

Before you can use a custom wearable, you must first host its GLB/glTF/FBX and JSON files in a place that is publicly accessible to Overte. You can use any HTTP/HTTPS server or cloud platforms including Cloudflare R2, Amazon S3, Google Cloud Storage, Microsoft Azure, Catbox, etc.

## Build a Custom Wearable
Wearables are simply [3D models](3d-models) that are customized to fit on your avatar. Therefore, the first step in creating your wearable is to build one or find an existing model that you want to use.

There are a few different applications you can use to build and edit the 3D model for your wearable, including:
* [Blender](https://www.blender.org)
* [Maya](https://www.autodesk.com/products/maya/overview)
* [Google Blocks](https://vr.google.com/blocks)
* [Oculus Medium](https://www.oculus.com/medium)
* [Tiltbrush](https://www.tiltbrush.com)

Some guidelines to follow when you're building soft wearables like clothes:

+ Your soft wearable should be designed to fit a particular type of avatar. Since avatars vary in size and structure, a soft wearable designed to fit one avatar may not fit another one as well.
+ The soft wearable should be slightly larger than the avatar to avoid clipping. Clipping is when one 3D object goes through another 3D object without colliding.
+ Your soft wearable's shape should match the avatar's.
+ Armature of the wearable needs to be similar or same as avatar's armature.
+ The soft wearable's mesh should have similar or the same weights as the avatar.

When building your model, be sure to [follow these guidelines](3d-models/get-model) to ensure that it is compatible with Overte.  Once you're done editing your model, export the file as an GLB, glTF, FBX or OBJ file. You've now created your own custom model!

After hosting your wearable in the cloud [put it on](../explore/personalize/add-wearables) and adopt your new look.

<div class="admonition note">
    <p class="admonition-title">Note</p>
    <p>If you're creating a wearable to share, make sure it will fit the default wooden mannequin avatar (unless you are specifically making it to go with a very specific base avatar model). This will ensure that the wearable will work with most avatars in Overte.</p>
</div>


**See Also**

+ [Get Your 3D Model](3d-models/get-model)
+ [Put On Wearables](../explore/personalize/add-wearables)

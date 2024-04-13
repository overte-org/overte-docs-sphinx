###############################
Asset Security
###############################

Like a web browser, Overte allows you to bring together assets like models and images from external sources and share them with others. This allows you to create diverse domains and wear unique avatars using simple URLs. When you connect to a domain, your client will download and display entities and avatars using those links, just as a web browser loads an image.

However, it is not always desirable to allow others to trivially copy your content or avatars by URL. We encourage collaborative building and sharing of assets following their licenses, but we understand that content creators may want to keep their assets private and that avatars are often personal representations that are not meant to be copied.

Since Overte is open source, it is difficult to solve this problem completely. Bad actors will always be able to modify their clients or rip assets directly from memory. We can only aim to make it more difficult for them. We have outlined some of the tools we offer below and are always open to more suggestions and especially PRs.

.. contents:: On This Page
    :depth: 2

----------------------
Entities
----------------------

Multiple types of Entities refer to external assets such as models, images, shaders, sounds, etc. These URLs are most commonly accessed via the **Create** app. You can prevent a visitor to your domain from using Create by revoking their **Rez** and **Rez Temporary** :doc:`permissions <../host/configure-settings/permission-settings>`.

However, even if a user doesn't have Rez permission and can't access Create, the URLs can still be accessed via scripts. You can prevent scripts from accessing these URLs by revoking a user's **Can View Asset URLs** permission.

These protections are **client-side only**. This means that a malicious person with a modified client could circumvent them. There are two other methods for protecting your assets:

* For models and images, bake your assets using the :doc:`Oven <../host/add-content/bake-content>`. As a side effect of compressing and optimizing them, the Oven makes it harder (**but not impossible**) to open these files in other programs.
* Use the **Asset Server**. If you upload content to the asset server, it will provide you an `atp` link which only works within your domain.

----------------------------------
Avatars
----------------------------------

Non-built-in scripts are prevented from directly reading your avatar's URL. You can grant permission to read your avatar URL on a per-script basis, so untrusted scripts cannot grab it.

Clients do not have access to other people's avatar URLs via scripts at all (unless they have modified their client).

----------------------------------
Proposed Alternatives
----------------------------------

Asset security is extremely important and we recognize that the above might not be sufficient for everyone. Below are some alternatives that have been suggested and their pros and cons.

We strive to provide as many options as possible and contributions to increase security are very welcome. However, note that even with many of the below suggestions, at some point, any model, image, or resource will end up on a client and a sufficiently motivated person will be able to access it.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Have the Domain Server Obfuscate URLs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Instead of sending URLs, the Domain Server could itself download the assets and send data directly to clients.

For avatars, while this would prevent trivial copying of URLs, it opens domain operators up to legal consequences for serving copyrighted or illegal content.

For entities, this is effectively what the Asset Server already does, if you choose to use it. It is important to carefully control who has Rez permission in your domain to avoid the above legal trouble.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Peer-to-Peer Avatar Sharing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Users could share their avatars via a peer-to-peer network, either via the Domain Server or directly with other clients.

Like the above, this opens others up to legal trouble for sharing copyrighted or illegal content. Additionally, peer-to-peer traffic can lead to legal consequences for people in many countries and institutions (e.g. schools) even if the content itself is not illegal.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Server-side Avatar Verification
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The Avatar Mixer, before sending your Avatar URL to others, could verify that you actually own it.

This was a feature of High Fidelity's marketplace, where the Avatar Mixer could check the certification of your avatar and only send it to others if you actually owned it. We no longer support High Fidelity's centralized marketplace or certificates, so this was removed. It was also trivial to download the FST, strip out the certification, and re-upload it. More complex checks, like fingerprinting based on actual vertices, are computationally expensive and still possible to work around.

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Avatar Viewing Permissions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In an FST, you could optionally specify permissions for who is allowed to view your avatar, and a fallback URL for those who aren't allowed.

This would allow you to show your true avatar only to trusted friends. The Avatar Mixer would check the permissions for each connection before sending the URLs.

Although there are technical questions about how this would work with differently-rigged or differently-sized avatars for the fallback, and it can be confusing to have others not be able to see your true avatar, this would be a nice option to have for those who want it.

################################
Add a Procedural Particle Entity
################################

Particles are a powerful tool for creating a variety of effects. When you add a Particle Entity via **Create**, you will be asked if you want it to be procedural or not. 

**Non-procedural particles** are represented by the `ParticleEffect` `EntityType <https://apidocs.overte.org/Entities.html#.EntityType>`_. They have many configuration options (see `EntityProperties-ParticleEffect <https://apidocs.overte.org/Entities.html#.EntityProperties-ParticleEffect>`_) and are suitable for many situations. However, they also have a few limitations, including only supporting up to 100,000 particles / entity, only allowing flat, billboarded, quads, and moving via euler integration (position + velocity + acceleration).

If you instead create a **procedural particle** entity, you will get an entity with the `ProceduralParticleEffect` `EntityType <https://apidocs.overte.org/Entities.html#.EntityType>`_. This gives you fine-grained control over a GPU particle system using procedural shaders for updating and rendering, plus higher per-system limits (up to millions of particles). Procedural particles have a different set of properties (see `EntityProperties-ProceduralParticleEffect <https://apidocs.overte.org/Entities.html#.EntityProperties-ProceduralParticleEffect>`_).

Before continuing, make sure you are familiar with the :doc:`Procedural Shaders Guide <../materials/procedural-shaders>` for a more detailed walkthrough of our shaders.

All particle shaders also expose global defines for ``NUM_PARTICLES``, ``NUM_TRIS_PER_PARTICLE``, and ``NUM_UPDATE_PROPS``.

.. contents:: On This Page
    :depth: 2


---------
Rendering
---------

The visual representation of your particles is controlled by the ``particleRenderData`` property. You must implement both a vertex and fragment shader.

The vertex shader must implement:

.. code-block:: glsl

    vec3 getProceduralVertex(const int particleID)

Which returns the world space position of the vertex. By default, 1 triangle is drawn per particle, so that function will be run 3 times per particle (with different gl_VertexIDs), but this can be controlled by ``numTrianglesPerParticle``.

The fragment shader must implement one of the same functions as our existing procedural materials depending on version:

.. code-block:: glsl

    vec3 getProceduralColor()
    float getProceduralColors(inout vec3 diffuse, inout vec3 specular, inout float shininess)
    float getProceduralFragment(inout ProceduralFragment proceduralData)
    float getProceduralFragmentWithPosition(inout ProceduralFragmentWithPosition proceduralData)

In the fragment shader, ``particleID`` is available as a global variable.

One difference between procedural particles and procedural materials on other entities is that particles do not have per-fragment normals or UVs defined by default. You must calculate them yourself if you want lit or textured particles.

.. note:: Computing normals and UVs manually in shaders can be difficult. In the future, we will provide alternative starting shapes that come with normals and UVs.

As with procedural material vertex shaders, you can control the bounding box, which is used for culling, by changing the dimensions of the entity.

Like non-procedural particles, transparent procedural particles (``particleTransparent == true``) render with additive blending.


-------
Updates
-------

Per-particle updates are optional. They can be used to store persistent per-particle data across frames or reduce calculations in the rendering shaders. To activate updates, set ``numUpdateProps > 0`` (max is 5) and you must provide a fragment shader as part of ``particleUpdateData``.

Each "update prop" is a per-particle vec4 of ``float`` values. The update shader must define:

.. code-block:: glsl

    void updateParticleProps(const int particleID, inout ParticleUpdateProps particleProps)

``particleProps`` will contain as many update props as you specified. For example, if ``numUpdateProps == 3``, you'll have ``particleProps.prop0``, ``particleProps.prop1``, and ``particleProps.prop2``.
They will initially contain all 0s, and then will persist any values from previous frames. You can look up these properties during rendering (in both the vertex and fragment shaders) with:

.. code-block:: glsl

    vec4 getParticleProperty(const int propIndex, const int particleID)


--------
Examples
--------

Update shader to compute a cube of sinusoidal motion:

.. code-block:: glsl

    void updateParticleProps(const int particleID, inout ParticleUpdateProps particleProps) {
        int SIDE = int(ceil(sqrt(NUM_PARTICLES)));
        vec3 position = vec3(float(particleID % SIDE) / SIDE - 0.5, 0.5 * cos(iGlobalTime + particleID), float(floor(particleID / SIDE)) / SIDE - 0.5);
        position = iWorldOrientation * (position * iWorldScale) + iWorldPosition;

        particleProps.prop0.xyz = position;
    }

Vertex shader to billboard a single triangle using a stored position property:

.. code-block:: glsl

    uniform float radius = 0.01;

    vec3 getProceduralVertex(const int particleID) {
        vec3 position = getParticleProperty(0, particleID).xyz;

        TransformCamera cam = getTransformCamera();
        mat3 viewInverse3 = mat3(cam._viewInverse);
        const vec3 UP = vec3(0, 1, 0);
        const vec3 FORWARD = vec3(0, 0, -1);
        vec3 upEye = viewInverse3 * UP;
        vec3 forwardEye = viewInverse3 * FORWARD;
        vec3 particleRight = normalize(cross(forwardEye, upEye));
        vec3 particleUp = cross(particleRight, forwardEye);

        const vec3 TRI[3] = vec3[3](
            particleUp,
            normalize(-particleUp + particleRight),
            normalize(-particleUp - particleRight)
        );

        position += radius * TRI[gl_VertexID % 3];

        return position;
    }

**See Also**

+ :doc:`Procedural Shaders Guide <../materials/procedural-shaders>`

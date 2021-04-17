.. role:: underline
    :class: underline

Isomorfismos entre representaciones
==================================================

Buscando isomorphismos explicitos
------------------------------------

LinearRepresentationIsomorphism
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``LinearRepresentationIsomorphism( rho, tau[, rho_cent_basis , tau_ cent_basis] )`` es una función que retorna una matriz :math:`A` o ``fail``

Sea :math:`\rho : G \to GL(V)` y :math:`\tau : G \to GL(W)`. Si existe un mapa lineal :math:`A: V \to W` tal que para todo :math:`g \in G`, :math:`\tau(g)A = A\rho(g)`, esta función devuelve uno de esos :math:`A`. :math:`A` es el isomorfismo entre las representaciones. :underline:`Si las representaciones no son isomorfas`, se devuelve ``fail``.

Hay tres métodos que podemos usar para calcular un isomorfismo de representaciones lineales, puede seleccionar uno pasando opciones a la función.

    - ``use_kronecker``: asume que las matrices son lo suficientemente pequeñas como para que sus productos Kronecker puedan caber en la memoria. Utiliza ``GroupSumBSGS (4.2.1)`` y ``KroneckerProduct`` para calcular un elemento del subespacio fijo de :math:`\rho \otimes \tau^{\ast}`.
    - ``use_orbit_sum``: Encuentra un isomorfismo sumando las órbitas de la acción de :math:`\rho \otimes \tau^{\ast}` en matrices. Tenga en cuenta que las órbitas pueden ser muy grandes, por lo que esto podría ser tan malo como sumar todo el grupo.
    - El valor predeterminado, suma sobre todo el grupo para calcular la proyección en el subespacio fijo.

.. code-block:: gap
    :caption: función LinearRepresentationIsomorphism
    :name: Ejemplo_LinearRepresentationIsomorphism

    gap> LoadPackage( "RepnDecomp" );
    ────────────────────────────────────────────────────────────────────────────────────────
    Loading  GRAPE 4.8.2 (GRaph Algorithms using PErmutation groups)
    by Leonard H. Soicher (http://www.maths.qmul.ac.uk/~lsoicher/).
    Homepage: https://gap-packages.github.io/grape
    ────────────────────────────────────────────────────────────────────────────────────────
    ────────────────────────────────────────────────────────────────────────────────────────
    Loading  RepnDecomp 1.1.0 (Decompose representations of finite groups into irreducibles)
    by Kaashif Hymabaccus (https://kaashif.co.uk).
    Homepage: https://gap-packages.github.io/RepnDecomp
    ────────────────────────────────────────────────────────────────────────────────────────
    true
    gap> # Ejemplo_LinearRepresentationIsomorphism
    gap> G := SymmetricGroup(4);;
    gap> irreps := IrreducibleRepresentations(G);;
    gap> # rho y tau son isomorfos, solo tienen un orden de bloque diferente
    gap> rho := DirectSumOfRepresentations([irreps[1], irreps[3], irreps[3]]);;
    gap> tau := DirectSumOfRepresentations([irreps[3], irreps[1], irreps[3]]);;
    gap> # tau2 es solo tau con un cambio de base, sigue siendo isomorfo
    gap> B := RandomInvertibleMat(5);;
    gap> tau2 := ComposeHomFunction(tau, x -> B^-1 * x * B);;
    gap> # usando la implementación predeterminada
    gap> M := LinearRepresentationIsomorphism(rho, tau);;
    gap> IsLinearRepresentationIsomorphism(M, rho, tau);
    true
    gap> M := LinearRepresentationIsomorphism(tau, tau2);;
    gap> IsLinearRepresentationIsomorphism(M, tau, tau2);
    true
    gap> # usando la implementación de suma de kronecker
    gap> M := LinearRepresentationIsomorphism(tau, tau2 : use_kronecker);;
    gap> IsLinearRepresentationIsomorphism(M, tau, tau2);
    true
    gap> # usando la implementación de suma de órbitas
    gap> M := LinearRepresentationIsomorphism(tau, tau2 : use_orbit_sum);;
    gap> IsLinearRepresentationIsomorphism(M, tau, tau2);
    true
    gap> # dos irreps distintos no son isomorfos
    gap> M := LinearRepresentationIsomorphism(irreps[1], irreps[2]);
    fail
    gap>

LinearRepresentationIsomorphismSlow
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``LinearRepresentationIsomorphismSlow( rho, tau )`` devuelve una matriz :math:`A` o ``fail``

Da el mismo resultado que ``LinearRepresentationIsomorphism (2.1.1)``, pero esta función usa un método más simple que siempre implica sumar sobre :math:`G`, sin usar ``GroupSumBSGS (4.2.1)``. Esto puede resultar útil en algunos casos si resulta difícil calcular un buen ``BSGS``. Sin embargo, para todos los casos que se han probado, es lento (como sugiere el nombre).

.. code-block:: gap
    :caption: función LinearRepresentationIsomorphismSlow
    :name: Ejemplo_LinearRepresentationIsomorphismSlow
    :emphasize-lines: 7-11

    gap> LoadPackage( "RepnDecomp" );
    ...
    ... el resto de código del ejemplo anterior
    ...
    gap> M := LinearRepresentationIsomorphism(irreps[1], irreps[2]);
    fail
    gap> # Ejemplo_LinearRepresentationIsomorphismSlow
    gap> # Siguiendo el ejemplo anterior
    gap> M := LinearRepresentationIsomorphismSlow(rho, tau);;
    gap> IsLinearRepresentationIsomorphism(M, rho, tau);
    true
    gap>

Probando Isomorfismos
------------------------------------

AreRepsIsomorphic
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``AreRepsIsomorphic( rho, tau)`` devuelve ``true`` si ``rho`` y ``tau`` son isomorfos como representaciones, ``false`` en caso contrario.

Dado que las representaciones de grupos finitos sobre :math:`\mathbb{C}` están determinadas por sus caracteres, es fácil comprobar si dos representaciones son isomorfas comprobando si tienen el mismo carácter. Intentamos utilizar personajes siempre que sea posible.

.. code-block:: gap
    :caption: función AreRepsIsomorphic
    :name: Ejemplo_AreRepsIsomorphic
    :emphasize-lines: 7-16

    gap> LoadPackage( "RepnDecomp" );
    ...
    ... el resto de código de los ejemplos anteriores
    ...
    gap> IsLinearRepresentationIsomorphism(M, rho, tau);
    true
    gap> # Ejemplo_AreRepsIsomorphic
    gap> # Siguiendo los ejemplos anteriores
    gap> # Algunas representaciones isomorfas
    gap> AreRepsIsomorphic(rho, tau);
    true
    gap> AreRepsIsomorphic(rho, tau2);
    true
    gap> # rho no es iso a irreps[1] ya que rho es irreps[1] más algunas otras cosas
    gap> AreRepsIsomorphic(rho, irreps[1]);
    false
    gap>

IsLinearRepresentationIsomorphism
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``IsLinearRepresentationIsomorphism( A, rho, tau)`` devuelve ``true`` si ``rho`` y ``tau`` son :underline:`isomorfos como representaciones con el isomorfismo dado por el mapa lineal` :math:`A`.

Esta función prueba si, para todo :math:`g \in G`, :math:`A \rho(g) = \tau(g) A`. Es decir, se devuelve verdadero si y solo sí A es el operador entrelazado que lleva :math:`\rho` a :math:`\tau`. Veamos,

.. code-block:: gap
    :caption: función IsLinearRepresentationIsomorphism
    :name: Ejemplo_IsLinearRepresentationIsomorphism
    :emphasize-lines: 7-14

    gap> LoadPackage( "RepnDecomp" );
    ...
    ... el resto de código de los ejemplos anteriores
    ...
    gap> AreRepsIsomorphic(rho, irreps[1]);
    false
    gap> # Ejemplo_IsLinearRepresentationIsomorphism
    gap> # Ya hemos visto que esta función se usa mucho en ejemplos anteriores.
    gap> # Si dos representaciones son isomorfas, siempre se cumple lo siguiente:
    gap> IsLinearRepresentationIsomorphism(LinearRepresentationIsomorphism(rho, tau), rho, tau);
    true
    gap> # Nota: esta prueba es sensible a las llamados:
    gap> IsLinearRepresentationIsomorphism(LinearRepresentationIsomorphism(rho, tau), tau, rho);
    false
    gap>

.. important::
    
    - La secuencia de ejemplos completa está en :doc:`ejemplos-isomorfismos`.
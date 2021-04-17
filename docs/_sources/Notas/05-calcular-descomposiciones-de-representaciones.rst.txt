.. role:: underline
    :class: underline

Calcular descomposiciones de representaciones
=========================================================


Block diagonalizing
---------------------------------------------------------


Dada una representación :math:`\rho : G \to GL(V)`, a menudo es deseable encontrar una base para :math:`V` que el bloque diagonalice cada :math:`\rho(g)` con los tamaños de bloque tan pequeños como sea posible. Esto acelera las operaciones de álgebra matricial, ya que ahora se pueden realizar en bloques.


BlockDiagonalBasisOfRepresentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``BlockDiagonalBasisOfRepresentation( rho )`` devuelve una base de :math:`V` que diagonaliza en bloque :math:`\rho`.

Sea :math:`G` tal que tenga representaciones irreductibles :math:`\rho_i`, con dimensión :math:`d_{i}` y multiplicidad :math:`m_{i}`. La base devuelta por esta operación da cada :math:`\rho(g)` como una matriz diagonal de bloques que tiene :math:`m_{i}` bloques de tamaño :math:`d_i \times d_i` para cada :math:`i`.


BlockDiagonalRepresentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``BlockDiagonalRepresentation( rho )`` devuelve la representación de :math:`G` isomorfo a :math:`\rho` donde las imágenes :math:`\rho(g)` están diagonalizadas en bloque. Esta es solo una operación de conveniencia que usa ``BlockDiagonalBasisOfRepresentation (5.1.1)`` para calcular la matriz de cambio de base y la aplica para poner :math:`\rho` en la forma de bloque diagonalizado.


Algoritmos debidos a los autores
---------------------------------------------------------


REPN_ComputeUsingMyMethod (para IsGroupHomomorphism)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


El atributo ``REPN_ComputeUsingMyMethod( rho )`` devuelve un ``registro`` o ``record`` en el mismo formato que ``REPN_ComputeUsingSerre (5.3.4)``.

Calcula los mismos valores que ``REPN_ComputeUsingSerre (5.3.4)``, tomando las mismas opciones. El trabajo pesado de este método se realiza mediante ``LinearRepresentationIsomorphism (2.1.1)``), donde hay algunas opciones adicionales que se pueden pasar para influir en los algoritmos utilizados.


REPN_ComputeUsingMyMethodCanonical (para IsGroupHomomorphism)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


El atributo ``REPN_ComputeUsingMyMethodCanonical( rho )``  Devuelve un registro en el mismo formato que ``REPN_ComputeUsingMyMethod (5.2.1)``.

Realiza el mismo cálculo que ``REPN_ComputeUsingMyMethod (5.2.1)``, pero primero divide la representación en sumandos canónicos usando ``CanonicalDecomposition (5.3.1)``. Esto podría reducir significativamente el tamaño de las matrices con las que necesitamos trabajar, por lo que podría ser mucho más rápido.

Si se da la opción ``parallel``, la descomposición de los sumandos canónicos en ``irreps`` se realiza en
paralelo, que podría ser mucho más rápido.

Algoritmos debidos a Serre
---------------------------------------------------------

.. note::

    - Todo el cálculo en esta sección se realiza en realidad en la función ``REPN_ComputeUsingSerre``, las otras funciones son envoltorios a su alrededor.


CanonicalDecomposition
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
La función ``CanonicalDecomposition( rho )`` devuelve una lista de espacios vectoriales :math:`V_{i}`, cada :math:`G-\text{invariante}` y una suma directa de irreducibles isomorfos. Es decir, para cada :math:`i`, :math:`V_{i} \cong \oplus_{j} W_{i}` (como representaciones) donde :math:`W_{i}` es un espacio vectorial :math:`G-\text{invariante}` irreductible.

Calcula la descomposición canónica de :math:`V` en :math:`\oplus_{i}\;V_{i}` usando las fórmulas para las proyecciones :math:`$V \to V_{i}$` debido a *Serre*. Puede pasar la opción ``irreps`` con una lista de ``irreps`` de :math:`G`, y esto se utilizará en lugar de calcular una lista completa nosotros mismos. Si ya sabe qué ``irreps`` aparecerán en :math:`\rho`, por ejemplo, esto le ahorrará tiempo.

.. code-block:: gap
    :caption: función CanonicalDecomposition
    :name: Ejemplo_CanonicalDecomposition

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
    gap> # Ejemplo_CanonicalDecomposition
    gap> # Este es el grupo trivial
    gap> G := Group(());;
    gap> # The trivial group has only one representation per degree, so a
    gap> # degree d representation decomposes into a single canonical summand
    gap> # containing the whole space
    gap> # El grupo trivial tiene solo una representación por grado,
    gap> # por lo que una representación de grado d se descompone
    gap> # en un único sumando canónico que contiene todo el espacio.
    gap> rho := FuncToHom@RepnDecomp(G, g -> IdentityMat(3));;
    gap> canonical_summands_G := CanonicalDecomposition(rho);
    [ ( Cyclotomics^3 ) ]
    gap> # Ejemplo más interesante, S_3
    gap> H := SymmetricGroup(3);;
    gap> # La representación estándar: una permutación a la correspondiente
    gap> # matriz de permutación.
    gap> tau := FuncToHom@RepnDecomp(H, h -> PermutationMat(h, 3));;
    gap> # Dos sumandos canónicos correspondientes al grado 2 e irreps
    gap> # triviales (en ese orden)
    gap> canonical_summands_H := CanonicalDecomposition(tau);
    [ <vector space over Cyclotomics, with 2 generators>,
      <vector space over Cyclotomics, with 1 generators> ]
    gap>

IrreducibleDecomposition
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``IrreducibleDecomposition( rho )`` devuelve una lista de espacios vectoriales :math:`W_{j}` tales que :math:`V = \displaystyle\oplus_{j} W_{j}` y cada :math:`W_{j}` es un espacio vectorial :math:`G-\text{invariante}` irreducible.

Calcula la descomposición de :math:`V` en subpresentaciones irreducibles.

.. code-block:: gap
    :caption: función IrreducibleDecomposition
    :name: Ejemplo_IrreducibleDecomposition
    :emphasize-lines: 8-23

    gap> LoadPackage( "RepnDecomp" );
    ...
    ... el resto de código del ejemplo anterior
    ...
    gap> canonical_summands_H := CanonicalDecomposition(tau);
    [ <vector space over Cyclotomics, with 2 generators>,
      <vector space over Cyclotomics, with 1 generators> ]
    gap> # Ejemplo_IrreducibleDecomposition
    gap> # El grupo trivial tiene 1 irrep de grado 1, por lo que rho se descompone
    gap> # en 3 líneas.
    gap> irred_decomp_G := IrreducibleDecomposition( rho );
    [ rec( basis := [ [ 1, 0, 0 ] ] ), rec( basis := [ [ 0, 1, 0 ] ] ), rec( basis := [ [ 0, 0, 1 ] ] ) ]
    gap> # Los espacios se devuelven en este formato, manteniendo explícitamente
    gap> # la base, ya que este bloque base diagonaliza rho en los irreps, que
    gap> # son los bloques más pequeños posibles. Esto es más obvio con H.
    gap> irred_decomp_H := IrreducibleDecomposition(tau);
    [ rec( basis := [ [ 1, 1, 1 ] ] ), rec( basis := [ [ 1, E(3), E(3)^2 ], [ 1, E(3)^2, E(3) ] ] ) ]
    gap> # Usando los vectores base dados allí, el bloque diagonaliza tau en
    gap> # los dos bloques correspondientes a los dos irreps:
    gap> nice_basis := [ [ 1, 1, 1 ], [ 1, E(3), E(3)^2 ], [ 1, E(3)^2, E(3) ] ];;
    gap> tau_diag := ComposeHomFunction(tau, X -> nice_basis^-1 * X * nice_basis);
    [ (1,2,3), (1,2) ] -> [ [ [ 1, 0, 0 ], [ 0, E(3), 0 ], [ 0, 0, E(3)^2 ] ],
      [ [ 1, 0, 0 ], [ 0, 0, E(3)^2 ], [ 0, E(3), 0 ] ] ]
    gap>

IrreducibleDecompositionCollected
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


La función ``IrreducibleDecompositionCollected( rho )`` devuelve una lista de listas :math:`V_{i}` de espacios vectoriales :math:`V_{ij}` tales que :math:`V = \oplus_{i} \oplus_{j} V_{ij}` y :math:`V_{ik} \cong V_{il}` para todo :math:`i`, :math:`k` y :math:`l` (como representaciones).

Calcula la descomposición de :math:`V` en subrepresentaciones irreducibles, agrupando las subrepresentaciones isomorfas.


REPN_ComputeUsingSerre (para IsGroupHomomorphism)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

El atributo ``REPN_ComputeUsingSerre( rho)`` devuelve un ``registro`` o ``record`` en el formato que se describe a continuación.

Esta función hace todo el cálculo y (dado que es un atributo) guarda los resultados. Hacer todos los cálculos al mismo tiempo garantiza la coherencia en lo que respecta a la ordenación irreparable, la ordenación por bloques y la ordenación básica. No hay un ordenamiento canónico de ``irreps``, por lo que esto es crucial.

``irreps`` es la lista completa de ``irreps`` involucrados en la descomposición de suma directa de ``rho``, esto se puede dar en caso de que el valor predeterminado (ejecutando el *algoritmo de Dixon*) sea demasiado costoso, o por ejemplo, no desea representaciones sobre ``Cyclotomics``.

El valor de retorno de esta función es un registro con campos:

    - ``basis``: La base que bloque diagonaliza :math:`\rho`, ver ``BlockDiagonalBasisOfRepresentation (5.1.1)``.

    - ``diagonal_rep``: :math:`\rho`, bloque diagonalizado con la base anterior. ver ``BlockDiagonalRepresentation (5.1.2)``.

    - ``decomposition``: Los subespacios :math:`G-\text{invariables irreductibles}`, recopilados según el isomorfismo, ver ``IrreducibleDecompositionCollected  (5.1.3)``

    - ``centralizer_basis``: Una base ortonormal para el anillo centralizador de :math:`\rho`, escrito en forma de bloque. Ver ``CentralizerBlocksOfRepresentation (6.1.1)``

Pase la opción paralelo para que los cálculos por irreparación se realicen en paralelo.

Pase la opción irreps con la lista completa de irreps de :math:`\rho` para evitar volver a calcular esta lista (podría ser muy costoso)


.. code-block:: gap
    :caption: función REPN_ComputeUsingSerre
    :name: Ejemplo_REPN_ComputeUsingSerre
    :emphasize-lines: 9-21

    gap> LoadPackage( "RepnDecomp" );
    ...
    ... el resto de código de los ejemplos anteriores
    ...
    gap> tau_diag := ComposeHomFunction(tau, X -> nice_basis^-1 * X * nice_basis);
    [ (1,2,3), (1,2) ] -> [ [ [ 1, 0, 0 ], [ 0, E(3), 0 ], [ 0, 0, E(3)^2 ] ],
      [ [ 1, 0, 0 ], [ 0, 0, E(3)^2 ], [ 0, E(3), 0 ] ] ]
    gap> # Ejemplo_REPN_ComputeUsingSerre
    gap> # Hace lo mismo que hemos hecho en los ejemplos anteriores, pero todo
    gap> # en un solo paso, con tantas subcomputaciones reutilizadas como sea posible
    gap> REPN_ComputeUsingSerre(tau);
    rec( basis := [ [ 1, 1, 1 ], [ 1, E(3), E(3)^2 ], [ 1, E(3)^2, E(3) ] ],
      centralizer_basis := [ [ [ [ 1 ] ], [ [ 0, 0 ], [ 0, 0 ] ] ], [ [ [ 0 ] ], [ [ 1, 0 ], [ 0, 1 ] ] ] ],
        decomposition := [ [ rec( basis := [ [ 1, 1, 1 ] ] ) ], [  ],
              [ rec( basis := [ [ 1, E(3), E(3)^2 ], [ 1, E(3)^2, E(3) ] ] ) ] ], diagonal_rep := [ (1,2,3), (1,2) ] ->
                  [ [ [ 1, 0, 0 ], [ 0, E(3), 0 ], [ 0, 0, E(3)^2 ] ], [ [ 1, 0, 0 ], [ 0, 0, E(3)^2 ], [ 0, E(3), 0 ] ] ] )
    gap> # También puedes hacer el cálculo en paralelo:
    gap> REPN_ComputeUsingSerre(tau : parallel);;
    gap> # O especifique los irreps si ya los ha calculado:
    gap> irreps_H := IrreducibleRepresentations(H);;
    gap> REPN_ComputeUsingSerre(tau : irreps := irreps_H);;
    gap>

.. important::
    
    - La secuencia de ejemplos completa está en :doc:`ejemplo-de-descomposiciones-de-representaciones`.




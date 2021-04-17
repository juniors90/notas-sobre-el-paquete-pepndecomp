.. role:: underline
    :class: underline

Algoritmos para representaciones unitarias
=============================================================

Unitarizar representaciones (Unitarising representations)
-------------------------------------------------------------

UnitaryRepresentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``UnitaryRepresentation( rho)`` devuelve un ``registro`` (``record``), con los campos ``basis_change`` y ``unitary_rep`` tal que ``rho`` es isomorfo a ``unitary_rep``, diferenciado por un cambio de base ``basis_change``. Es decir, si :math:`L` es ``basis_change`` y  :math:`\rho_{u}`  es el ``rho`` unitarizado, entonces :math:`\forall g \in G: \; L \rho_{u}(g) L^{-1} = \rho(g)`.

Unitariza la representación dada rápidamente, sumando sobre el grupo usando una base y un conjunto de generadores fuertes y unitarizando con ``LDLDecomposition (3.1.3)`` - :underline:`traducir y explicar bien esta pequeña linea de texto, luego eliminar el subrayado del código` -.

.. code-block:: gap
    :caption: función UnitaryRepresentation
    :name: Ejemplo_UnitaryRepresentation

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
    gap> # Example_UnitaryRepresentation
    gap> G := SymmetricGroup(3);;
    gap> irreps := IrreducibleRepresentations(G);;
    gap> # Sucede que nos dan irreps unitarios, entonces rho también
    gap> # es unitario (sus bloques son unitarios)
    gap> rho := DirectSumOfRepresentations([irreps[1], irreps[2]]);;
    gap> IsUnitaryRepresentation(rho);
    true
    gap> # Cambio arbitrario de base
    gap> A := [ [ -1, 1 ], [ -2, -1 ] ];;
    gap> tau := ComposeHomFunction(rho, x -> A^-1 * x * A);;
    gap> # No unitario, pero sigue siendo isomorfo a rho
    gap> IsUnitaryRepresentation(tau);
    false
    gap> AreRepsIsomorphic(rho, tau);
    true
    gap> # Ahora unitarizamos tau
    gap> tau_u := UnitaryRepresentation(tau);;
    gap> # Obtenemos un registro o record con el representante unitarizado:
    gap> AreRepsIsomorphic(tau, tau_u.unitary_rep);
    true
    gap> AreRepsIsomorphic(rho, tau_u.unitary_rep);
    true
    gap> # El cambio de base también está en el registro:
    gap> ForAll(G, g -> tau_u.basis_change * Image(tau_u.unitary_rep, g) = Image(tau, g) * tau_u.basis_change);
    true
    gap>

IsUnitaryRepresentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``IsUnitaryRepresentation( rho )`` devuelve: Si ``rho`` es unitario, es decir, para todo :math:`g \in G`, :math:`\rho(g^{-1}) = \rho(g)^\ast` (donde :math:`^\ast` denota la transposición conjugada).

.. code-block:: gap
    :caption: función IsUnitaryRepresentation
    :name: Ejemplo_IsUnitaryRepresentation

    gap> # pensar un ejemplo para IsUnitaryRepresentation

LDLDecomposition
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``LDLDecomposition( A )`` devuelve un ``registro`` o ``record`` con dos campos, :math:`L` y :math:`D` tal que :math:`A = L\text{diag}(D)L^\ast`. :math:`D` es el vector :math:`1 \times n` que da la matriz diagonal :math:`\text{diag}(D)` (donde ``A`` es una matriz :math:`n \times n`)

.. code-block:: gap
    :caption: función LDLDecomposition
    :name: Ejemplo_LDLDecomposition

    gap> # pensar un ejemplo para LDLDecomposition

Decomposing unitary representations
-------------------------------------------------------------

IrreducibleDecompositionDixon
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``IrreducibleDecompositionDixon( rho )`` devuelve una lista de ``irreps`` en la descomposición de ``rho``.

.. note::
    
    - Esto aún no está implementado. Asume que ``rho`` es unitario y usa un algoritmo de ``Dixon`` para descomponerlo en ``irreps`` unitarios.


.. important::
    
    - La secuencia de ejemplos completa está en :doc:`ejemplo-de-representaciones-unitarias`.



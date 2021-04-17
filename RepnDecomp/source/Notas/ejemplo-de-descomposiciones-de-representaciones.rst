Ejemplos de Descomposiciones de representaciones
=====================================================

.. code-block:: gap

    ┌───────┐   GAP 4.10.2 of 19-Jun-2019
    │  GAP  │   https://www.gap-system.org
    └───────┘   Architecture: i686-pc-cygwin-default32-kv3
    Configuration:  gmp 6.1.2, readline
    Loading the library and packages ...
    Packages: AClib 1.3.1, Alnuth 3.1.1, AtlasRep 2.1.0, AutoDoc 2019.05.20, AutPGrp 1.10, Browse 1.8.8,
             CRISP 1.4.4, Cryst 4.1.19, CrystCat 1.1.9, CTblLib 1.2.2, FactInt 1.6.2, FGA 1.4.0,
             Forms 1.2.5, GAPDoc 1.6.2, genss 1.6.5, IO 4.6.0, IRREDSOL 1.4, LAGUNA 3.9.3, orb 4.8.2,
             Polenta 1.3.8, Polycyclic 2.14, PrimGrp 3.3.2, RadiRoot 2.8, recog 1.3.2, ResClasses 4.7.2,
             SmallGrp 1.3, Sophus 1.24, SpinSym 1.5.1, TomLib 1.2.8, TransGrp 2.0.4, utils 0.63
    Try '??help' for help. See also '?copyright', '?cite' and '?authors'
    gap> LoadPackage( "RepnDecomp" );
    ───────────────────────────────────────────────────────────────────────────────────────────────────
    Loading  GRAPE 4.8.2 (GRaph Algorithms using PErmutation groups)
    by Leonard H. Soicher (http://www.maths.qmul.ac.uk/~lsoicher/).
    Homepage: https://gap-packages.github.io/grape
    ───────────────────────────────────────────────────────────────────────────────────────────────────
    ───────────────────────────────────────────────────────────────────────────────────────────────────
    Loading  RepnDecomp 1.1.0 (Decompose representations of finite groups into irreducibles)
    by Kaashif Hymabaccus (https://kaashif.co.uk).
    Homepage: https://gap-packages.github.io/RepnDecomp
    ───────────────────────────────────────────────────────────────────────────────────────────────────
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
    [ <vector space over Cyclotomics, with 2 generators>, <vector space over Cyclotomics, with 1 generators> ]
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


.. tip::
  
    Se puede descargar el códico fuente: :download:`serre.g`


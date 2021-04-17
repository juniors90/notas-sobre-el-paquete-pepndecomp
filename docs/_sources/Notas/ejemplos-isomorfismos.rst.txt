Ejemplos de Isomorfismos
===============================

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
    gap> # Ejemplo_LinearRepresentationIsomorphismSlow
    gap> # Siguiendo el ejemplo anterior
    gap> M := LinearRepresentationIsomorphismSlow(rho, tau);;
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
    gap> # Ejemplo_IsLinearRepresentationIsomorphism
    gap> # Ya hemos visto que esta función se usa mucho en ejemplos anteriores.
    gap> # Si dos representaciones son isomorfas, siempre se cumple lo siguiente:
    gap> IsLinearRepresentationIsomorphism(LinearRepresentationIsomorphism(rho, tau), rho, tau);
    true
    gap> # Nota: esta prueba es sensible a las llamados:
    gap> IsLinearRepresentationIsomorphism(LinearRepresentationIsomorphism(rho, tau), tau, rho);
    false
    gap>

.. tip::
  
    Se puede descargar el códico fuente: :download:`isomorphisms.g`

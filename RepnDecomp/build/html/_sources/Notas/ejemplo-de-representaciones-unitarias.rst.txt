Ejemplos de Representaciones Unitarias
============================================

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
    gap> # Obtenemos un récord con el representante unitarizado:
    gap> AreRepsIsomorphic(tau, tau_u.unitary_rep);
    true
    gap> AreRepsIsomorphic(rho, tau_u.unitary_rep);
    true
    gap> # El cambio de base también está en el registro:
    gap> ForAll(G, g -> tau_u.basis_change * Image(tau_u.unitary_rep, g) = Image(tau, g) * tau_u.basis_change);
    true
    gap>

.. tip::
  
    Se puede descargar el códico fuente: :download:`unitary.g`

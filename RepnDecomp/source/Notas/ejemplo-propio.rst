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
    gap> G := SymmetricGroup(4);;
    gap> irreps := IrreducibleRepresentations(G);;
    gap> irreps;
    [ Pcgs([ (3,4), (2,4,3), (1,4)(2,3), (1,3)(2,4) ]) -> [ [ [ 1 ] ], [ [ 1 ] ], [ [ 1 ] ], [ [ 1 ] ] ],
      Pcgs([ (3,4), (2,4,3), (1,4)(2,3), (1,3)(2,4) ]) -> [ [ [ -1 ] ], [ [ 1 ] ], [ [ 1 ] ], [ [ 1 ] ] ],
      Pcgs([ (3,4), (2,4,3), (1,4)(2,3), (1,3)(2,4) ]) -> [ [ [ 0, 1 ], [ 1, 0 ] ], [ [ E(3), 0 ], [ 0, E(3)^2 ] ],
           [ [ 1, 0 ], [ 0, 1 ] ], [ [ 1, 0 ], [ 0, 1 ] ] ], Pcgs([ (3,4), (2,4,3), (1,4)(2,3), (1,3)(2,4) ]) ->
        [ [ [ 0, 1, 0 ], [ 1, 0, 0 ], [ 0, 0, 1 ] ], [ [ 0, 0, 1 ], [ 1, 0, 0 ], [ 0, 1, 0 ] ],
          [ [ -1, 0, 0 ], [ 0, 1, 0 ], [ 0, 0, -1 ] ], [ [ 1, 0, 0 ], [ 0, -1, 0 ], [ 0, 0, -1 ] ] ],
      Pcgs([ (3,4), (2,4,3), (1,4)(2,3), (1,3)(2,4) ]) -> [ [ [ 0, -1, 0 ], [ -1, 0, 0 ], [ 0, 0, -1 ] ],
          [ [ 0, 0, 1 ], [ 1, 0, 0 ], [ 0, 1, 0 ] ], [ [ -1, 0, 0 ], [ 0, 1, 0 ], [ 0, 0, -1 ] ],
          [ [ 1, 0, 0 ], [ 0, -1, 0 ], [ 0, 0, -1 ] ] ] ]
    gap> rho := DirectSumOfRepresentations([irreps[1], irreps[3], irreps[3]]);
    Error, Variable: 'DirectSumOfRepresentations' must have a value
    not in any function at *stdin*:4
    gap>


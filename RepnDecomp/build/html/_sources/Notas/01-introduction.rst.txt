.. role:: underline
    :class: underline

Inicio rápido con el paquete ``RepnDecomp``
==============================================

Este paquete permite cálculos de varias descomposiciones de una representación :math:`\rho: G \to GL (V)` donde :math:`G` es finito y :math:`V` es un :math:`\mathbb{C}-\text{espacio vectorial}` de dimensión finita.

Instalación
--------------

Para instalar este paquete, debemos consultar las instrucciones de instalación en el archivo ``README`` en el código fuente. Se encuentra `aquí <https://github.com/gap-packages/RepnDecomp/blob/master/README.md>`_.

.. note::
    
    sobre lo que se entiende por representación
    
    A lo largo de esta documentación, se utiliza terminología matemática, por ejemplo: :underline:`representación`. Está claro lo que se quiere decir matemáticamente, pero no está del todo claro lo que se quiere decir en términos de tipos de **GAP**, qué se supone que debes pasar cuando digo "pasar una representación". De vez en cuando ni siquiera mencionaré lo que estamos transmitiendo y supongo que el lector sabe que **rho** o :math:`\rho` se refieren a una representación.
    
    Una representación que podemos usar es, en **GAP**, un homomorfismo de un grupo finito a un grupo de matrices donde todas las matrices tienen coeficientes en un campo ciclotómico - no sé si es la traducción correcta - (``Cyclotomics`` es la unión de todos esos campos en **GAP**). Puede verificar si algo que desea pasar es adecuado con la función ``IsFiniteGroupLinearRepresentation (4.1.1)``.
    
    A continuación, se muestra un ejemplo de una representación **rho** en **GAP**:

    .. code-block::

        gap> G := SymmetricGroup(3);
        Sym( [ 1 .. 3 ] )
        gap>  images := List(GeneratorsOfGroup(G), g -> PermutationMat(g, 3));
        [ [ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 1, 0, 0 ] ], [ [ 0, 1, 0 ], [ 1, 0, 0 ], [ 0, 0, 1 ] ] ]
        gap> rho := GroupHomomorphismByImages(G, Group(images));
        [ (1,2,3), (1,2) ] -> [ [ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 1, 0, 0 ] ],
                                [ [ 0, 1, 0 ], [ 1, 0, 0 ], [ 0, 0, 1 ] ] ]
        gap>


Descripción general de la API
------------------------------------

Los algoritmos implementados se pueden dividir en dos grupos:
    
    1. métodos debidos a *Serre* de su libro *Linear Representations of Finite Groups* (Representaciones lineales de grupos finitos), y
    2. métodos originales debidos a los autores de este paquete. 

El valor predeterminado es utilizar los algoritmos de Serre. Si pasa la opción ``method := "alternate"`` a una función, utilizará el método alternativo. Al pasar la opción en paralelo, se intentará calcular en paralelo tanto como sea posible. Consulte las funciones individuales para conocer las opciones que puede aprobar.

Las principales funciones implementadas en este paquete son:

:underline:`Para descomponer representaciones en sumandos directos canónicos e irreducibles:` (ver si stá bien la traducción)

    - ``CanonicalDecomposition (5.3.1)``
    - ``IrreducibleDecomposition (5.3.2)``
    - ``IrreducibleDecompositionCollected (5.3.3)``

:underline:`Para representaciones de diagonalización de bloques:`

    - ``BlockDiagonalBasisOfRepresentation (5.1.1)``
    - ``BlockDiagonalRepresentation (5.1.2)``

:underline:`Para calcular anillos centralizadores:`
    
    - ``CentralizerBlocksOfRepresentation (6.1.1)``
    - ``CentralizerOfRepresentation (6.1.2)``

:underline:`Para probar isomorfismo y calcular isomorfismos (operadores entrelazados) entre representaciones:`

    - ``Isomorfismo de representación lineal (2.1.1)``
    - ``AreRepsIsomorphic (2.2.1)``
    - ``IsLinearRepresentationIsomorphism (2.2.2)``

:underline:`Para probar la unitaridad de representaciones y la unitarización de representaciones:`

    - ``Representación unitaria (3.1.1)``
    - ``IsUnitaryRepresentation (3.1.2)``
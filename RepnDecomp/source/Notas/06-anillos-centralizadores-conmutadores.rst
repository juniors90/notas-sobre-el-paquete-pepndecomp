.. role:: underline
    :class: underline

Anillos centralizadores (conmutadores)
=====================================================

Encontrar una base para el centralizador
-------------------------------------------------------

CentralizerBlocksOfRepresentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``CentralizerBlocksOfRepresentation( rho )`` devuelve una lista de generadores de espacio vectorial para el anillo centralizador de :math:`\rho(G)`, escrito en la base dada por ``BlockDiagonalBasisOfRepresentation (5.1.1)``. Las matrices se dan como una lista de bloques.

Sea G representaciones irreductibles :math:`\rho_{i}` con multiplicidades :math:`m_{i}`. El centralizador tiene una dimensión :math:`\displaystyle\sum_{i} m_{i}^{2}` como un :math:`\mathbb{C}-\text{espacio vectorial}`. Esta función proporciona el número mínimo de generadores necesarios.

CentralizerOfRepresentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


La función ``CentralizerOfRepresentation( arg )`` devuelve una lista de generadores de espacio vectorial para el anillo centralizador de :math:`\rho(G)`.

Esto da el mismo resultado que ``CentralizerBlocksOfRepresentation (6.1.1)``, pero con las matrices dadas en su totalidad: no como listas de bloques, sino como matrices completas.

Usando el centralizador para cálculos
-------------------------------------------------------

ClassSumCentralizer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


La función ``ClassSumCentralizer( rho, class, cent_basis)`` devuelve :math:`\displaystyle\sum_{s \in t^{G}} \rho(s)`, donde :math:`t` es un representante de la clase de conjugación clase de :math:`G`.

Requerimos que ``rho`` sea unitario. Utiliza la base ortonormal dada (con respecto al producto interno :math:`\langle A, B \rangle = \text{Trace}(AB^\ast)` para el anillo centralizador de ``rho`` para calcular la suma de la clase de conjugación ``class`` rápidamente, es decir, sin sumar la clase.

.. note::
    
    - Se comprueban la ortonormalidad de ``cent_basis`` y la unitaridad de ``rho``. Consulte ``ClassSumCentralizerNC (6.2.2)`` para obtener una versión de esta función sin comprobaciones. Las verificaciones no son muy costosas, por lo que se recomienda utilizar la función con chequeos.

ClassSumCentralizerNC
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``ClassSumCentralizerNC(rho, class, cent_basis)``

Lo mismo que ``ClassSumCentralizer (6.2.1)``, pero no verifica la base de la ortonormalidad o la representación de la unitaridad. Ya sabemos que ``NC`` significa "No check".

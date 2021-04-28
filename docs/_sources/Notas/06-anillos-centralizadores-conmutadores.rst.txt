.. role:: underline
    :class: underline

Anillos centralizadores (conmutadores)
=====================================================


.. _encontrar-una-base-para-el-centralizador:

Encontrar una base para el centralizador
-------------------------------------------------------


.. _CentralizerBlocksOfRepresentation:

CentralizerBlocksOfRepresentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``CentralizerBlocksOfRepresentation( rho )`` devuelve una lista de generadores de espacio vectorial para el anillo centralizador de :math:`\rho(G)`, escrito en la base dada por :ref:`BlockDiagonalBasisOfRepresentation`. Las matrices se dan como una lista de bloques.

Sea :math:`G` representaciones irreductibles :math:`\rho_{i}` con multiplicidades :math:`m_{i}`. El centralizador tiene una dimensión :math:`\displaystyle\sum_{i} m_{i}^{2}` como un :math:`\mathbb{C}-\text{espacio vectorial}`. Esta función proporciona el número mínimo de generadores necesarios.


.. _CentralizerOfRepresentation:

CentralizerOfRepresentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``CentralizerOfRepresentation( arg )`` devuelve una lista de generadores de espacio vectorial para el anillo centralizador de :math:`\rho(G)`.

Esto da el mismo resultado que CentralizerBlocksOfRepresentation_, pero con las matrices dadas en su totalidad: no como listas de bloques, sino como matrices completas.

.. _usando-el-centralizador-para-diversos-calculos:

Usando el centralizador para diversos cálculos
-------------------------------------------------------

.. _ClassSumCentralizer:

ClassSumCentralizer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


La función ``ClassSumCentralizer( rho, class, cent_basis)`` devuelve :math:`\displaystyle\sum_{s \in t^{G}} \rho(s)`, donde :math:`t` es un representante de la clase de conjugación clase de :math:`G`.

Requerimos que ``rho`` sea unitario. Utiliza la base ortonormal dada (con respecto al producto interno :math:`\langle A, B \rangle = \text{Trace}(AB^\ast)` para el anillo centralizador de ``rho`` para calcular la suma de la clase de conjugación ``class`` rápidamente, es decir, sin sumar la clase.

.. note::
    
    - Se comprueban la ortonormalidad de ``cent_basis`` y la unitaridad de ``rho``. Consulte ClassSumCentralizerNC_ para obtener una versión de esta función sin comprobaciones. Las verificaciones no son muy costosas, por lo que se recomienda utilizar la función con chequeos.


.. _ClassSumCentralizerNC:

ClassSumCentralizerNC
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``ClassSumCentralizerNC(rho, class, cent_basis)``

Lo mismo que ClassSumCentralizer_, pero no verifica la base de la ortonormalidad o la representación de la unitaridad. Ya sabemos que ``NC`` significa "No check".

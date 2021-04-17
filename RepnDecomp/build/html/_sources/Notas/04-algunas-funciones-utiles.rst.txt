.. role:: underline
    :class: underline

Algunas Funciones útiles
=======================================================

Predicadas para representaciones
-------------------------------------------------------

IsFiniteGroupLinearRepresentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

El atributo ``IsFiniteGroupLinearRepresentation( rho )`` devuelve ``true`` o ``false``.

Le dice si ``rho`` es una representación lineal de un grupo finito. Los algoritmos implementados en este paquete funcionan solo con estos homomorfismos.


IsFiniteGroupPermutationRepresentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

El atributo ``IsFiniteGroupPermutationRepresentation( rho )`` devuelve ``true`` o ``false``.

Le dice si ``rho`` es un homomorfismo de un grupo finito a un grupo de permutación.

Suma eficiente de grupos
-------------------------------------------------------

GroupSumBSGS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``GroupSumBSGS(G, summand)`` devuelve :math:`\displaystyle\sum_{g \in G} \text{summand}(g)`

Utiliza una cadena estabilizadora básica por :math:`G` para calcular la suma descrita anteriormente. Este truco requiere que ``summand`` sea una función (en el sentido de **GAP**) que defina un homomorfismo monoide (en el sentido matemático). El cálculo de la cadena estabilizadora asume que :math:`G` es un grupo.

Más precisamente, si tenemos la cadena estabilizadora básica:

.. math::

    \{1\} = G_{1} \leq \ldots \leq G_{n} = G

Atravesamos la cadena desde :math:`G_{1}` a :math:`G_{n}`, usando la suma anterior :math:`G_{i-1}` para construir la suma :math:`G_{i}`. Hacemos esto usando el hecho de que (escribiendo :math:`f` para ``summand``)

.. math::

    \sum_{g \in G_i} f(g) = \sum_{r_j} \left(\sum_{h \in G_{i-1}} f(h)\right) f(r_j)

donde :math:`r_j` son representantes de la clase lateral derecha de :math:`G_ {i-1}` en :math:`G_{i}`.

La condición de ``summand`` se cumple si, por ejemplo, es una representación lineal de un grupo :math:`G`.



Representación espacial eficiente de tensores de matrices
-----------------------------------------------------------

Supongamos que tenemos representaciones de :math:`G`, :math:`\rho` y :math:`\tau`, con grados :math:`n` y :math:`m`. Si quisiéramos construir la representación del producto tensorial de :math:`G`, :math:`\rho \otimes \tau`, la forma habitual de hacerlo sería tomar el *producto de Kronecker* de las matrices. Esto significa que ahora tenemos que almacenar matrices :math:`nm \times nm` muy grandes para cada generador de :math:`G`.

Esto se puede evitar almacenando el tensor de matrices como pares, esencialmente almacenando :math:`A \otimes B` como un par :math:`(A, B)` e implementando operaciones de grupo en encima de éstos, junto con algunas funciones teóricas de representación.

Solo es posible garantizar una representación económica para tensores puros, es decir, matrices de la forma :math:`A \otimes B`. Estas están cerradas bajo operaciones de grupo, por lo que es natural definir una estructura de grupo.

IsTensorProductOfMatricesObj (for IsMultiplicativeElementWithInverse)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

El filtro ``IsTensorProductOfMatricesObj( arg )`` devuelve ``true`` o ``false``. La posición i en esta representación almacena la matriz :math:`A_{i}` en el producto tensorial :math:`A_{1} \otimes A_{2}`.

IsTensorProductPairRep (for IsPositionalObjectRep)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

El filtro ``IsTensorProductPairRep( arg )`` devuelve ``true`` o ``false``.

La posición :math:`1` almacena el *producto de Kronecker* completo de las matrices, esto es muy ineficiente en cuanto al espacio y se supone que debe usarse como último recurso.

IsTensorProductKroneckerRep (for IsPositionalObjectRep)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

El filtro ``IsTensorProductKroneckerRep( arg )`` devuelve ``true`` o ``false``. Constructor más conveniente para un producto tensor (maneja automáticamente la familia).

TensorProductOfMatrices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``TensorProductOfMatrices( arg )``. Esto usa la multiplicatividad de los caracteres cuando se toman productos tensoriales para evitar tener que calcular el rastro de una matriz grande.

CharacterOfTensorProductOfRepresentations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``CharacterOfTensorProductOfRepresentations( arg )``.


Matrices y homomorfismos
-----------------------------------------------------------

ComposeHomFunction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``ComposeHomFunction( hom, func)`` devuelve un homomorfism :math:`g` given by :math:`g(x) = func(hom(x))`.

Esto es principalmente por conveniencia, ya que maneja todos los problemas de contabilidad GAP con respecto al rango, ``ByImages`` vs ``ByFunction``, etc.

Funciones teóricas de representación
-----------------------------------------------------------

TensorProductRepLists
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``TensorProductRepLists( list1, list2 )`` devuelve todos los productos tensoriales posibles dados por :math:`\rho \otimes \tau` donde :math:`\rho : G \to \mbox{GL}(V)` se toma de ``list1`` y :math:`\tau : H \to \mbox{GL}(W)` se toma de ``list2``. El resultado es entonces una lista de representaciones de :math:`G \times H`.

DirectSumOfRepresentations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``DirectSumOfRepresentations( list )`` devuelve la suma directa de la lista de representaciones ``list``.`

DegreeOfRepresentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``DegreeOfRepresentation( rho )`` devuelve el grado de representación ``rho``. Es decir, :math:`\text{Tr}(\rho(e_G))`, donde :math:`e_G` es la identidad del grupo :math:`G` que ``rho`` tiene como dominio.

PermToLinearRep
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``PermToLinearRep( rho )`` devuelve la representación lineal :math:`\rho` isomorfa a la representación de permutación ``rho``.

IsOrthonormalSet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``IsOrthonormalSet( S, prod )`` devuelve si ``S`` es un conjunto ortonormal con respecto al producto interno ``prod``.




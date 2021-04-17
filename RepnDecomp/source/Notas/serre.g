# Ejemplo_CanonicalDecomposition
# Este es el grupo trivial
G := Group(());;
# The trivial group has only one representation per degree, so a
# degree d representation decomposes into a single canonical summand
# containing the whole space
# El grupo trivial tiene solo una representación por grado,
# por lo que una representación de grado d se descompone
# en un único sumando canónico que contiene todo el espacio.
rho := FuncToHom@RepnDecomp(G, g -> IdentityMat(3));;
canonical_summands_G := CanonicalDecomposition(rho);
# Ejemplo más interesante, S_3
H := SymmetricGroup(3);;
# La representación estándar: una permutación a la correspondiente
# matriz de permutación.
tau := FuncToHom@RepnDecomp(H, h -> PermutationMat(h, 3));;
# Dos sumandos canónicos correspondientes al grado 2 e irreps
# triviales (en ese orden)
canonical_summands_H := CanonicalDecomposition(tau);




# Ejemplo_IrreducibleDecomposition
# El grupo trivial tiene 1 irrep de grado 1, por lo que rho se descompone
# en 3 líneas.
irred_decomp_G := IrreducibleDecomposition( rho );
# Los espacios se devuelven en este formato, manteniendo explícitamente
# la base, ya que este bloque base diagonaliza rho en los irreps, que
# son los bloques más pequeños posibles. Esto es más obvio con H.
irred_decomp_H := IrreducibleDecomposition(tau);
# Usando los vectores base dados allí, el bloque diagonaliza tau en
# los dos bloques correspondientes a los dos irreps:
nice_basis := [ [ 1, 1, 1 ], [ 1, E(3), E(3)^2 ], [ 1, E(3)^2, E(3) ] ];;
tau_diag := ComposeHomFunction(tau, X -> nice_basis^-1 * X * nice_basis);


# Ejemplo_REPN_ComputeUsingSerre
# Hace lo mismo que hemos hecho en los ejemplos anteriores, pero todo
# en un solo paso, con tantas subcomputaciones reutilizadas como sea posible
REPN_ComputeUsingSerre(tau);
# También puedes hacer el cálculo en paralelo:
REPN_ComputeUsingSerre(tau : parallel);;
# O especifique los irreps si ya los ha calculado:
irreps_H := IrreducibleRepresentations(H);;
REPN_ComputeUsingSerre(tau : irreps := irreps_H);;
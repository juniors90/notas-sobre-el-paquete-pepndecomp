# Ejemplo_LinearRepresentationIsomorphism
G := SymmetricGroup(4);;
irreps := IrreducibleRepresentations(G);;
# rho y tau son isomorfos, solo tienen un orden de bloque diferente
rho := DirectSumOfRepresentations([irreps[1], irreps[3], irreps[3]]);;
tau := DirectSumOfRepresentations([irreps[3], irreps[1], irreps[3]]);;
# tau2 es solo tau con un cambio de base, sigue siendo isomorfo
B := RandomInvertibleMat(5);;
tau2 := ComposeHomFunction(tau, x -> B^-1 * x * B);;
# usando la implementación predeterminada
M := LinearRepresentationIsomorphism(rho, tau);;
IsLinearRepresentationIsomorphism(M, rho, tau);
M := LinearRepresentationIsomorphism(tau, tau2);;
IsLinearRepresentationIsomorphism(M, tau, tau2);
# usando la implementación de suma de kronecker
M := LinearRepresentationIsomorphism(tau, tau2 : use_kronecker);;
IsLinearRepresentationIsomorphism(M, tau, tau2);
# usando la implementación de suma de órbitas
M := LinearRepresentationIsomorphism(tau, tau2 : use_orbit_sum);;
IsLinearRepresentationIsomorphism(M, tau, tau2);
# dos irreps distintos no son isomorfos
M := LinearRepresentationIsomorphism(irreps[1], irreps[2]);


# Ejemplo_LinearRepresentationIsomorphismSlow
# Siguiendo el ejemplo anterior
M := LinearRepresentationIsomorphismSlow(rho, tau);;
IsLinearRepresentationIsomorphism(M, rho, tau);


# Ejemplo_AreRepsIsomorphic
# Siguiendo los ejemplos anteriores
# Algunas representaciones isomorfas
AreRepsIsomorphic(rho, tau);
AreRepsIsomorphic(rho, tau2);
# rho no es iso a irreps[1] ya que rho es irreps[1] más algunas otras cosas
AreRepsIsomorphic(rho, irreps[1]);

# Ejemplo_IsLinearRepresentationIsomorphism
# Ya hemos visto que esta función se usa mucho en ejemplos anteriores.
# Si dos representaciones son isomorfas, siempre se cumple lo siguiente:
IsLinearRepresentationIsomorphism(LinearRepresentationIsomorphism(rho, tau), rho, tau);
# Nota: esta prueba es sensible a las llamados:
IsLinearRepresentationIsomorphism(LinearRepresentationIsomorphism(rho, tau), tau, rho);
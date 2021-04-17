# Example_UnitaryRepresentation
G := SymmetricGroup(3);;
irreps := IrreducibleRepresentations(G);;
# Sucede que nos dan irreps unitarios, entonces rho también
# es unitario (sus bloques son unitarios)
rho := DirectSumOfRepresentations([irreps[1], irreps[2]]);;
IsUnitaryRepresentation(rho);
# Cambio arbitrario de base
A := [ [ -1, 1 ], [ -2, -1 ] ];;
tau := ComposeHomFunction(rho, x -> A^-1 * x * A);;
# No unitario, pero sigue siendo isomorfo a rho
IsUnitaryRepresentation(tau);
AreRepsIsomorphic(rho, tau);
# Ahora unitarizamos tau
tau_u := UnitaryRepresentation(tau);;
# Obtenemos un récord con el representante unitarizado:
AreRepsIsomorphic(tau, tau_u.unitary_rep);
AreRepsIsomorphic(rho, tau_u.unitary_rep);
# El cambio de base también está en el registro:
ForAll(G, g -> tau_u.basis_change * Image(tau_u.unitary_rep, g) = Image(tau, g) * tau_u.basis_change);

# Ejemplo_IsUnitaryRepresentation

# Ejemplo_LDLDecomposition


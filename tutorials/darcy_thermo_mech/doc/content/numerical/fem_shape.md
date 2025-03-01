# Finite Element Shape Functions

!---

## Basis Functions

!row!
!col! width=50%
While the weak form is essentially what is needed for adding physics to MOOSE, in traditional finite
element software more work is necessary.

The weak form must be discretized using a set of "basis functions" amenable for manipulation by a
computer.

!media fem_hat_function.png style=width:100%;

!style fontsize=60%
*Images copyright [citet!becker1981finite]*

!col-end!

!col width=50%
!media fem_basis_functions.png style=width:65%;margin-left:auto;margin-right:auto;display:block;

!row-end!

!---

## Shape Functions

The discretized expansion of $u$ takes on the following form:

!equation
u \approx u_h = \sum_{j=1}^N u_j \phi_j,

where $\phi_j$ are the "basis functions", which form the basis for the the "trial function", $u_h$.
$N$ is the total number of functions for the discretized domain.

The gradient of $u$ can be expanded similarly:

!equation
\nabla u \approx \nabla u_h = \sum_{j=1}^N u_j \nabla \phi_j

!---

In the Galerkin finite element method, the same basis functions are used for both the trial and
test functions:

!equation
\psi = \{\phi_i\}_{i=1}^N

Substituting these expansions back into the example weak form ([example_weak_form]) yields:

!equation id=example_weak_form2
\left(\nabla\psi_i, k\nabla u_h \right) - \langle\psi_i, k\nabla u_h\cdot \hat{n} \rangle +
\left(\psi_i, \vec{\beta} \cdot \nabla u_h\right) - \left(\psi_i, f\right) = 0, \quad i=1,\ldots,N

The left-hand side of the equation above is referred to as the $i^{th}$ component of
the "residual vector," $R_i(u_h)$.

!---

Shape Functions are the functions that get multiplied by coefficients and summed to form the
solution.

Individual shape functions are restrictions of the global basis functions to individual elements.

They are analogous to the $x^n$ functions from polynomial fitting (in fact, you can use those as
shape functions).

Typical shape function families: Lagrange, Hermite, Hierarchic, Monomial, Clough-Toucher

Lagrange shape functions are the most common, which are interpolary at the nodes, i.e., the
coefficients correspond to the values of the functions at the nodes.

!---

## Example 1D Shape Functions

!media fem_linear_lagrange.png style=width:49%;margin-left:1%;display:inline;

!media fem_quadratic_lagrange.png style=width:49%;display:inline;

!---

!media fem_cubic_lagrange.png style=width:49%;margin-left:1%;display:inline;

!media fem_cubic_hermite.png style=width:49%;display:inline;

!---

## 2D Lagrange Shape Functions

Example bi-quadratic basis functions defined on the Quad9 element:

$\psi_0$ is associated to a "corner" node, it is zero on the opposite edges.\\
$\psi_4$ is associated to a "mid-edge" node, it is zero on all other edges.\\
$\psi_8$ is associated to the "center" node, it is symmetric and $\geq 0$ on the element.\\

!row!
!col! width=33%
!media fem_quad9_phi0.png style=width:100%

!style halign=center
$\psi_0$
!col-end!

!col! width=33%
!col width=33%
!media fem_quad9_phi4.png style=width:100%;

!style halign=center
$\psi_4$
!col-end!

!col! width=33%
!col width=33%
!media fem_quad9_phi8.png style=width:100%;

!style halign=center
$\psi_8$
!col-end!

!row-end!

!---

## Finite Element (Quad9)

!media fem_quad9_ref.png style=width:100%;margin-left:auto;margin-right:auto;display:block;

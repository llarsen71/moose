# Step 1: Geometry and Diffusion id=step01

!---

First, consider the steady-state diffusion equation on the domain $\Omega$: find $u$ such that

!equation
-\nabla \cdot \nabla u = 0 \in \Omega,

where $u = 1$ on the bottom, $u = 0$ on the top and with
$\nabla u \cdot \hat{n} = 0$ on the remaining boundaries.

The weak form of this equation, in inner-product notation, is given by:

!equation
\left(\nabla \phi_i, \nabla u_h\right) = 0 \quad \forall \phi_i,

where $\phi_i$ are the test functions and $u_h$ is the finite element solution.

!---

## Input File(s)

All capabilities of MOOSE, modules, and your application are compiled into a single executable.
An input file is used define which capabilities are used to perform a simulation.

MOOSE uses the "hierarchical input text" (hit) format.

!listing step01_diffusion/problems/step1.i block=Kernels

!---

A basic MOOSE input file requires six parts, each of which will be covered in greater detail later.

- `[Mesh]`: Define the geometry of the domain
- `[Variables]`: Define the unknown(s) of the problem
- `[Kernels]`: Define the equation(s) to solve
- `[BCs]`: Define the boundary condition(s) of the problem
- `[Executioner]`: Define how the problem will solve
- `[Outputs]`: Define how the solution will be written

!---

## Step 1: Input File

!listing step01_diffusion/problems/step1.i

!---

## Step 1: Run and Visualize with Peacock

```bash
cd ~/projects/moose/tutorials/darcy-thermo_mech/step01_diffusion
make -j 12 # use number of processors for you system
cd problems
~/projects/moose/python/peacock/peacock -i step1.i
```

!---

## Step 1: Run via Command-line

```bash
cd ~/projects/moose/tutorials/darcy-thermo_mech/step01_diffusion
make -j 12 # use number of processors for you system
cd problems
../darcy_thermo_mech-opt -i step1.i
```

!---

## Step 1: Visualize Result

```bash
~/projects/moose/python/peacock/peacock -r step1_out.e
```

!media step01_result.png

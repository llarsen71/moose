# Step 2: Pressure Kernel id=step02

!---

## Kernel Object

To implement the Darcy pressure equation, a `Kernel` object is needed to add the coefficient
to diffusion equation.

!equation
-\nabla \cdot \frac{\mathbf{K}}{\mu} \nabla p = 0,

where $\textbf{K}$ is the permeability tensor and $\mu$ is the fluid viscosity.

A `Kernel` is C++ class, which inherits from `MooseObject` that is used by MOOSE for coding
volume integrals of a [!ac!PDE].

!!end-intro

!---

## DarcyPressure Kernel

To implement the coefficient a new Kernel object must be created: `DarcyPressure`.

This object will inherit from ADDiffusion and will use input parameters for specifying the
permeability and viscosity.

!---

## DarcyPressure.h

!listing step02_darcy_pressure/include/kernels/DarcyPressure.h

!---

## DarcyPressure.C

!listing step02_darcy_pressure/src/kernels/DarcyPressure.C

!---

## Step 2: Input File

!listing step02_darcy_pressure/problems/step2.i

!---

## Step 2: Run and Visualize with Peacock

```bash
cd ~/projects/moose/tutorials/darcy-thermo_mech/step02_darcy_pressure
make -j 12 # use number of processors for you system
cd problems
~/projects/moose/python/peacock/peacock -i step2.i
```

!---

## Step 2: Run via Command-line

```bash
cd ~/projects/moose/tutorials/darcy-thermo_mech/step02_darcy_pressure
make -j 12 # use number of processors for you system
cd problems
../darcy_thermo_mech-opt -i step2.i
```

!---

## Step 2: Visualize Result

```bash
~/projects/moose/python/peacock/peacock -r step2_out.e
```

!media step02_result.png

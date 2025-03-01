# Step 10: Multiscale Simulation id=step10

!---

Run full simulation but compute thermal conductivity and porosity from micro-structure

!!end-intro

!---

## RandomCorrosion.h

!listing step10_multiapps/include/auxkernels/RandomCorrosion.h

!---

## RandomCorrosion.C

!listing step10_multiapps/src/auxkernels/RandomCorrosion.C

!---

## Step 10: Micro-scale Input File

!listing step10_multiapps/problems/step10_micro.i

!---

## Step 10: Run and Visualize Micro-scale

```bash
cd ~/projects/moose/tutorials/darcy-thermo_mech/step10_multiapps
make -j 12 # use number of processors for you system
cd problems
~/projects/moose/python/peacock/peacock -i step10_micro.i
```

!---

## Step 10: Micro-scale Results

!media step10_micro_result.mp4

!---

## PackedColumn.h

!listing step10_multiapps/include/materials/PackedColumn.h

!---

## PackedColumn.C

!listing step10_multiapps/src/materials/PackedColumn.C

!---

## Step 10: Multi-scale Input File

!listing step10_multiapps/problems/step10_micro.i

!---

## Step 10: Run and Visualize Multi-scale

```bash
cd ~/projects/moose/tutorials/darcy-thermo_mech/step10_multiapps
make -j 12 # use number of processors for you system
cd problems
~/projects/moose/python/peacock/peacock -i step10.i
```

!---

## Step 10: Multi-scale Results

!media step10_result.mp4

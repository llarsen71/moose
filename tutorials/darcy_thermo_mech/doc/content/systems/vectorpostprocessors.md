# VectorPostprocessor System

A system for "reduction" or "aggregation" calculations based on the solution variables
that results in one or many vectors of values.

!---

## Types of VectorPostprocessors

ElementVectorPostprocessor: operate on each element

NodalVectorPostprocessor: operate on each node

SideVectorPostprocessor: operate on boundaries

InternalSideVectorPostprocessor: operate on internal element sides

GeneralVectorPostprocessor: operates once per execution

!---

## VectorPostprocessor Anatomy

`Postprocessor` is a UserObject, so `initialize`, `execute`, `threadJoin`, and `finalize` methods
are used for implementing the aggregation operation.

`virtual VectorPostprocessorValue & getVector (const std::string &vector_name)`
This is called internally within MOOSE to retrieve the final vector value for the given name, the
value returned by this function is referenced by all other objects that are using the vector
postprocessor.

!---

VectorPostprocessor objects operate a bit like Material objects, each vector is declared and then
within the "initialize", "execute", "threadJoin", and "finalize" methods the vectors are updated
with the desired data.

Create a member variable, as a reference, for the vector data

!listing WorkBalance.h line=_num_nodes


Initialize the reference using the `declareVector` method with a name

!listing WorkBalance.C line=declareVector("num_nodes")


!---

## Built-in VectorPostprocessor Types

MOOSE includes a large number built-in `VectirPostprocessors`: `NodalValueSampler`,
`LineValueSampler`, `PointValueSampler`, and many more.

`VectorPostprocessors` output is optionally enabled using the `[Outputs]` block. A CSV file
for each vector and timestep will be created.

```text
[Output]
  csv = true
[]
```

!---

## Using a VectorPostprocessor

Postprocessor values are used within an object by creating a `const` reference to a
`VectorPostprocessorValue` and initializing the reference in the initialization list.

!listing LeastSquaresFit.h line=_x_values;

!listing LeastSquaresFit.C line=_x_values(get

# Steady-state test for the InterfaceReaction kernel.
#
# Specie M transport from domain 1 (0<=x<=1) to domain 2 (1<x<=2),
# u and v are concentrations in domain 1 and domain 2.
#
# Diffusion in both domains can be described by Ficks law and diffusion
# kernel is applied.
#
# Specie M has different diffusity in different domains, here set as D1=4, D2=2.
#
# Dirichlet boundary conditions are applied, i.e., u(0)=1, v(2)=0
#
# At the interface consider the following
#
# (a) Fluxes are matched from both domains (InterfaceDiffusion kernel)
#
# (b) First-order reaction is R = kf*u - kb*v
#
# Analytical solution is
# u = -0.2*u+1,    0<=u<=1
# v = -0.4*v+0.8,  1<v<=2

[Mesh]
  type = GeneratedMesh
  dim = 1
  nx = 10
  xmax = 2
[]

[MeshModifiers]
  [./subdomain1]
    type = SubdomainBoundingBox
    bottom_left = '1.0 0 0'
    block_id = 1
    top_right = '2.0 1.0 0'
  [../]
  [./interface]
    type = SideSetsBetweenSubdomains
    depends_on = 'subdomain1'
    master_block = '0'
    paired_block = '1'
    new_boundary = 'master0_interface'
  [../]
[]

[Variables]
  [./u]
    order = FIRST
    family = LAGRANGE
    block = '0'
  [../]
  [./v]
    order = FIRST
    family = LAGRANGE
    block = '1'
  [../]
[]

[Kernels]
  [./diff_u]
    type = MatDiffusion
    variable = u
    block = '0'
    D_name = D
  [../]
  [./diff_v]
    type = MatDiffusion
    variable = v
    block = '1'
    D_name = D
  [../]
[]

[InterfaceKernels]
  [./interface]
    type = InterfaceDiffusion
    variable = u
    neighbor_var = 'v'
    boundary = 'master0_interface'
    D = D
    D_neighbor = D
  [../]
  [./interface_reaction]
    type = InterfaceReaction
    variable = u
    neighbor_var = 'v'
    boundary = 'master0_interface'
    kf = 1 # Forward reaction rate coefficient
    kb = 2 # Backward reaction rate coefficient
  [../]
[]

[BCs]
  [./left]
    type = DirichletBC
    variable = u
    boundary = 'left'
    value = 1
  [../]
  [./right]
    type = DirichletBC
    variable = v
    boundary = 'right'
    value = 0
  [../]
[]

[Materials]
  [./block0]
    type = GenericConstantMaterial
    block = '0'
    prop_names = 'D'
    prop_values = '4'
  [../]
  [./block1]
    type = GenericConstantMaterial
    block = '1'
    prop_names = 'D'
    prop_values = '2'
  [../]
[]

[Preconditioning]
  [./smp]
    type = SMP
    full = true
  [../]
[]

[Executioner]
  type = Steady
  solve_type = PJFNK
  nl_rel_tol = 1e-10
[]

[Outputs]
  print_linear_residuals = true
  execute_on = 'FINAL'
  exodus = true
  csv = true
[]

[Debug]
  show_var_residual_norms = true
[]

[Postprocessors]
  [./elemental_error_u]
    type = ElementL2Error
    function = -0.2*x+1
    variable = 'u'
    block = '0'
  [../]
  [./elemental_error_v]
    type = ElementL2Error
    function = -0.4*x+0.8
    variable = 'v'
    block = '1'
  [../]
[]

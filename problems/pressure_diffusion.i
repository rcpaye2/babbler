[Mesh]
	type = GeneratedMesh # Can generate simple lines, rectangles. and rectanglular prisms
	dim = 2 # dimension of the mesh
	nx = 100 # num in x direction
	ny = 10 # num in y direction
	xmax = 0.304 # length in x
	ymax = 0.0257 # test chamber radius
[]

[Problem]
	type = FEProblem # 'normal' type of FE problem
	coord_type = RZ # axyssymmetric RZ
	rz_coord_axis = X # which axis the symmetry is around
[]

[Variables]
	[pressure]
		# adds a linear lagrange variable by default
	[]
[]

[Kernels]
	[diffusion]
		type = DarcyPressure # Laplacian operator
		variable = pressure # operate on the pressure var above
		permeability = 0.8451e-09
	[]
[]

[BCs]
	[inlet]
		type = ADDirichletBC
		variable = pressure
		boundary = left
		value = 4000
	[]
	[outlet]
		type = ADDirichletBC
		variable = pressure
		boundary = right
		value = 0
	[]
[]

[Executioner]
	type = Steady
	solve_type = NEWTON
# set PETSc parameters to optimize solver efficiency
	petsc_options_iname = '-pc_type -pc_hypre_type'
	petsc_options_value = ' hypre	boomeramg'
[]

[Outputs]
	exodus = true
[]
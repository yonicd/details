testthat::context('use details')

f <- scratch_desc(tempdir())

testthat::describe('bad path',{
  
  it('suggests',{
    testthat::expect_error(
      use_details('ABC'),regexp = 'invalid path'
      )
  })
  
})

testthat::describe('default',{
  
  use_details(f)
  
  it('suggests',{
    testthat::expect_equal(
      desc::desc_get_field('Suggests',file = f),
      'details'
    )
  })
  
  it('RdMacros',{
    testthat::expect_equal(
      desc::desc_get_field('RdMacros',file = f),
      'details'
    )
  })
  
  
  it('Roxygen',{
    testthat::expect_equal(
      desc::desc_get_field('Roxygen',file = f),
      'list(markdown = TRUE)'
    )
  })
  
})

testthat::describe('single fields',{
  
  desc::desc_set(Suggests='',file = f)
  
  use_details(f)
  
  it('suggests',{
    testthat::expect_equal(
      desc::desc_get_field('Suggests',file = f),
      'details'
    )
  })
  
  desc::desc_set(RdMacros='',file = f)
  
  use_details(f)
  
  it('RdMacros',{
    testthat::expect_equal(
      desc::desc_get_field('RdMacros',file = f),
      'details'
    )
  })
  
  desc::desc_set(Roxygen='',file = f)
  
  use_details(f)
  
  it('Roxygen',{
    testthat::expect_equal(
      desc::desc_get_field('Roxygen',file = f),
      'list(markdown = TRUE)'
    )
  })
  
  desc::desc_set(Roxygen='list(markdown = FALSE)',file = f)
  
  use_details(f)
  
  it('Roxygen FALSE',{
    testthat::expect_equal(
      desc::desc_get_field('Roxygen',file = f),
      'list(markdown = TRUE)'
    )
  })  
  
})

unlink(f,force = TRUE)

f <- scratch_desc(tempdir())

testthat::describe('import',{
  
  desc::desc_set_dep('details',type = 'Imports',file = f)
  
  use_details(desc_path = f)

  it('suggests empty',{
    testthat::expect_equal(desc::desc_get_field(key = 'Imports',file = f),'details')
  })
  
  it('suggests empty',{
    testthat::expect_error(desc::desc_get_field(key = 'Suggests',file = f),regexp = 'not found')
  })

})

unlink(f,force = TRUE)

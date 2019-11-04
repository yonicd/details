testthat::context('use details')

f <- scratch_desc(tempdir())

testthat::describe('bad path',{
  
  it('imports',{
    testthat::expect_error(
      use_details('ABC'),regexp = 'invalid path'
      )
  })
  
})

testthat::describe('default',{
  
  use_details(f)
  
  it('imports',{
    testthat::expect_equal(
      desc::desc_get_field('Imports',file = f),
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
  
  desc::desc_set(Imports='',file = f)
  
  use_details(f)
  
  it('imports',{
    testthat::expect_equal(
      desc::desc_get_field('Imports',file = f),
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

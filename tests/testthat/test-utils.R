testthat::context('utilities')

testthat::describe('utilities',{

  it('tooltip default',{
    testthat::expect_equal(
      build_tooltip('aaa'),
      'aaa'
    )
  })
  
  it('tooltip with text',{
    testthat::expect_equal(
      build_tooltip('aaa',tooltip = 'bbb'),
      "<span title='bbb'> aaa </span>"
    )
  })
  
  
  it('summary default',{
    testthat::expect_equal(
      build_summary('aaa'),
      "\n<summary> aaa </summary>"
    )
  })
  
  it('state open',{
    testthat::expect_equal(
      build_state(TRUE),
      "open"
    )
  })
  
  it('state closed',{
    testthat::expect_equal(
      build_state(FALSE),
      "closed"
    )
  })
  
})

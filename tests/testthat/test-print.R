testthat::context('print')

testthat::describe('print clipr',{
  testthat::skip_on_travis()
  skip_if_no_clipboard()

  it('clipr',{

    print(details::details('test',output = 'clipr'))

    testthat::expect_equal(
      unlist(strsplit(bench_fun('test'),'\\n')),
      clipr::read_clip()
    )
  })
})

testthat::describe('print methods',{
  it('console',{
    testthat::expect_output(
      print(details::details('test')),
      regexp = bench_fun('test')
    )    
  })
  
  it('character',{
    testthat::expect_equal(
      unlist(strsplit(bench_fun('test'),'\\n')),
      print(details::details('test',output = 'character'))
    )    
  })
  
})
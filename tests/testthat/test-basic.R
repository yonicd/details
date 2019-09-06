testthat::context('basic')

testthat::describe('basic',{
  
  it('empty',{
       testthat::expect_error(
         details::details(),
         regexp = 'argument "text" is missing'
        )
       })
  
  it('object',{
    testthat::expect_equal(
      print(details::details(mtcars,output = 'character')),
      unlist(strsplit(bench_fun(mtcars),'\\n'))
    )
  })
  
  it('file',{
    testthat::expect_equal(
      print(details::details(text = 'helpers.R',output = 'character')),
      unlist(strsplit(bench_fun(readLines('helpers.R')),'\\n'))
    )
  })
  
})


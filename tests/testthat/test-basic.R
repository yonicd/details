testthat::context('basic')

testthat::describe('basic',{
  
  it('empty',{
       testthat::expect_error(
         details::details(),
         regexp = 'argument "object" is missing'
        )
       })
  
  it('object',{
    testthat::skip_on_appveyor()
    testthat::expect_equal(
      print(details::details(mtcars,output = 'character')),
      unlist(strsplit(bench_fun(mtcars),'\\n'))
    )
  })
  
  it('file',{
    testthat::skip_on_appveyor()
    testthat::expect_equal(
      print(details::details(object = 'helpers.R',output = 'character')),
      unlist(strsplit(bench_fun(readLines('helpers.R')),'\\n'))
    )
  })
  
})


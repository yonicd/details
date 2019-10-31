testthat::context('basic')

testthat::describe('basic',{
  
  it('empty',{
       testthat::expect_error(
         details::details(),
         regexp = 'argument "object" is missing'
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
      print(details::details(object = 'helpers.R',output = 'character')),
      unlist(strsplit(bench_fun(readLines('helpers.R')),'\\n'))
    )
  })

  it('non file singleton',{
    testthat::expect_equal(
      print(details::details(mtcars[1,1],output = 'character')),
      unlist(strsplit(bench_fun(mtcars[1,1]),'\\n'))
    )
  })
    
  it('no lang',{
    testthat::expect_equal(
      print(details::details(object = 'helpers.R',output = 'character',lang = NULL)),
      unlist(strsplit(bench_fun(readLines('helpers.R'),lang = NULL),'\\n'))
    )
  })
  
})


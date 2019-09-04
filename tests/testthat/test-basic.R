testthat::context('basic')

testthat::describe('basic',{
  
  it('empty',{
       testthat::expect_error(
         details::details(),
         regexp = 'argument "text" is missing'
        )
       })
  
})
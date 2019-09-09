testthat::context('device')

testthat::describe('using device',{
  
  skip_on_travis()
  skip_if_offline()
  
  it('plots',{
    testthat::expect_output(
      print(details(plot(x=mtcars$mpg,y=mtcars$wt))),
      regexp = 'i.imgur.com'
    )
  })
  
})
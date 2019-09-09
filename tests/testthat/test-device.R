testthat::context('device')

testthat::describe('using device',{
  
  tf <- file.path(getwd(),'test.png')
  file.create(tf)
  testenv <- new.env()
    
  ret <- device_check(
    plot(x=mtcars$mpg,y=mtcars$wt),
    f_png = tf,
    env = testenv
    )

  it('device flag',{
    testthat::expect_true(testenv$device)
  })
  
  it('device png',{
    testthat::expect_true(file.size(testenv$f_png)>0)
  })
  
  it('device upload',{
    skip_if_offline()
    skip_on_travis()
    testthat::expect_true(grepl('imgur',imgur_upload(testenv$f_png)))
  })
  
  unlink(tf)
  
})
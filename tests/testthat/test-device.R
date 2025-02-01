testthat::context('device')

testthat::describe('using device',{
  
  tf <- file.path(tempdir(),'test.png')
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
  
  unlink(tf)

})

# reset internal png path
pkg_env <- get('details_env',envir = asNamespace('details'))

pkg_env$f_png <- NULL

testthat::describe('local device',{
  
  details(plot(x=mtcars$mpg,y=mtcars$wt),imgur = FALSE)  

  it('image created',{
    testthat::expect_true(file.size(pkg_env$f_png)>0)
  })
  
  it('env flag reset',{
    testthat::expect_true(pkg_env$imgur)
  })
  
})


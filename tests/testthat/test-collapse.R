testthat::context('fold')

testthat::describe('fold methods',{
  
  it('close',{
    testthat::expect_equal(
      foldend(),
      "\\if{html}{\\out{</details>}}"
    )    
  })
  
  it('open default',{
    testthat::expect_equal(
      foldstart(),
      "\\if{html}{\\out{<br><details>}}"
    )
  })
  
  it('open with summary',{
    testthat::expect_equal(
      foldstart(title = 'test'),
      "\\if{html}{\\out{<br><details><summary> <span title='Click to Expand'> test </span> </summary>}}"
    )
  })
  
})

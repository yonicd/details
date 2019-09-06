testthat::context('collapse')

testthat::describe('collapse methods',{
  
  it('close',{
    testthat::expect_equal(
      close_collapse(),
      "\\if{html}{\\out{</details>}}"
    )    
  })
  
  it('open default',{
    testthat::expect_equal(
      open_collapse(),
      "\\if{html}{\\out{<br><details>}}"
    )
  })
  
  it('open with summary',{
    testthat::expect_equal(
      open_collapse(summary_text = 'test'),
      "\\if{html}{\\out{<br><details><summary> <span title='Click to Expand'> test </span> </summary>}}"
    )
  })
  
})
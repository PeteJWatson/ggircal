library(GGIR)
context("ggetbout")
options(encoding = "UTF-8")
test_that("g.getbout produces expected output", {
  # Metric 1
  set.seed(300)
  bm1 = g.getbout(x=round(runif(1000,0.4,1)),boutduration = 120,boutcriter=0.9,
                  closedbout=FALSE,bout.metric=1,ws3=5)
  bm1Ex = c(rep(0,42), rep(1,6), 0, rep(1,10), 0, rep(1,13), 0, rep(1,4),
            0, rep(1,18), 0, rep(1,6), 0, rep(1,8), 0, 1, 0, rep(1,3),
            0, rep(1,14), 0, rep(1,7), 0, rep(1,8), 0, rep(1,16), 0,
            rep(1,4), rep(0,11), 1, 1, 0, rep(1,8), 0, rep(1,8), 0, rep(1,27),
             0, rep(1,12), 0, 1, 1, 0, rep(1,7), 0, 0, 1, 1,
            0, rep(1,5), 0, 1, 1, 0, rep(1,6), 0, rep(1,28), 0, 1, rep(0,693))
  bm1Eboutcount = c(rep(0,42), rep(1,131), rep(0,11), rep(1,123), rep(0,693))
  expect_that(sum(bm1$x),equals(228))
  expect_that(sum(bm1$boutcount),equals(254))
  expect_that(bm1$x,equals(bm1Ex))
  expect_that(bm1$boutcount,equals(bm1Eboutcount))
  
  # Metric 2
  set.seed(300)
  bm2 = g.getbout(x=round(runif(1000,0.4,1)),boutduration = 120,boutcriter=0.9,
                  closedbout=FALSE,bout.metric=2,ws3=5)

  bm2Ex = c(rep(0,42), rep(1,286), rep(0,672))
  bm2Eboutcount = c(rep(0,42), rep(1,286), rep(0,672))
  
  expect_that(sum(bm2$x),equals(286))
  expect_that(sum(bm2$boutcount),equals(286))
  expect_that(bm2$x,equals(bm2Ex))
  expect_that(bm2$boutcount,equals(bm2Eboutcount))
  
  # Metric 3
  set.seed(100)
  bm3 = g.getbout(x=round(runif(1000,0.4,1)),boutduration = 120,boutcriter=0.9,
                  closedbout=FALSE,bout.metric=3,ws3=5)
  bm3Ex = c(0, 0, 0, 0, rep(1,124), rep(0,91), rep(1,208), rep(0,573))
  bm3Eboutcount = c( 0, 0, 0, 0, rep(1,124),rep(0,91), rep(1,208), rep(0,573))
  expect_that(sum(bm3$x),equals(332))
  expect_that(bm3$x,equals(bm3Ex))
  expect_that(bm3$boutcount,equals(bm3Eboutcount))
  
  # Metric 4
  set.seed(300)
  bm4 = g.getbout(x=round(runif(1000,0.4,1)),boutduration = 120,boutcriter=0.9,
                  closedbout=FALSE,bout.metric=4,ws3=5)
  bm4Ex = c( rep(0,120), rep(1,124), rep(0,756))
  bm4Eboutcount = c(rep(0,120), rep(1,124), rep(0,756))
  
  expect_that(sum(bm4$x),equals(124))
  expect_that(sum(bm4$boutcount),equals(124))
  expect_that(bm4$x,equals(bm4Ex))
  expect_that(bm4$boutcount,equals(bm4Eboutcount))
})
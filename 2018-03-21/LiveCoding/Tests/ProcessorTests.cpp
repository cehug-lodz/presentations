#include <gtest/gtest.h>

#include "Implementation/Processor.hpp"

namespace
{
  constexpr bool kALotOfResources = true;
  constexpr bool kLittleResources = false;

  constexpr bool kLongRun = true;
  constexpr bool kShortRun = false;
}

TEST(ProcessorTests, lotOfResourcesAndShortRun)
{
  Processor processor(kALotOfResources);
  const auto result = processor.process(kShortRun);
  EXPECT_FALSE(result);
}

TEST(ProcessorTests, lotOfResourcesAndLongRun)
{
  Processor processor(kALotOfResources);
  const auto result = processor.process(kLongRun);
  EXPECT_TRUE(result);
}

TEST(ProcessorTests, littleOfResourcesAndShortRun)
{
  Processor processor(kLittleResources);
  const auto result = processor.process(kShortRun);
  EXPECT_FALSE(result);
}

TEST(ProcessorTests, littleOfResourcesAndLongRun)
{
  Processor processor(kLittleResources);
  const auto result = processor.process(kLongRun);
  EXPECT_TRUE(result);
}





int fibb(int n)
{
  if (n < 3)
    return 1;
  return 2;
}

TEST(FibbTests, oneGivenThenOneReceived)
{
  const int n = 1;
  
  const int res = fibb(n);
  
  EXPECT_EQ(1, res);
}

TEST(FibbTests, twoGivenThenOneReceived)
{
  const int n = 2;
  
  const int res = fibb(n);
  
  EXPECT_EQ(1, res);
}

TEST(FibbTests, threeGivenThenTwoReceived)
{
  const int n = 3;
  
  const int res = fibb(n);
  
  EXPECT_EQ(2, res);
}

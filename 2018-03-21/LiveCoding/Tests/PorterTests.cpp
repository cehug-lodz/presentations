#include <gtest/gtest.h>

#include "Implementation/Porter.hpp"
#include "Implementation/LoggerToFile.hpp"
#include "Tests/MockFile.hpp"

using namespace testing;

TEST(PorterTests, lifecycle)
{
  StrictMock<MockFile> mockFile;
  EXPECT_CALL(mockFile, open());
  EXPECT_CALL(mockFile, close());
  LoggerToFile logger(mockFile);
  
//  EXPECT_CALL(mockFile, isOpen()).WillOnce(Return(false));
  EXPECT_CALL(mockFile, isOpen()).Times(2).WillRepeatedly(Return(true));
  
  EXPECT_CALL(mockFile, write("Goodbye, sir!"));
  EXPECT_CALL(mockFile, write("Hello, sir!"));
  EXPECT_CALL(mockFile, write(_)).Times(2);
  Porter porter(logger);
}

#include <gtest/gtest.h>

#include "Implementation/LoggerToFile.hpp"
#include "Tests/MockFile.hpp"

using namespace testing;

TEST(LoggerToFile, noLinesLoggedThenOpenAndCloseFile)
{
  StrictMock<MockFile> mockFile;
  
  EXPECT_CALL(mockFile, open());
  LoggerToFile logger(mockFile);
  
  EXPECT_CALL(mockFile, close());
}

TEST(LoggerToFile, oneLineLoggedThenOpenFileAndWriteOneLineAndCloseFile)
{
  StrictMock<MockFile> mockFile;
  
  EXPECT_CALL(mockFile, open());
  EXPECT_CALL(mockFile, close());
  LoggerToFile logger(mockFile);
 
  EXPECT_CALL(mockFile, isOpen()).WillOnce(Return(true));
  EXPECT_CALL(mockFile, write("Hello world!"));
  EXPECT_CALL(mockFile, write("\n"));
  logger.logLine("Hello world!");
}

TEST(LoggerToFile, abc)
{
  StrictMock<MockFile> mockFile;
  
  EXPECT_CALL(mockFile, open());
  EXPECT_CALL(mockFile, close());
  LoggerToFile logger(mockFile);
  
  EXPECT_CALL(mockFile, isOpen()).WillOnce(Return(true));
  EXPECT_CALL(mockFile, write(_)).Times(AtLeast(1));
  logger.logLine("Hello world!");
}

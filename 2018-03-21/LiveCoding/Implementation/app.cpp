#include "File.hpp"
#include "LoggerToFile.hpp"

int main(int argc, char** argv)
{
  File logFile("logFile.txt");
  LoggerToFile logger(logFile);
  logger.logLine("hello");
  logger.logLine("world!");
  return 0;
}

#include "Implementation/Porter.hpp"

#include "Implementation/LoggerToFile.hpp"

Porter::Porter(LoggerToFile& logger)
: mLogger(logger)
{
  mLogger.logLine("Hello, sir!");
}

Porter::~Porter()
{
  mLogger.logLine("Goodbye, sir!");
}

void Porter::ask()
{
  mLogger.logLine("Yes, sir?");
}

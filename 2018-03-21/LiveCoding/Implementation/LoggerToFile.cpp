#include "Implementation/LoggerToFile.hpp"

LoggerToFile::LoggerToFile(FileInterface& file)
: mFile(file)
{
  mFile.open();
}

LoggerToFile::~LoggerToFile()
{
  mFile.close();
}

void LoggerToFile::logLine(const std::string& line)
{
  if (mFile.isOpen())
  {
    mFile.write(line);
    mFile.write("\n");
  }
}

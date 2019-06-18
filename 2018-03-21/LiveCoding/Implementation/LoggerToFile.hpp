#ifndef LOGGERTOFILE_HPP
#define LOGGERTOFILE_HPP

#include <memory>

#include "Implementation/File.hpp"

class LoggerToFile
{
public:
  LoggerToFile(FileInterface& file);
  ~LoggerToFile();

  void logLine(const std::string& line);

private:
  FileInterface& mFile;
};

#endif  // LOGGERTOFILE_HPP

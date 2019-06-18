#ifndef FILEINTERFACE_HPP
#define FILEINTERFACE_HPP

#include <string>

class FileInterface
{
public:
  virtual ~FileInterface() {}

  virtual void open() = 0;
  virtual void close() = 0;

  virtual bool isOpen() const = 0;

  virtual void read(std::string& text) = 0;
  virtual void write(const std::string& text) = 0;
};

#endif  // FILEINTERFACE_HPP

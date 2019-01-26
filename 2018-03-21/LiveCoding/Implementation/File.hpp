#ifndef FILE_HPP
#define FILE_HPP

#include <fstream>

#include "Implementation/FileInterface.hpp"

class File : public FileInterface
{
public:
  File(const std::string& fileName);
  ~File() override;

  void open() override;
  void close() override;

  bool isOpen() const override;

  void read(std::string& text) override;
  void write(const std::string& text) override;

private:
  const std::string mFileName;
  std::fstream mFileStream;
};

#endif  // FILE_HPP

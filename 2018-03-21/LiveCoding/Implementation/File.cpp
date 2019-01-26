#include "Implementation/File.hpp"

File::File(const std::string& fileName)
: mFileName(fileName)
, mFileStream()
{
  // do nothing
}

File::~File()
{
  if (isOpen())
  {
    close();
  }
}

void File::open()
{
  mFileStream.open(mFileName,
                   std::fstream::in | std::fstream::out | std::fstream::app);
}

void File::close()
{
  mFileStream.close();
}

bool File::isOpen() const
{
  return mFileStream.is_open();
}

void File::read(std::string& text)
{
  throw std::logic_error("Not yet implemented!");
}

void File::write(const std::string& text)
{
  if (!isOpen())
  {
    throw std::logic_error("File is not opened!");
  }
  mFileStream << text;
}

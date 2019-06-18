#ifndef MOCKFILE_HPP
#define MOCKFILE_HPP

#include <gmock/gmock.h>

#include "Implementation/FileInterface.hpp"

class MockFile : public FileInterface {
public:
  MOCK_METHOD0(open,
      void());
  MOCK_METHOD0(close,
      void());
  MOCK_CONST_METHOD0(isOpen,
      bool());
  MOCK_METHOD1(read,
      void(std::string& text));
  MOCK_METHOD1(write,
      void(const std::string& text));
};

#endif  // MOCKFILE_HPP

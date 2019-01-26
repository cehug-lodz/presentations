#ifndef PORTER_HPP
#define PORTER_HPP

class LoggerToFile;

class Porter
{
public:
  Porter(LoggerToFile& logger);
  ~Porter();
  void ask();

private:
  LoggerToFile& mLogger;
};

#endif  // PORTER_HPP

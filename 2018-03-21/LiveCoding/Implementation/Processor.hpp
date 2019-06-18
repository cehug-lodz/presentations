#ifndef PROCESSOR_HPP
#define PROCESSOR_HPP

#include <memory>

using ProcessResult = bool;

class Processor
{
public:
  Processor(bool _hasALotOfResources);
  ProcessResult process(bool longProcess);

private:
  bool canRunFullProcess();
  void internalLongProcess(ProcessResult& result);
  void internalShortProcessPhase1(ProcessResult& result);
  void internalShortProcessPhase2(ProcessResult& result);
  bool hasALotOfResources() const;
  void prepareResourcesForLongProcess();
  void prepareResourcesForShortProcess();

private:
  const bool mHasALotOfResources;
  std::unique_ptr<std::uint8_t[]> mResources;
};

#endif  // PROCESSOR_HPP
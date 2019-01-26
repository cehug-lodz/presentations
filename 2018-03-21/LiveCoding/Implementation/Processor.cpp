#include "Processor.hpp"

Processor::Processor(bool _hasALotOfResources)
: mHasALotOfResources(_hasALotOfResources)
, mResources()
{
  // do nothing
}

ProcessResult Processor::process(const bool tryFullProcess)
{
  ProcessResult result;

  // watch out!
  const bool shouldRunLongProcess = canRunFullProcess() && tryFullProcess;

  internalShortProcessPhase1(result);

  if (shouldRunLongProcess)
  {
    internalLongProcess(result);
  }

  internalShortProcessPhase2(result);
  
  return result;
}

bool Processor::canRunFullProcess()
{
  const bool result = hasALotOfResources();

  if (result)
  {
    prepareResourcesForLongProcess();
  }
  else
  {
    prepareResourcesForShortProcess();
  }

  return result;
}

void Processor::internalLongProcess(ProcessResult& result)
{
  if (!mResources)
  {
    throw std::logic_error("No resources allocated!");
  }
  result = true;
}

void Processor::internalShortProcessPhase1(ProcessResult& result)
{
  if (!mResources)
  {
    throw std::logic_error("No resources allocated!");
  }
  result = false;
}

void Processor::internalShortProcessPhase2(ProcessResult& result)
{
  mResources.reset();
}

bool Processor::hasALotOfResources() const
{
  return true;
}

void Processor::prepareResourcesForLongProcess()
{
  constexpr int kALotOfResources = 1024;
  mResources.reset(new std::uint8_t[kALotOfResources]);
}

void Processor::prepareResourcesForShortProcess()
{
  constexpr int kALittleResources = 8;
  mResources.reset(new std::uint8_t[kALittleResources]);
}

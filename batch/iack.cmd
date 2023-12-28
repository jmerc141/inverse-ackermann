::IAck.cmd
@echo off
pushd .
cd batch
cmd /c inv.cmd %1
echo InverseAckermann(%1)=%errorlevel%
popd

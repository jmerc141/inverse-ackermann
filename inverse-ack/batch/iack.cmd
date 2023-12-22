::IAck.cmd
@echo off
cmd /c inv.cmd %1
echo InverseAckermann(%1)=%errorlevel%

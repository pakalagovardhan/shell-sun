#!/bin/bash

echo "All varialbles passed to script:: $@"
echo "Number of variables:: $#"
echo "Script name:: $0"
echo "Current directory:: $PWD"
echo "User ruuning script:: $USER"
echo "Home directory:: $HOME"
echo "PID of the script:: $$"
sleep 10 &
echo "PID of last command in background:: $!"

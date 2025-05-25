#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "ERROR:: Please run with root access"
    exit 1
else
    echo "your running with root access"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "installing mysql is success...."
else
    echo "installing mysql is failed..."
    exit 1
fi
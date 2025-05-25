#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "ERROR::: Please run with root access"
    exit 1
else
    echo "your running with root access"
fi

dnf install mysql -y
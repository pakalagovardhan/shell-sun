#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "ERROR:: Please run with root access"
    exit 1
else
    echo "your running with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "installing $2 is success...."
    else
        echo "installing $2 is failed..."
        exit 1
    fi
}
dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "Mysql is not installed going to install it..."
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo "Mysql is already installed"
fi

dnf list installed python3

if [ $? -ne 0 ]
then 
    echo "python3 is not installed going to install it..."
    dnf install python3 -y

    VALIDATE $? "python3"
else
    echo "python3 is already installed"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo "nginx is not installed going to install it..."
    dnf install nginx -y

    VALIDATE $? "nginx"
else
    echo "nginx is already installed"
fi
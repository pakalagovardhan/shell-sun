#!/bin/bash

USER=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER -ne 0 ]
then
    echo -e "$R ERROR:: Please run with root access $N"
    exit 1
else
    echo "your running with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "installing $2 is $G success.... $N"
    else
        echo -e "installing $2 is $R failed...$N"
        exit 1
    fi
}
dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo -e "Mysql is $R not installed going to install it... $N"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo "Mysql is $Y already installed $N"
fi

dnf list installed python3

if [ $? -ne 0 ]
then 
    echo -e "python3 is $R not installed going to install it... $N"
    dnf install python3 -y

    VALIDATE $? "python3"
else
    echo "python3 is already installed"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo -e "nginx is $R not installed going to install it... $N"
    dnf install nginx -y

    VALIDATE $? "nginx"
else
    echo -e "nginx is $Y already installed $N"
fi
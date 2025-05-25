#!/bin/bash

USER=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started at:: $(date)" $N" | tee -a $LOG_FILE
if [ $USER -ne 0 ]
then
    echo -e "$R ERROR:: Please run with root access $N" | tee -a $LOG_FILE
    exit 1
else
    echo "your running with root access" $N" | tee -a $LOG_FILE
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "installing $2 is $G success.... $N" | tee -a $LOG_FILE
    else
        echo -e "installing $2 is $R failed...$N" &>>$LOG_FILE
        exit 1
    fi
}
dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo -e "Mysql is $R not installed going to install it... $N" | tee -a $LOG_FILE
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "Mysql is $Y already installed $N" &>>$LOG_FILE
fi

dnf list installed python3

if [ $? -ne 0 ]
then 
    echo -e "python3 is $R not installed going to install it... $N" &>>$LOG_FILE
    dnf install python3 -y

    VALIDATE $? "python3"
else
    echo "python3 is already installed" &>>$LOG_FILE
fi

dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo -e "nginx is $R not installed going to install it... $N" | tee -a $LOG_FILE
    dnf install nginx -y

    VALIDATE $? "nginx"
else
    echo -e "nginx is $Y already installed $N" | tee -a $LOG_FILE
fi
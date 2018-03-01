#!/bin/bash

INSTALL_DIR=/home/$USER/eDappinstall
PROJECT_DIR=/home/$USER/eDappinstall/sim
if [ ! -d "$INSTALL_DIR" ]; then
  mkdir /home/$USER/eDappinstall
fi


echo "###########################################################################################"
echo "#                                Welcome to eDapp Local                                   #"
echo "###########################################################################################"

echo "########################################################"
echo "#          Installing Application on Local             #"
echo "########################################################"

cd $INSTALL_DIR
git clone http://192.168.5.61:8080/sim

cd $PROJECT_DIR
npm install
cd artifacts/local
chmod +x bootstrap.sh
./bootstrap.sh -a
cd $PROJECT_DIR/app/node && node app.js &
cd $PROJECT_DIR/app/ui && npm install && npm start &

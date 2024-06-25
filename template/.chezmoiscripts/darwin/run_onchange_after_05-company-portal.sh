#!/bin/bash

# download company portal from url https://go.microsoft.com/fwlink/?linkid=853070
if ! [ -d "/Applications/Company Portal.app" ]; then
  echo "Company Portal wasn't found on your computer"
  echo "Downloading Company Portal from Microsoft"
  bash -c 'wget -O /tmp/CompanyPortal.pkg https://go.microsoft.com/fwlink/?linkid=853070'

  echo "Installing Company Portal, you will be asked for password:"
  sudo installer -verbose -pkg /tmp/CompanyPortal.pkg -target /
  echo "Company Portal has been installed"
else
  echo "Company Portal is already installed"
fi

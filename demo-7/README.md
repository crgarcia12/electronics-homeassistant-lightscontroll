This are my first tries with ESP32 chip.
I am using the IDF (not Arduino) and VSCode to develope
I never managed to make the debugger work with the VSCode extension

# Prerequisites
Installing the system is a pain in the butt, make sure you follow all these requirements:
https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/index.html#get-started-step-by-step

sudo apt-get install git
sudo apt-get install wget
sudo apt-get install flex
sudo apt-get install bison
sudo apt-get install gperf
sudo apt-get install python3
sudo apt-get install python3-pip
sudo apt-get install python3-setuptools
sudo apt-get install cmake
sudo apt-get install ninja-build
sudo apt-get install ccache
sudo apt-get install libffi-dev
sudo apt-get install libssl-dev
sudo apt-get install dfu-util


# Install IDF on Linux
cd ~/esp
git clone --recursive https://github.com/espressif/esp-idf.git
cd ~/esp/esp-idf
install.sh
. ./export.sh


## Find the port of your device
   cd /dev/
   $filesBefore = (gci).Name    
   // Plug your device in here
   $filesAfter = (gci).Name
   $filesAfter | ? {$filesBefore -notcontains $_} # This will compare both list

## Create a new project
cd ~/gitrepos/github/crgarcia12/arduino-first-tests/demo-7/src
cp -r $IDF_PATH/examples/get-started/hello_world .
idf.py set-target esp32
idf.py menuconfig

## Every time you want to run this
$HOME/esp/esp-idf/install.sh
. $HOME/esp/esp-idf/export.sh

cd ~/gitrepos/github/crgarcia/arduino-first-tests/demo-7/src
code .


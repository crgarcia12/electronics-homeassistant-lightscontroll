# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Users/crgar/esp/esp-idf/components/bootloader/subproject"
  "C:/gitrepos/github/crgarcia12/electronics-homeassistant-lightscontroll/tester-code/idf/blink/build/bootloader"
  "C:/gitrepos/github/crgarcia12/electronics-homeassistant-lightscontroll/tester-code/idf/blink/build/bootloader-prefix"
  "C:/gitrepos/github/crgarcia12/electronics-homeassistant-lightscontroll/tester-code/idf/blink/build/bootloader-prefix/tmp"
  "C:/gitrepos/github/crgarcia12/electronics-homeassistant-lightscontroll/tester-code/idf/blink/build/bootloader-prefix/src/bootloader-stamp"
  "C:/gitrepos/github/crgarcia12/electronics-homeassistant-lightscontroll/tester-code/idf/blink/build/bootloader-prefix/src"
  "C:/gitrepos/github/crgarcia12/electronics-homeassistant-lightscontroll/tester-code/idf/blink/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/gitrepos/github/crgarcia12/electronics-homeassistant-lightscontroll/tester-code/idf/blink/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()

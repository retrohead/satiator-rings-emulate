@ECHO OFF
SET COMPILER_DIR=../../../Compiler
SET PATH=%COMPILER_DIR%\WINDOWS\Other Utilities;%COMPILER_DIR%\WINDOWS\bin;%PATH%
copy libiapetus.a "%COMPILER_DIR%\WINDOWS\sh-elf\lib\libiapetus.a"
rm makefile
copy makefile_windows makefile
make clean
mkdir out
make
type ip.bin emulate_code.bin >> out/emulate.bin
echo "created emulate.bin"
move emulate_code.bin out/emulate_code.bin
move emulate.elf out/emulate.elf
rm makefile
copy makefile_linux makefile
pause
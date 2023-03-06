echo "\e[33m  _______________________________________________________\e[0m"
echo "\e[33m |                                                       |\e[0m"
echo "\e[33m |           欢迎使用putty自动编译脚本(linux)            |\e[0m"
echo "\e[33m |                                                       |\e[0m"
echo "\e[33m |   使用须知:                                           |\e[0m"
echo "\e[33m |   1、本脚本仅支持 Ubantu/Debian 环境                  |\e[0m"
echo "\e[33m |   2、编译文件输出目录 build，程序输出目录 output      |\e[0m"
echo "\e[33m |   3、使用sudo运行避免多次输入密码                     |\e[0m"
echo "\e[33m |   4、确定putty-src-linux.sh和putty-src-new.sh在同目录 |\e[0m"
echo "\e[33m |   5、本脚本使用交叉编译不一定稳定                     |\e[0m"
echo "\e[33m |                                                       |\e[0m"
echo "\e[33m |   最后修改: 2023/03/07 03:04:35                       |\e[0m"
echo "\e[33m |   修改人员: wanyanjiabin                              |\e[0m"
echo "\e[33m  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo "\n"
echo "\n"
echo "安装程序即将开始,请耐心等待结果"
sleep 5
echo "\n"
echo "\n"
echo "\n"
echo "\n"

clear
#安装环境
echo "\e[33m ======================= 安装环境 ======================= \e[0m"
echo "\n"
sleep 1

sudo -E apt-get -y install wget cmake mingw-w64 git unzip dos2unix

clear
#常量定义
echo "\e[33m ======================= 常量定义 ======================= \e[0m"
echo "\n"
sleep 1

BUILD_VERSION: 77
_build_no = $BUILD_VERSION-58
BUILD_NO: $_build_no

echo "即将编译的版本为0.${BUILD_VERSION}"
sleep 3

clear
#下载源文件
echo "\e[33m ======================= 下载源文件 ======================= \e[0m"
echo "\n"
sleep 1

wget "https://the.earth.li/~sgtatham/putty/0.${BUILD_VERSION}/putty-0.${BUILD_VERSION}.tar.gz"
wget "http://jakub.kotrla.net/putty/portable_putty_0${BUILD_VERSION}_0.${BUILD_NO}.0_all_in_one.zip"

clear
#解压源代码
echo "\e[33m ======================= 解压源代码 ======================= \e[0m"
echo "\n"
sleep 1

mkdir putty-src
tar -zxvf ./putty-0.${BUILD_VERSION}.tar.gz -C putty-src/
unzip ./portable_putty_0${BUILD_VERSION}_0.${BUILD_NO}.0_all_in_one.zip -d portable_putty
cp -rf ./portable_putty/0.${BUILD_VERSION}/pageant.c ./putty-src/putty-0.${BUILD_VERSION}/windows/
cp -rf ./portable_putty/0.${BUILD_VERSION}/storage.c ./putty-src/putty-0.${BUILD_VERSION}/windows/


clear
#开始汉化
echo "\e[33m ======================= 开始汉化 ======================= \e[0m"
echo "\n"
sleep 1


dos2unix ./putty-src-new.sh
cp -rf ./putty-src-new.sh ./putty-src/putty-0.${BUILD_VERSION}/
cd ./putty-src/putty-0.${BUILD_VERSION}/
chmod +x ./putty-src-new.sh
source ./putty-src-new.sh



clear
#开始编译
echo "\e[33m ======================= 开始编译 ======================= \e[0m"
echo "\n"
sleep 1

#清理残留
rm -rf ./build && rm -rf ./output && mkdir build && mkdir output
#编译
cmake -DCMAKE_TOOLCHAIN_FILE=cmake/toolchain-mingw.cmake -B "build" -D CMAKE_C_FLAGS=-fexec-charset=GBK . && cd ./build && cmake --build .
#转移文件
mv *.exe ../output
rm ../output/bidi*.exe
rm ../output/test*.exe
cd ../

:: clear
#编译完成
echo "\e[33m ======================= 编译完成 ======================= \e[0m"
echo "\n"
echo "\n"
echo "\n"
echo "恭喜!!如果你看到这行字还没有报错,那么就表示编译成功了"
echo "\n"
echo "文件输出目录: output"


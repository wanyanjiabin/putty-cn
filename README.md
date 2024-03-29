# 汉化Putty

*原始项目参考 [bbbboom](https://github.com/bbbboom/TranslateToChinese)*

## putty0.78-最新版本

**（尚未完工，目前便携文件有BUG，无法打开命令框，只能生成注册表版本 20230307）**

***从0.78版本开始增加Github actions自动编译脚本，方便直接在线编译。本地编译方式请参考0.77版本，替换版本号即可。***

如需在线编译，请先fork本仓库，然后开启actions手动运行编译脚本。

## putty0.77

***从 putty0.77 版本开始官方改用 CMake 构建***，新版本构建请使用 **putty-src-new.bat**  脚本编译。

**Windows环境编译（相对复杂，适合没有VS和Linux环境时使用）：**

1. 下载[CMake](https://cmake.org/download/) (脚本环境) 和 [Mingw-w64](https://github.com/niXman/mingw-builds-binaries/releases) (GCC编译环境) 和 [git客户端](https://git-scm.com/download/win) (perl命令环境):

   [cmake-3.24.1-windows-x86_64.msi](https://cmake.org/download/)

   [适用于 Windows 便携版的 64 位 Git](https://github.com/git-for-windows/git/releases/download/v2.37.3.windows.1/PortableGit-2.37.3-64-bit.7z.exe) (推荐便携版本，用完抛弃。*解压之后，将 **usr\bin** 目录加入windows环境变量 **PATH*** )

   [x86_64-12.2.0-release-win32-seh-rt_v10-rev0.7z](https://github.com/niXman/mingw-builds-binaries/releases/download/12.2.0-rt_v10-rev0/x86_64-12.2.0-release-win32-seh-rt_v10-rev0.7z) （注意选择 win32 seh版本）

   *MinGW在线版本有概率(墙)下载失败，下载解压离线包后将 **mingw64\bin** 目录添加至windows环境变量**PATH***

2. 下载[putty源码](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html):

   [https://the.earth.li/~sgtatham/putty/0.77/putty-src.zip](https://the.earth.li/~sgtatham/putty/0.77/putty-src.zip)

3. 解压putty-src.zip，得到文件夹 **putty-src**

4. 不需要便携化(*将服务器配置信息保存到单独文件，默认保存到注册表*)可以直接跳至 第 **7** 步

5. 下载[putty便携化源码](http://jakub.kotrla.net/putty/):

   [http://jakub.kotrla.net/putty/portable_putty_077_0.19.0_all_in_one.zip](http://jakub.kotrla.net/putty/portable_putty_077_0.19.0_all_in_one.zip)

6. 解压portable_putty_077_0.19.0_all_in_one.zip

   将portable_putty_077_0.19.0_all_in_one中的 **pageant.c** 和 **storage.c** 两个文件替换到 **putty-src/windows** 下

7. 下载 **putty-src-new.bat**  脚本和 **putty-src-new.sh ** 翻译文件，并将 **putty-src** 文件夹拖至 **putty-src-new.bat**  脚本上启动编译

8. 按脚本提示进行编译过程，最终程序输出目录为 **putty-src/output**





**VisualStudio环境编译（简单，适合有VS环境时使用）：**

1. 下载 [VisualStudio社区版](https://visualstudio.microsoft.com/zh-hans/) 和 [git客户端](https://git-scm.com/download/win) (perl命令环境):

   [VisualStudioSetup community 2022](https://c2rsetup.officeapps.live.com/c2r/downloadVS.aspx?sku=community&channel=Release&version=VS2022&source=VSLandingPage&includeRecommended=true&cid=2030:351b1543f8c24b058e1cf3b06ef0607c) (社区版免费，直接下载后安装时选C++开发环境，自带cmake等编译环境)

   [适用于 Windows 便携版的 64 位 Git](https://github.com/git-for-windows/git/releases/download/v2.37.3.windows.1/PortableGit-2.37.3-64-bit.7z.exe) (推荐便携版本，用完抛弃。*解压之后，将 **usr\bin** 目录加入windows环境变量 **PATH*** )

2. 下载[putty源码](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html):

   [https://the.earth.li/~sgtatham/putty/0.77/putty-src.zip](https://the.earth.li/~sgtatham/putty/0.77/putty-src.zip)

3. 解压putty-src.zip，得到文件夹 **putty-src**

4. 不需要便携化(*将服务器配置信息保存到单独文件，默认保存到注册表*)可以直接跳至 第 **7** 步

5. 下载[putty便携化源码](http://jakub.kotrla.net/putty/):

   [http://jakub.kotrla.net/putty/portable_putty_077_0.19.0_all_in_one.zip](http://jakub.kotrla.net/putty/portable_putty_077_0.19.0_all_in_one.zip)

6. 解压portable_putty_077_0.19.0_all_in_one.zip

   将portable_putty_077_0.19.0_all_in_one中的 **pageant.c** 和 **storage.c** 两个文件替换到 **putty-src/windows** 下

7. 下载 **putty-src-vs.bat**  脚本和 **putty-src-new.sh ** 翻译文件，并将 **putty-src** 文件夹拖至 **putty-src-vs.bat**  脚本上启动翻译

8. 翻译完成之后，右键 **putty-src** 文件夹使用 **vs2022** 打开，等待cmake自动配置完成之后，点击 **生成** => **全部生成** 来启动编译。

9. 最终输出目录在 **out** 目录下





**Linux环境编译（傻瓜式，适合有linux环境时使用）：**

1. 安装 **Debian** 或 **Ubantu** linux环境（虚拟机即可）
2. 下载 **putty-src-linux.sh** 脚本到任意目录
3. 执行linux命令  `sudo sh putty-src-linux.sh ` *注意命令所在目录*
4. 如果没有报错，1-3分钟后就会生成文件到 **output** 目录







## putty0.76 - 更老版本

*理论兼容putty0.70-0.76，这里以0.76版作为举例*  

1. 需要安装[git客户端](https://git-scm.com/download/win)（shell环境）和[Mingw-w64](https://sourceforge.net/projects/mingw-w64/files/)（编译putty）

2. 下载[putty源码](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)：  
    https://the.earth.li/~sgtatham/putty/0.76/putty-src.zip

3. 解压putty-src.zip，得到文件夹**putty-src**

4. 不需要便携化可以直接跳至 第7步

5. 下载[putty便携化源码](http://jakub.kotrla.net/putty/)：  
    http://jakub.kotrla.net/putty/portable_putty_076_0.18.0_all_in_one.zip

6. 解压portable_putty_076_0.18.0_all_in_one.zip  
将portable_putty_076_0.18.0_all_in_one中的**winpgnt.c**和**winstore.c**两个文件替换到**putty-src/windows**下

7. 下载 **putty-src-old.txt** 和 **putty-src-old.bat** ，并将**putty-src**文件夹拖至**putty-src-old.bat**  

8. 稍等片刻就可以在**putty-build**文件夹中使用编译好的exe了

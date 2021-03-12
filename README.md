什么是离线版：
===========

原版源代码中的css和js都是需要在线连接的，而有些环境是离线的，不能访问互联网，所有才有了此离线版。离线版就是在线把这些css和js逐个下载，然后改成本地调用。

关于php和windows版本
==================

原版安装文档是用的是php 5.3 和 Windows 2008 或2012，经过测试，php代码和php7兼容，windows也可以在Windows Server 2019 上安装。具体安装文档晚点放上来。
这些离线修改的代码和Server 2019 + php 7 环境未经严格测试，目前只测试了主页可以打开正常显示。待后续严格测试之后再补充。


ljc@Beijing
20200312


============下面是原版介绍==============
Video Tutorials
===============

1. How to execute an individual command http://youtu.be/CREkoloCOmk
2. Workflow basics http://youtu.be/ZJtU36kM2YY
3. Workflow variable http://youtu.be/i6z_HKgeiqY
4. Workflow template http://youtu.be/adXa6AHJaB8
5. Run workflow as command http://youtu.be/DAm70VO62VY
6. Save workflow on server http://youtu.be/_aEZhzk_Q2Y

Introduction
============

!!! PLEASE NOTE THAT ADVANCED INFORMATIONS ARE PROVIDED IN WIKI !!!
https://github.com/vmware/webcommander/wiki

WebCommander wraps scripts into web services so that those scripts could be easily consumed by remote users or other programs. 
Each script becomes a command that could be triggered by HTTP request. 
The command output is XML with browser side transforming (XSLT) which is friendly to both programs and human users at the same time.

If you prefer JSON instead of XML, please check out http://github.com/9whirls/webCommander_walnut.
WebCommander also provides 2 methods (workflow and poker) to run multiple commands together to fulfill more complex automation tasks.

WebCommander currently supports Powershell, Perl, Python and Ruby scripts. 
The built-in Powershell scripts are mainly for automating VMware vSphere and Horizon View. 
As for Perl, Python and Ruby, only 1 example script is provided respectively to illustrate how to add users' own scripts into WebCommander. 

Installation
============

To install and config WebCommander, simply download the Powershell script below.
https://github.com/vmware/webcommander/blob/master/powershell/Install/setup.ps1
Then run it on a Windows 2012 or 2008 server where Powershell 4.0 has already been installed.
Please note that this script also supports upgrading WebCommander with new source codes.
A more detailed guide for manual install and configuration is provided in wiki https://github.com/vmware/webcommander/wiki/Installation-and-configuration-guide

Contribution
============

If you want to contribute code or get any idea to improve WebCommander,
Please contact Jian Liu (Skype: whirls9@hotmail.com).

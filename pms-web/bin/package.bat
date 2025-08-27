@echo off
echo.
echo [��Ϣ] ��װWeb���̣�����node_modules�ļ���
echo.

%~d0
cd %~dp0

cd ..
pnpm install --registry=https://registry.npm.taobao.org

pause
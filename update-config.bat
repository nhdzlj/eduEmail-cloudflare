@echo off
echo 正在从.env文件更新config.js...

echo // 配置文件 - 从.env文件生成 > config.js
echo window.ENV_CONFIG = { >> config.js

for /f "tokens=1,2 delims==" %%a in (.env) do (
    if not "%%a"=="" if not "%%a"=="REM" (
        echo     %%a: '%%b', >> config.js
    )
)

echo }; >> config.js
echo. >> config.js
echo // 添加时间戳以便调试 >> config.js
echo window.ENV_CONFIG._generated = new Date().toISOString(); >> config.js
echo console.log('配置文件已加载，生成时间:', window.ENV_CONFIG._generated); >> config.js

echo config.js文件已更新完成！
echo 现在可以在浏览器中打开index.html了
pause
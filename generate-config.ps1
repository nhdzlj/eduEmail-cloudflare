# 从.env文件生成config.js的PowerShell脚本

# 检查.env文件是否存在
if (-not (Test-Path ".env")) {
    Write-Host "错误: .env文件不存在" -ForegroundColor Red
    exit 1
}

Write-Host "正在从.env文件生成config.js..." -ForegroundColor Green

# 读取.env文件内容
$envLines = Get-Content ".env"

# 开始生成config.js内容
$jsContent = @()
$jsContent += "// 配置文件 - 自动从.env文件生成"
$jsContent += "// 请勿手动编辑此文件，运行 generate-config.ps1 重新生成"
$jsContent += ""
$jsContent += "window.ENV_CONFIG = {"

# 处理每一行环境变量
foreach ($line in $envLines) {
    if ($line -and $line -notmatch "^#" -and $line -match "=") {
        $parts = $line.Split("=", 2)
        if ($parts.Length -eq 2) {
            $key = $parts[0].Trim()
            $value = $parts[1].Trim()
            
            # 移除引号（如果有的话）
            if ($value.StartsWith('"') -and $value.EndsWith('"')) {
                $value = $value.Substring(1, $value.Length - 2)
            }
            if ($value.StartsWith("'") -and $value.EndsWith("'")) {
                $value = $value.Substring(1, $value.Length - 2)
            }
            
            $jsContent += "    $key`: '$value',"
        }
    }
}

# 移除最后一个逗号
if ($jsContent[-1].EndsWith(",")) {
    $jsContent[-1] = $jsContent[-1].Substring(0, $jsContent[-1].Length - 1)
}

$jsContent += "};"
$jsContent += ""
$jsContent += "// 添加时间戳以便调试"
$jsContent += "window.ENV_CONFIG._generated = new Date().toISOString();"
$jsContent += "console.log('配置文件已加载，生成时间:', window.ENV_CONFIG._generated);"

# 写入config.js文件
$jsContent | Out-File -FilePath "config.js" -Encoding UTF8

Write-Host "config.js文件已生成完成！" -ForegroundColor Green
Write-Host "现在可以在浏览器中打开index.html了" -ForegroundColor Yellow
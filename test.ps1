$filePath = "D:\FH\powershell.txt"
$searchString = "net6.0"
$replaceString = "net6.1"

if(Test-Path -Path $filePath)
{

# 搜索文件内容
$found = Select-String -Path $filePath -Pattern $searchString
 
    # 如果没有找到匹配项，则抛出异常
    if (-not $found) {
        throw "在文件中没有找到匹配项: "+$searchString
    }
    else { 
    # 替换指定字符串
    $newContent = $fileContent -replace $searchString, $replaceString
 
    # 将修改后的内容写回文件
    $newContent | Set-Content -Path $filePath
    }
}
else{
    Write-Error "文件未找到: $fileName"
}



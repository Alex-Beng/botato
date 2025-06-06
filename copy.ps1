# copy the content to project patch
# 复制battle core文件夹到client demo的luabytecode下
$rootPath =  $PSScriptRoot
$relPath = "\mods-unpacked\Pasha-AutoBattler"


$source = $rootPath.ToString() + $relPath
$destination = "D:\Mods\Brotato\mods-unpacked\Pasha-AutoBattler"


# 遍历文件夹，除了.git文件夹
Get-ChildItem -Path $source -Recurse -Exclude ".git" | ForEach-Object {
    $destinationPath = $destination + $_.FullName.Substring($source.Length)
    if ($_.PsIsContainer) {
        if (!(Test-Path -Path $destinationPath)) {
            New-Item -Path $destinationPath -ItemType Directory
        }
    } else {
        Copy-Item -Path $_.FullName -Destination $destinationPath -Force
    }
}

# Copy-Item -Path $source -Destination $destination -Recurse -Force
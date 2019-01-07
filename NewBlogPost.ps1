$posttitle = (Read-Host -Prompt "Enter the post title")
$postyear = (Get-Date -Format "yyyy")
$postmonth = (Get-Date -Format "MM")
$postday = (Get-Date -Format "dd")

$blogpath = 'C:\Code\githubweb\brianmccarty.github.io\_posts'
$string = $posttitle.ToLower() -replace '\s',''
$postfile = $postyear + '-' + $postmonth + '-' + $postday + '-' + $string + '.md'
$postfile

Out-File -FilePath "$blogpath\$postfile" -Encoding utf8
Add-Content -Path "$blogpath\$postfile" -Value "---`nlayout: post`ntitle: $posttitle`ndate: $postyear-$postmonth-$postday`ntags: [PowerShell]`n---`n`n# $posttitle"

code "$blogpath\$postfile"

$repofile = Get-ChildItem -Path "./data/*.json"
$sizevm = "Standard_B2pts_v2"
$resultfile = @()

foreach ($file in $repofile) {
    $jsondata = Get-Content -Path $file.FullName | ConvertFrom-json
    if ($jsondata | Where-Object {$_.Name -eq $sizevm}) {
        $region = $file.BaseName
        $resultfile += $region
    }
}
 $resultfile | ConvertTo-Json | Out-File -Path ./result.json

# Steppable Pipelines
# Demo-Time
$files = 1..10 | ForEach-Object { Get-ChildItem C:\Windows -File -Force }
$files.Length # 270

foreach ($file in $files) {
	$file | Export-Csv .\files.csv -Append
} # 2s

$files | Export-Csv .\files2.csv # 74ms

$portablePipeline = { Export-Csv .\files3.csv }.GetSteppablePipeline()
$portablePipeline.Begin($true)

foreach ($file in $files) {
	$portablePipeline.Process($file)
} # 71.79ms

$portablePipeline.End()

# That Other Topic We Wanted To Talk About After Melting Brains
code "$presentationRoot\B-01-Authentication.ps1"
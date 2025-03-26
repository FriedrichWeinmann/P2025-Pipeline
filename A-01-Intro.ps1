# Pipeline Intro
## Simple & Powerful
Get-ChildItem C:\Windows -File | Where-Object { $_.LastWriteTime.Year -eq 2024 }
Get-ChildItem C:\Windows -File | Where-Object { $_.LastWriteTime.Year -eq 2024 } | Export-Csv .\output.csv
dir
Invoke-Item .\output.csv
Get-ChildItem C:\Windows -File | Where-Object { $_.LastWriteTime.Year -eq 2024 } |Select-Object Name, Attributes, FullName| Export-Csv .\output.csv
code .\output.csv

Get-ADuser -Filter * | Remove-ADUser
Get-ADuser -Filter * | Set-ADUser -Office Stuttgart

## Chaining Commands & Playing with Data
Get-ChildItem -Path F:\Temp -Recurse -File | Measure-Object Length -Sum
Get-ChildItem -Path F:\Temp -Recurse -File | Group-Object Extension | Sort-Object Count -Descending | Select-Object -First 4
Get-ChildItem -Path F:\Temp -Recurse -File | Group-Object Extension | ForEach-Object {
	[PSCustomObject]@{
		Name = $_.Name
		Count = $_.Count
		Size = ($_.Group | Measure-Object -Property Length -Sum).Sum
		Group = $_.Group
	}
} | Sort-Object Size -Descending | Select-Object -First 5

# Line Breaks
Get-ChildItem -Path F:\Temp -Recurse -File |
	Group-Object Extension |
		Sort-Object Count -Descending |
			Select-Object -First 4

# PS7.4+
Get-ChildItem -Path F:\Temp -Recurse -File
| Group-Object Extension
| Sort-Object Count -Descending
| Select-Object -First 4

code "$presentationRoot\A-02-AccessDenied.ps1"
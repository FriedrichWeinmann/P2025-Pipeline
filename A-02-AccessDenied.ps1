# The Mysterious case of ACCESS DENIED!!!!
#-> Start Typing
1..50000 | Set-Content .\numbers.txt
Get-Content .\numbers.txt | Where-Object { $_ -gt 25000 } | Set-Content .\numbers.txt

Get-Content .\numbers.txt | Where-Object { $_ -gt 25000 } | Set-Content .\numbers2.txt


code "$presentationRoot\A-03-EnterThePipeline.ps1"
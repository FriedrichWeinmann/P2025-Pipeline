# Apps In Action
# Github Repo:
# https://github.com/FriedrichWeinmann/EntraAuth.Graph.Application
Install-Module EntraAuth.Graph.Application -Scope CurrentUser
Connect-EntraService -ClientID Graph -Scopes 'Application.ReadWrite.All', 'AppRoleAssignment.ReadWrite.All'

<#
Demo was skipped due to time constraints, sorry
#>
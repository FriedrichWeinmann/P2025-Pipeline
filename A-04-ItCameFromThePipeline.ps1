# Accepting Input from the Pipeline
function Get-Name {
	[CmdletBinding()]
	param (
		[string]
		$Name
	)

	$Name
}

Get-Name -Name Fred # Works
"Fred" | Get-Name # fails

#-> Step 1: make it accept
function Get-Name {
	[CmdletBinding()]
	param (
		[Parameter(ValueFromPipeline = $true)]
		[string]
		$Name
	)

	$Name
}

Get-Name -Name Fred # Works
"Fred" | Get-Name # Works!
'Peter', 'Paul' | Get-Name # Only Paul?
#-> Functions execute in "End" by default!

#-> Step 2: Introducing Process
function Get-Name {
	[CmdletBinding()]
	param (
		[Parameter(ValueFromPipeline = $true)]
		[string]
		$Name
	)

	process {
		$Name
	}
}
Get-Name -Name Fred # Works
"Fred" | Get-Name # Works!
'Peter', 'Paul' | Get-Name # Works!!
Get-Name -Name 'Peter','Paul' # Fails

#-> 3: Array it
function Get-Name {
	[CmdletBinding()]
	param (
		[Parameter(ValueFromPipeline = $true)]
		[string[]]
		$Name
	)

	process {
		foreach ($entry in $Name) {
			$entry
		}
	}
}
Get-Name -Name Fred # Works
"Fred" | Get-Name # Works!
'Peter', 'Paul' | Get-Name # Works!!
Get-Name -Name 'Peter','Paul' # Works!!!

#-> 4. Begin & End
function Get-Name {
	[CmdletBinding()]
	param (
		[Parameter(ValueFromPipeline = $true)]
		[string[]]
		$Name
	)

	begin {
		Write-Host "Starting"
	}
	process {
		foreach ($entry in $Name) {
			$entry
		}
	}
	end {
		Write-Host "Ending"
	}
}
Get-Name -Name Fred # Works
"Fred" | Get-Name # Works!
'Peter', 'Paul' | Get-Name # Works!!
Get-Name -Name 'Peter','Paul' # Works!!!

#-> 5: The Process Difference
function Get-Name {
	[CmdletBinding()]
	param (
		[Parameter(ValueFromPipeline = $true)]
		[string[]]
		$Name
	)

	begin {
		Write-Host "Starting"
	}
	process {
		Write-Host "Starting Process"
		foreach ($entry in $Name) {
			$entry
		}
	}
	end {
		Write-Host "Ending"
	}
}
'Fred', 'Peter', 'Paul' | Get-Name # 3x Process
Get-Name -Name 'Fred','Peter','Paul' # 1x Process
<#
When calling a function with input from the pipeline, Process executes once per item (and not at all, if no item was sent).
When calling a function without input from pipeline, Process executes exactly once.
#>


# Moving on :cough: ...
code "$presentationRoot\A-05-SteppingOnPipelines.ps1"
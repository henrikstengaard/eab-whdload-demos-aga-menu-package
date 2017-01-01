Add-Type -Assembly System.IO.Compression.FileSystem

$packageDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("..\package")
$packageName = "EAB.WHDLoad.Demos.AGA.Menu"
$packageVersion = "2.6.0"
$packageFile = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(("..\{0}.{1}.zip" -f $packageName, $packageVersion))

if (test-path -path $packageFile)
{
	remove-item $packageFile -force
}

$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
[System.IO.Compression.ZipFile]::CreateFromDirectory($packageDir, $packageFile, $compressionLevel, $false)
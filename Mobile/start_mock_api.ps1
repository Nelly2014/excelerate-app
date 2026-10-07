$mobileRoot = $PSScriptRoot
$projectRoot = Split-Path -Parent $mobileRoot
$mockApiRoot = Join-Path $projectRoot 'mock-api'
$apiUrl = 'http://localhost:3000/programs'

function Test-ApiRunning {
    try {
        $response = Invoke-WebRequest -Uri $apiUrl -UseBasicParsing -TimeoutSec 1 -ErrorAction Stop
        return $response.StatusCode -ge 200 -and $response.StatusCode -lt 500
    } catch {
        return $false
    }
}

function Get-JsonServerPids {
    $processes = Get-CimInstance Win32_Process -ErrorAction SilentlyContinue
    return @(
        $processes |
        Where-Object {
            $_.Name -match 'node|node.exe' -and $_.CommandLine -match 'json-server|db.json|routes.json'
        } |
        Select-Object -ExpandProperty ProcessId -Unique
    )
}

if (Test-ApiRunning) {
    Write-Host 'Excelerate mock API is already running.'
    exit 0
}

$jsonServerPids = Get-JsonServerPids
if ($jsonServerPids.Count -gt 0) {
    Write-Host "Stopping stale json-server process(es): $($jsonServerPids -join ', ')"
    foreach ($pid in $jsonServerPids) {
        Stop-Process -Id $pid -Force -ErrorAction SilentlyContinue
    }
    Start-Sleep -Seconds 1
}

if (Test-ApiRunning) {
    Write-Host 'Excelerate mock API is already running.'
    exit 0
}

Write-Host 'Starting the Excelerate mock API on port 3000...'
Start-Process -FilePath 'npm.cmd' -ArgumentList 'start' -WorkingDirectory $mockApiRoot -WindowStyle Hidden

for ($attempt = 1; $attempt -le 15; $attempt++) {
    Start-Sleep -Seconds 1
    if (Test-ApiRunning) {
        Write-Host 'Excelerate mock API is ready.'
        exit 0
    }
}

throw 'The mock API did not start. Run "cd mock-api; npm start" to view its error output.'

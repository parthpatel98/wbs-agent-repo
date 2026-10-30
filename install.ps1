# Installs the WBS plugin for the current user and adds the short /wbs command.
# Usage: .\install.ps1 [-Source "<github-owner>/<repo>"]
param([string]$Source = $PSScriptRoot)
$ErrorActionPreference = "Stop"
if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
  Write-Error "Claude Code is not installed or not on PATH."
}
claude plugin marketplace add $Source
claude plugin install wbs@wbs-agents
$dest = Join-Path $HOME ".claude\skills\wbs"
New-Item -ItemType Directory -Force -Path $dest | Out-Null
$shim = Join-Path $PSScriptRoot "shim\wbs\SKILL.md"
if (Test-Path $shim) { Copy-Item $shim (Join-Path $dest "SKILL.md") -Force }
Write-Host "Done. Start Claude Code in a project folder and run /wbs:start (or /wbs)."

Param(
  [string]$message
)

Write-Host "Deploying updates to GitHub..."

# Build the project.
hugo -t material-design

# Go To Public folder
Set-Location public
# Add changes to git.
git add -A

# Commit changes.
$msg = "rebuilding site " + $(Get-Date)
if (![string]::IsNullOrEmpty($message)) {
  $msg = $message
}

Write-Host $msg

git commit -m $msg

# Push source and build repos.
git push origin master

# Come Back
Set-Location ..
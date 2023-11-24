# Add BitBucket as a second remote
$repoName = (Get-Item -Path (git rev-parse --show-toplevel)).Name
$bitbucketURL = "https://bitbucket.wbbinc.net/scm/ampda/${repoName}.git"
Write-Host $bitbucketURL
git remote add bitbucket $bitbucketURL

# Fetch all remote branches and prune deleted branches
git fetch origin

# List all remote branches and loop through them
git branch -r | ForEach-Object {

    $remoteBranch = $_.Trim()
    # if ($remoteBranch -notlike "origin/*") { continue }    
    echo $remoteBranch ($remoteBranch -like "origin/*")

    if ($remoteBranch -ne 'origin/HEAD -> origin/master') { 
        $localBranch = $remoteBranch -replace '^origin/', ''
        git checkout --track $remoteBranch -B $localBranch
        git push -u bitbucket $localBranch
    }    

}

# Switch back to the master branch (or specify another branch name)
git checkout master

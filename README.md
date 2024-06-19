# Reproducer for the SonarScanner CLI JGit error

Reproduces the JGit error by scanning `sonar-scanner-azdo` without `git` installed on `Debian 12`

## How to use

1. Clone this repository
2. Copy `.env.template` to `.env` and fill in:
   - the SonarScanner CLI version you want to use
   - your SonarCloud token, organization and project key
3. Run `docker compose up --build`

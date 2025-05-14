# GitHub Authentication Script

This script helps you securely store and load your GitHub credentials for easy cloning of private repositories.

## Features
- **Save GitHub credentials**: Stores your GitHub username and token in a secure, base64 encoded file.
- **Load GitHub credentials**: Loads the stored credentials when cloning a private repository.
- **Clone private repositories**: Clone private GitHub repositories using your stored credentials.

## Usage

### 1. Save your credentials
Run the script and choose the **Save login** option. You will be prompted to enter your GitHub username and personal access token (PAT). The credentials are securely stored in a file.

### 2. Clone a private repository
After saving your credentials, choose the **Clone repo** option. Enter the repository path in the format `organisation/repo` (e.g., `mycompany/project`). The script will use the saved credentials to clone the private repository.

### 3. Exit
Select the **Exit** option to quit the script.

## Requirements
- `bash`
- `git`
- `base64`

## Security
- The credentials are stored in a file (`~/.github_credentials`) with restricted read/write permissions.
- The credentials are base64 encoded, but this is not encryption. Use at your own risk.

## License
This script is released under the MIT License.

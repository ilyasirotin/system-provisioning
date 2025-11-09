# macOS Initial Setup Guide

This guide outlines the steps for setting up a new macOS environment.

## Prerequisites

### 1. Apple ID & iCloud
- [ ] Sign in to your Apple ID.
- [ ] Log in to the AppStore (this is required by `mas` - Mac App Store command-line interface).

### 2. Initial Environment Setup

1.  **Install Command Line Tools:**
    Open Terminal and run:
    ```shell
    xcode-select --install
    ```
    Follow the prompts to agree to the license terms.
    
2.  **Install Rosetta (for Apple Silicon Macs):**
    This step is necessary for running applications built for Intel processors on Apple Silicon Macs.
    ```shell
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license
    ```
3.  **Install Homebrew:**
    Follow the instructions on the [official Homebrew website](https://brew.sh/).

4.  **Install mise:**
    ```shell
    brew install mise
    ```

5.  **Clone Setup Repository:**
    Clone the `devstack-ansible` repository using your Personal Access Token (PAT):
    ```shell
    git clone https://<YOUR_PAT>@github.com/ilyasirotin/devstack-ansible.git
    ```
    *Replace `<YOUR_PAT>` with your actual Personal Access Token.*

6.  **Install Project Python Version:**
    Navigate to the cloned repository directory and use `mise` to install the Python version specified in the project:
    ```shell
    mise install
    ```

7.  **Install Ansible:**
    With the virtual environment activated, install Ansible:
    ```shell
    pip install -r requirements.txt
    ```

8.  **Install Ansible Dependencies:**
    Install dependencies listed in `requirements.yml`:
    ```shell
    ansible-galaxy install -r requirements.yml -f
    ```

9.  **Configure Playbook Settings:**
    Copy the distributed configuration file and review its settings:
    ```shell
    cp dist.config.yml config.yml
    ```
    *Open `config.yml` and adjust settings as needed.*

10. **Run Ansible Playbook:**
    Execute the main playbook. You will be prompted for your user password.
    ```shell
    ansible-playbook main.yml --ask-become-pass
    ```

## Manual Configuration Checklists

After the automated setup, some applications and system settings require manual configuration.

### Security & Privacy
- [ ] **Enable FileVault:** Encrypt your Mac's startup disk.
- [ ] **Configure Touch ID:** Add multiple fingerprints for convenience.
- [ ] **Review Privacy Settings:** Go through System Settings -> Privacy & Security to adjust application permissions.

### Finder
- [ ] **Customize Sidebar:** Review and organize folders visible in the Finder sidebar.
- [ ] **Verify iCloud Sync:** Ensure iCloud Drive synchronization is enabled and configured as desired.

### 1Password
- [ ] Log in to your 1Password account upon first launch.
- [ ] **Enable SSH Agent Integration:**
    - [ ] Navigate to 1Password -> Settings -> Developer.
    - [ ] Check the "Use the SSH Agent" option.
    - *Refer to the [1Password SSH Agent documentation](https://developer.1password.com/docs/ssh/get-started/) for more details.*
- [ ] Review and adjust common 1Password settings.
- [ ] **Integrate with 1Password CLI:**
    - [ ] In 1Password, go to Settings -> Developer.
    - [ ] Enable "Integrate with 1Password CLI".
    - [ ] Verify that the CLI integration is working correctly in your terminal.
    - [ ] **Optional:** Enable shell plugins for enhanced functionality:
        - [ ] [ngrok plugin](https://developer.1password.com/docs/cli/shell-plugins/ngrok/)
        - [ ] [GitHub plugin](https://developer.1password.com/docs/cli/shell-plugins/github/)
    - *For more information, see the [1Password CLI documentation](https://developer.1password.com/docs/cli/get-started/).*

### iTerm2
- **Configure Settings Folder Location (on first run):**
    - [ ] Open iTerm2 -> Settings (or `⌘ + ,`).
    - [ ] Go to General -> Preferences.
    - [ ] Set the path for "Load preferences from a custom folder or URL at startup" to `iCloud Drive/Configurations/iTerm2` (or your preferred synchronized location).
    - [ ] Change the "Save changes" setting to "When Quitting".
    - [ ] Review the imported settings to ensure they are applied correctly.
    - [ ] Check that shell integration features are working as expected.

### JetBrains Toolbox
- [ ] Log in to your JetBrains account when JetBrains Toolbox first launches.
- [ ] Install your desired Integrated Development Environments (IDEs) (e.g., IntelliJ IDEA, PyCharm).
- [ ] **Synchronize IDE Settings:**
    - [ ] Launch each installed IDE.
    - [ ] Open Preferences (`⌘ + ,`).
    - [ ] Navigate to "Settings Sync" (the exact name may vary slightly, e.g., "Appearance & Behavior -> Settings Sync" or a top-level "Settings Sync").
    - [ ] Enable "Sync settings across different JetBrains IDE products".
    - [ ] Configure it to "Get Settings from Account" or "Push Settings to Account" based on your setup.
    - *Refer to the [JetBrains IDE settings sync documentation](https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#IDE_settings_sync) for detailed instructions.*

## Useful System Shortcuts

### System Wide
- `⌘ + Option + Esc`: Force Quit Applications.

### Finder
- `⌘ + Shift + G`: Go to Folder (allows pasting any path).
- `⌘ + Shift + H`: Open Home directory.
- `⌘ + Shift + D`: Open Desktop folder.
- `⌘ + Shift + O`: Open Documents folder.

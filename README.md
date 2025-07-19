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
4.  **Install pyenv:**
    Refer to the [pyenv installation guide](https://github.com/pyenv/pyenv?tab=readme-ov-file#installation) for detailed instructions.
5.  **Install Pyenv Build Dependencies:**
    Install missing packages required by the `pyenv` build system:
    ```shell
    brew install xz
    ```
6.  **Clone Setup Repository:**
    Clone the `devstack-ansible` repository using your Personal Access Token (PAT):
    ```shell
    git clone https://<YOUR_PAT>@github.com/ilyasirotin/devstack-ansible.git
    ```
    *Replace `<YOUR_PAT>` with your actual Personal Access Token.*
7.  **Install Project Python Version:**
    Navigate to the cloned repository directory and use `pyenv` to install the Python version specified in the project:
    ```shell
    cd path/to/cloned/repository
    pyenv install
    ```
    *Replace `path/to/cloned/repository` with the actual path to the cloned directory.*
8.  **Initialize Python Virtual Environment:**
    Create and activate a Python virtual environment:
    ```shell
    python -m venv ./.venv && source ./.venv/bin/activate
    ```
9.  **Install Ansible:**
    With the virtual environment activated, install Ansible:
    ```shell
    pip install ansible
    ```
10. **Install Ansible Dependencies:**
    Install dependencies listed in `requirements.yml`:
    ```shell
    ansible-galaxy install -r requirements.yml -f
    ```
11. **Configure Playbook Settings:**
    Copy the distributed configuration file and review its settings:
    ```shell
    cp dist.config.yml config.yml
    ```
    *Open `config.yml` and adjust settings as needed.*
12. **Run Ansible Playbook:**
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

<a id="aldente"></a>
### AlDente
- [ ] Accept the helper installation prompt when AlDente first launches.
- **Follow the first-time configuration guide carefully:**
    - [ ] Disable "Optimized Battery Charging" in System Settings -> Battery.
    - [ ] **Important:** Skip the default customization options presented by AlDente.
    - [ ] Activate your AlDente license.
- [ ] Enable "Launch at Login" in AlDente's general settings and verify that the login item has been added in System Settings -> General -> Login Items.

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

### Logi Options+
- [ ] Log in to your Logitech account on the first launch of Logi Options+.
- [ ] Restore your device settings from the latest backup, if available.
- [ ] Disable the "AI Prompt Builder" feature if not needed.

## Useful System Shortcuts

### System Wide
- `⌘ + Option + Esc`: Force Quit Applications.

### Finder
- `⌘ + Shift + G`: Go to Folder (allows pasting any path).
- `⌘ + Shift + H`: Open Home directory.
- `⌘ + Shift + D`: Open Desktop folder.
- `⌘ + Shift + O`: Open Documents folder.

# MacOS initial setup guide

## Prerequisites

### Apple ID & iCloud
- [ ] Sign in to Apple ID
- [ ] Login in AppStore (required by mas)

### Environment setup

1. Install XCode from the AppStore
2. Install xcode command line tools:
    ```shell
    xcode-select --install
    ```
3. Agree with the license:
    ```shell
    sudo xcodebuild -license
    ```
4. Install Rosetta:
    ```shell
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license
    ```
5. Install [Homebrew](https://brew.sh/)
6. Install [pyenv](https://github.com/pyenv/pyenv?tab=readme-ov-file#installation)
7. Install missing packages required by pyenv build system:
    ```shell
    brew install xz
    ```
8. Clone repository using personal access token:
    ```shell
    git clone https://<PAT>@github.com/ilyasirotin/ansible-osx-setup.git
    ```
9. Navigate to repository and install python using pyenv:
    ```shell
    cd path/to/cloned/repository && pyenv install
    ```
10. Initialize python virtual environment:
    ```shell
    python -m venv ./.venv && source ./.venv/bin/activate
    ```
11. Install ansible:
    ```shell
    pip install ansible
    ```
12. Install ansible dependencies:
    ```shell
    ansible-galaxy install -r requirements.yml -f
    ```
13. Create config.yml and review playbook settings:
    ```shell
    cp dist.config.yml config.yml
    ```
14. Run the playbook:
    ```shell
    ansible-playbook main.yml --ask-become-pass
    ```

## Manual configuration checklists

### Security & Privacy Initial Setup
- [ ] Enable FileVault disk encryption
- [ ] Configure Touch ID (add multiple fingerprints)
- [ ] Review and configure Privacy settings

### System settings
- **Network:**
  - [ ] Firewall -> Options... - Check settings
- **Battery:**
  - [ ] Battery Health -> Optimized Battery Charging -> disable (when [Aldente](#aldente) is installed)
  - [ ] On power adapter -> High Power
- **General:**
  - **Software Update:**
    - [ ] Automatic Updates -> Install application updates from the App Store -> enable
  - **Date & Time:**
    - [ ] Review settings
  - **Language & Region:**
    - [ ] First day of week -> Monday
    - [ ] Date format -> 19/08/2024
  - **AutoFill & Passwords:**
    - [ ] AutoFill from -> Passwords -> disable
- **Appearance:**
  - [ ] Appearance -> Light
- **Apple Intelligence & Siri:**
  - [ ] Siri -> disable
- **Control Center:**
  - [ ] Review items visibility
  - [ ] Review menu bar items
- **Desktop & Dock:**
  - [ ] Click wallpaper to reveal desktop -> Only in stage manager
- **Screen saver:**
  - [ ] Sequoia
  - [ ] Show on all Spaces -> enable
- **Spotlight:**
  - [ ] Help Apple Improve Search -> disable
- **Wallpaper:**
  - [ ] Solar Gradients
  - [ ] Show on all Spaces -> enable
- **Sound:**
  - [ ] Alert sound -> Pebble
  - [ ] Play feedback when volume is changed -> enable
- **Lock Screen:**
  - [ ] Start Screen Saver when inactive -> For 10 minutes
  - [ ] Turn display off on battery when inactive -> For 10 minutes
  - [ ] Turn display off on power adapter when inactive -> For 20 minutes
  - [ ] Show large clock -> On Screen Saver and Lock Screen
  - [ ] Show 24-hour time -> enable
  - [ ] Show user name and photo -> enable
- **Privacy & Security:**
  - **Location services:**
    - [ ] Location services
    - **System Services:**
      - [ ] Check required
      - [ ] Show location icon in Control Center... -> enable
  - **Analytics & Improvements:**
    - [ ] Disable all
  - **Apple Intelligence Report:**
    - [ ] Report Duration -> Off
  - **Allow applications from:**
    - [ ] App Store & Known Developers
  - **FileVault:**
    - [ ] Enable
- **Touch ID & Password:**
  - [ ] Add fingers
  - [ ] Review features
- **iCloud:**
  - **Drive:**
    - [ ] Sync this Mac
    - [ ] Desktop & Documents Folders -> enable
    - [ ] Optimize Mac Storage
- **Keyboard:**
  - [ ] Key repeat rate -> Fast(max)
  - [ ] Delay until repeat -> Short(max)
  - [ ] Review brightness settings
  - [ ] Turn keyboard backlight off after inactivity -> 1 minute
  - [ ] Press 🌐 key to -> Change Input Source
- **Mouse:**
  - [ ] Tracking speed -> 5
  - [ ] Natural scrolling -> on
  - [ ] Double-Click Speed -> 8
  - [ ] Scrolling Speed -> 5
- **Trackpad:**
  - [ ] Tracking speed -> 5
  - [ ] Click -> Light
  - [ ] Quiet Click -> Enabled

### Finder
- [ ] Review side bar folders
- [ ] Ensure iCloud sync is enabled

### 1Password
- [ ] Login on first launch
- [ ] [Turn on SSH Agent](https://developer.1password.com/docs/ssh/get-started/):
  - [ ] 1Password -> Settings -> Developer -> Use the SSH Agent
- [ ] Review common settings
- [ ] [Integrate with 1Password CLI](https://developer.1password.com/docs/cli/get-started/):
  - [ ] 1Password -> Settings -> Developer -> Integrate with 1Password CLI
  - [ ] Check CLI integration works correctly
  - [ ] [Enable ngrok plugin](https://developer.1password.com/docs/cli/shell-plugins/ngrok/)
  - [ ] [Enable GitHub plugin](https://developer.1password.com/docs/cli/shell-plugins/github/)

[](#aldente)
### Aldente
- [ ] Accept helper installation on first launch
- **Follow first-time configuration guide:**
  - [ ] Disable Optimized Battery Chargin in System Settings
  - [ ] Skip default customization **(IMPORTANT)**
  - [ ] Activate License
- [ ] Activate "Launch at Login" in general settings (check login item was added)

### iTerm2
- **Change settings folder location on first run:**
  - [ ] Settings -> General -> Settings:
    - [ ] Set path to `iCloud Drive/Configurations/iTerm2`
    - [ ] Change **"Save changes"** seting to **"When Quitting"**
    - [ ] Review imported settings
    - [ ] Check shell integration work

### JetBrains Toolbox
- [ ] Login on to jetbrains account on first launch
- [ ] Install IDEs
- [ ] [Launch IDEs and sync settings](https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#IDE_settings_sync):
  - [ ] `⌘ + ,` -> Backup and Sync -> Enable Backup and Sync -> Check all -> Get Settings from Account

### Logi Options+
- [ ] Login to account on first launch
- [ ] Restore device settings from the last backup
- [ ] Disable AI Prompt builder

## Useful system shortcuts

### System
- `⌘ + Option + Esc` -> Force Quit

### Finder
- `⌘ + Shift + G` -> Go to folder (you can paste any path)
- `⌘ + Shift + H` -> Open Home directory
- `⌘ + Shift + D` -> Desktop
- `⌘ + Shift + O` -> Documents

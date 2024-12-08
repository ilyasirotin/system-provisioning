# MacOS initial setup guide

## Prerequisites

### Install requirements
```shell
xcode-select --install
sudo xcodebuild -license
/usr/sbin/softwareupdate --install-rosetta --agree-to-license
```

### Get ansible
```shell
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
rm get-pip.py
sudo pip3 install --ignore-installed ansible
```

### Run playbook
```shell
git clone https://<PAT>@github.com/ilyasirotin/ansible-osx-setup.git

ansible-galaxy install -r requirements.yml
cp dist.config.yml config.yml
ansible-playbook main.yml --ask-become-pass
```

## Checklists

### Security & Privacy Initial Setup
- [ ] Enable FileVault disk encryption
- [ ] Configure Touch ID (add multiple fingerprints)
- [ ] Review and configure Privacy settings

### Apple ID & iCloud
- [ ] Sign in to Apple ID
- [ ] Configure iCloud services
- [ ] Enable Find My Mac
- [ ] Set up iCloud Drive
- [ ] Login in AppStore (required by mas)

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
  - [ ] Alert sound -> Bubble
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
  - [ ] Tracking speed -> 6
  - [ ] Natural scrolling -> on
  - [ ] Double-Click Speed -> 10
  - [ ] Scrolling Speed -> 5
- **Trackpad:**
  - [ ] Tracking speed -> 6
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

### TG Pro
- [ ] Activate license on first launch

### iTerm2
- **Change settings folder location on first run:**
  - [ ] Settings -> General -> Settings:
    - [ ] Set path to `iCloud Drive/Configurations/iTerm2`
    - [ ] Change **"Save changes"** seting to **"When Quitting"**
    - [ ] Review imported settings
    - [ ] Check shell integration work

### Launchcontrol
- [ ] Activate license on first launch

### JetBrains Toolbox
- [ ] Login on to jetbrains account on first launch
- [ ] Install IDEs
- [ ] [Launch IDEs and sync settings](https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#IDE_settings_sync):
  - [ ] `⌘ + ,` -> Backup and Sync -> Enable Backup and Sync -> Check all -> Get Settings from Account

### Obsidian
- [ ] Pull vault repository from GitHub
- [ ] Open vault

### CrossOver
- [ ] Login to account on first launch
- [ ] Install WinBox

### Docker
- [ ] Login to docker hub on first launch
- [ ] Review docker desktop settings

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
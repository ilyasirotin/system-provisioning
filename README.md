# Setup

Clone repository using Personal Access Token (PAT):

```shell
git clone https://<YOUR_PAT>@github.com/ilyasirotin/devstack-ansible.git
```

## MacOS
<details open>
<summary>Prerequisites</summary>

1. **Install Command Line Tools:**
    ```shell
    xcode-select --install
    ```
2. **Install Rosetta (for Apple Silicon Macs):**
    ```shell
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license
    ```
3. [Install Homebrew](https://brew.sh/)
4. [Install Mise](https://mise.jdx.dev/getting-started.html)
5. **Copy the distributed configuration file:**
    ```shell
    cp Darwin.config.yml config.yml
    ```
</details>

## Linux

<details>
    <summary>Prerequisites</summary>

1. [Install Mise](https://mise.jdx.dev/getting-started.html)
2. **Copy the distributed configuration file:**
    ```shell
    cp RedHat.config.yml config.yml
    ```
</details>

# Playbook configuration

1. **Install Python:**
    Use `mise` to install the Python version specified in the project:
    ```shell
    mise install
    ```
2. **Install dependencies:**
    ```shell
    pip install -r requirements.txt && \
    ANSIBLE_HOME=$PWD/.ansible ansible-galaxy install -r requirements.yml -f
    ```

# **Run playbook**
```shell
# all
ANSIBLE_HOME=$PWD/.ansible ansible-playbook main.yml -K
# specific
ANSIBLE_HOME=$PWD/.ansible ansible-playbook main.yml -K --tags="vscode,dnsmasq"
```

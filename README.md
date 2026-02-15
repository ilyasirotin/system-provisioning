# Environment Setup

Clone repository using Personal Access Token (PAT):

```shell
git clone https://<YOUR_PAT>@github.com/ilyasirotin/devstack-ansible.git
```

## MacOS
<details>
<summary>Prerequisites</summary>

1.  **Install Command Line Tools:**
    ```shell
    xcode-select --install
    ```
2.  **Install Rosetta (for Apple Silicon Macs):**
    ```shell
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license
    ```
3. [Install Homebrew](https://brew.sh/)
4. [Install Mise](https://mise.jdx.dev/getting-started.html)
</details>

## Linux

<details>
    <summary>Prerequisites</summary>

 1.  [Install Mise](https://mise.jdx.dev/getting-started.html)
</details>

## Project configuration

1.  **Install Python:**
Use `mise` to install the Python version specified in the project:
```shell
mise install
```
2.  **Install dependencies:**
```shell
pip install -r requirements.txt && \
ansible-galaxy install -r requirements.yml -f && \
cp {OS}.dist.config.yml config.yml
```

## **Run playbook:**
```shell
# all
ansible-playbook main.yml --ask-become-pass
# specific
ansible-playbook main.yml --ask-become-pass --tags="vscode,dnsmasq"
```

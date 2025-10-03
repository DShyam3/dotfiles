# Mac Setup Guide

> **Complete macOS configuration for optimal productivity and workflow**

This guide covers all the essential macOS settings, applications, and terminal configurations needed to set up your Mac for development and daily use.

---

## 🖥️ Finder Configuration

### View Settings
- **View Status Bar**: Enable to show file/folder information
- **View Path Bar**: Enable to show current directory path

### Toolbar Configuration
Configure the toolbar with these essential items:
- **Information** - Quick file/folder details
- **Delete** - Easy file deletion
- **View Icons** - Toggle between view modes
- **Sort As** - File sorting options
- **Share** - Quick sharing options
- **Search** - Built-in search functionality

### Sidebar Configuration
Set up the sidebar with these folders:
- **Applications**
- **Dhyanshyam** (Home folder)
- **Downloads**
- **Screenshots**
- **Projects**
- **Documents** (iCloud Drive)
- **imp_docs** (iCloud Drive)

---

## ⚙️ System Settings

### Display
- **Shake mouse pointer to locate**: Turn OFF

### Keyboard
- **Keyboard Shortcuts → Spotlight**:
  - **Show Spotlight Search**: Turn OFF
  - **Show Finder Search window**: Turn OFF

### Control Centre
- **Show the Music Recognition**: Enable
- **Show the Battery Percentage**: Enable

### Desktop & Dock
**Turn OFF:**
- Minimise Windows into app icon
- Show Indicators for open applications
- Automatically Hide and show the dock
- Animate Opening Applications
- Show Suggested and recent Apps in dock

### Lock Screen
- **Start Screen saver when inactive**: 20 minutes
- **Require Password after screen saver or display is turned off**: Enable

---

## 🚀 Applications to Launch on Login

Configure these applications to start automatically:

| 🛠️ Application | 📝 Purpose |
|:---|:---|
| **Adguard** | System-wide ad blocking |
| **Hand Mirror** | Camera preview utility |
| **Hush** | Notification management |
| **Purepaste** | Clipboard management |
| **Better Display** | Display management |
| **IINA** | Media player |
| **Pronotes** | Note-taking app |
| **Raycast** | Productivity launcher |
| **Shottr** | Screenshot utility |

---

## 💻 Terminal Setup

### Prerequisites
Mac comes with built-in **zsh** shell.

### SSH Keys Setup
```bash
# Generate SSH key (if not already done)
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Print out the public key and copy and paste into SSH manager (Like GitHub)
cat ~/.ssh/id_ed25519.pub
```

### Package Managers Installation

#### Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Zinit (Zsh Plugin Manager)
```bash
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update
```

### Development Tools
```bash
# Install Xcode Command Line Tools
xcode-select --install

# Install Rosetta (for Apple Silicon Macs)
softwareupdate --install-rosetta --agree-to-license
```

### Yazi File Manager Theme
```bash
# Install Catppuccin Mocha theme for Yazi
ya pkg add yazi-rs/flavors:catppuccin-mocha
```

---

## 📁 Dotfiles Configuration

This repository contains configuration files for various applications and tools. Here's how to set them up:

### 🍺 Brewfile
The `Brewfile` contains all Homebrew packages and applications to install:

```bash
# Install all packages from Brewfile
brew bundle --file=Brewfile
```

This will install all the applications and command-line tools listed in the Brewfile.

### 🐚 Zsh Configuration (.zshrc)
Your repository includes a comprehensive `.zshrc` file with:

- **Zinit plugin manager** with autosuggestions, completions, fzf-tab, and syntax highlighting
- **Oh My Posh** integration with custom Catppuccin theme
- **Enhanced aliases** using `bat`, `eza`, and other modern tools
- **Path management** for Pixi, Mamba, and other tools
- **Advanced history** configuration with deduplication
- **Docker CLI completions**

To use your existing `.zshrc`:

```bash
# Copy your .zshrc to home directory
cp .zshrc ~/.zshrc

# Reload your shell
source ~/.zshrc
```

### 🎨 Cursor IDE Configuration
To apply the Cursor IDE settings:

1. **Copy the settings file:**
   ```bash
   # Create Cursor config directory if it doesn't exist
   mkdir -p ~/Library/Application\ Support/Cursor/User
   
   # Copy the settings file
   cp cursor/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
   ```

2. **Restart Cursor** for the settings to take effect.

### ⚙️ Application Configurations
Your repository includes comprehensive configurations for several applications:

#### Kitty Terminal
Your `config/kitty/` includes:
- **JetBrains Mono Nerd Font** configuration
- **Catppuccin Mocha theme** integration
- **Custom font sizing** and terminal settings

```bash
# Create kitty config directory and copy configuration
mkdir -p ~/.config/kitty
cp -r config/kitty/* ~/.config/kitty/
```

#### Oh My Posh Theme
Your `config/ohmyposh/theme.toml` includes:
- **Custom Catppuccin Mocha** color scheme
- **Multi-segment prompt** with git, python, node, container, and swift info
- **SSH session detection** and user/host display
- **Execution time tracking** and status indicators

```bash
# Create ohmyposh config directory and copy theme
mkdir -p ~/.config/ohmyposh
cp config/ohmyposh/theme.toml ~/.config/ohmyposh/theme.toml
```

#### Yazi File Manager
Your `config/yazi/` includes:
- **Complete Yazi configuration** with custom settings
- **Catppuccin Mocha theme** integration
- **Custom keybindings** and package configurations
- **Flavor system** for consistent theming

```bash
# Create yazi config directory and copy configuration
mkdir -p ~/.config/yazi
cp -r config/yazi/* ~/.config/yazi/
```

#### btop System Monitor
Your `config/btop/` includes:
- **Catppuccin Mocha theme** for btop
- **Custom layout presets** and display settings
- **Truecolor support** and rounded corners
- **Optimized performance** settings

```bash
# Create btop config directory and copy configuration
mkdir -p ~/.config/btop
cp -r config/btop/* ~/.config/btop/
```

### 🔄 Applying All Configurations
To apply all configurations at once, run these commands in order:

```bash
# 1. Install Homebrew packages from your Brewfile
brew bundle --file=Brewfile

# 2. Create all necessary config directories
mkdir -p ~/.config/{kitty,ohmyposh,yazi,btop}
mkdir -p ~/Library/Application\ Support/Cursor/User

# 3. Copy all your existing configuration files
cp .zshrc ~/.zshrc
cp -r config/kitty/* ~/.config/kitty/
cp config/ohmyposh/theme.toml ~/.config/ohmyposh/
cp -r config/yazi/* ~/.config/yazi/
cp -r config/btop/* ~/.config/btop/
cp cursor/settings.json ~/Library/Application\ Support/Cursor/User/

# 4. Reload shell to apply .zshrc changes
source ~/.zshrc
```

**Note:** Your configurations include:
- **Homebrew packages** (including CLI tools and GUI applications)
- **Comprehensive .zshrc** with Zinit, Oh My Posh, and modern aliases
- **Cursor IDE settings** with Catppuccin Mocha theme and custom preferences
- **Kitty terminal** with JetBrains Mono Nerd Font
- **Oh My Posh theme** with multi-segment prompt
- **Yazi file manager** with complete configuration and Catppuccin theme
- **btop system monitor** with Catppuccin theme and custom presets

---

## 🌐 Internet Downloads

Download and install these applications from their official websites:

| 🛠️ Application | 📝 Purpose | 🔗 Download |
|:---|:---|:---|
| **Comet** | Email client | [Official Website](https://www.cometapp.com/) |
| **VMware Fusion** | Virtualization software | [Official Website](https://www.vmware.com/products/fusion.html) |

---

## 📋 Left to Do
Automate the whole process of setting up the mac.
### 🎨 Design & Media Applications
| 🛠️ Application | 📝 Purpose |
|:---|:---|
| **Pixelmator** | Image editing |
| **Photomator** | Photo editing |
| **SerialTool** | Serial communication |
| **Folder Preview** | Quick folder previews (Paid) |
| **Command X** | Advanced clipboard (Paid) |

### 🐍 Development & Data Science
| 🛠️ Application | 📝 Purpose |
|:---|:---|
| **Pixi** | Package manager for data science |
| **Robostack** | Robotics development stack |
| **TMux** | Terminal multiplexer |
| **Tailscale** | Secure networking |

### 🎛️ System Enhancement & Automation
| 🛠️ Application | 📝 Purpose
|:---|:---|
| **Sketchybar** | Custom status bar |
| **Aerospace** | Window tiling manager |
| **JankyBorders** | Window border customization |
| **Hammerspoon** | macOS automation |

### 🔧 Future Terminal Enhancements
- **Docker aliases** - Add to `.zshrc` for container management
- **Git aliases** - Add to `.zshrc` for version control shortcuts

### 📱 Deprecated Features (macOS 26)
- **Safari Compact Tab Layout** - No longer available in macOS 26

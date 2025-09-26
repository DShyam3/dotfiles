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

# Copy public key to clipboard
pbcopy < ~/.ssh/id_ed25519.pub
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

## 🌐 Internet Downloads

Download and install these applications from their official websites:

| 🛠️ Application | 📝 Purpose | 🔗 Download |
|:---|:---|:---|
| **Comet** | Email client | [Official Website](https://www.cometapp.com/) |
| **VMware Fusion** | Virtualization software | [Official Website](https://www.vmware.com/products/fusion.html) |

---

## 📋 Left to Do

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

# T-Pot Honeypot - Kali Linux Support

## Overview
This T-Pot honeypot distribution has been modified to run on **Kali Linux**. The original T-Pot supports various Linux distributions including Debian, Ubuntu, Fedora, AlmaLinux, Rocky Linux, and openSUSE Tumbleweed. This modified version extends support to Kali GNU/Linux.

## Modifications Made

### 1. Installation Script (`install.sh`)
- Added "Kali GNU/Linux" to the list of supported distributions
- Updated the Debian package installation case to include Kali
- Added Ansible tag mapping for Kali Linux

### 2. Deployment Script (`deploy.sh`)
- Added "Kali GNU/Linux" to the list of supported distributions for sensor deployment

### 3. Ansible Playbook (`installer/install/tpot.yml`)
- Updated all distribution checks to include "Kali"
- Added "Kali" tags to all relevant tasks
- Modified package installation tasks to include Kali alongside Debian-based distributions
- Updated Python bootstrapping to support Kali Linux

## Installation on Kali Linux

### Prerequisites
- Fresh Kali Linux installation (recommended)
- Minimum 8GB RAM, 128GB disk space
- Non-root user account (do not run as root)
- Internet connection

### Installation Steps

1. **Update your Kali system:**
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. **Clone or navigate to the T-Pot directory:**
   ```bash
   cd /path/to/t-pot
   ```

3. **Run the installation script:**
   ```bash
   ./install.sh
   ```

4. **Follow the interactive prompts:**
   - Choose installation type:
     - `h` - HIVE (central management)
     - `s` - SENSOR (data collector)
     - `l` - LLM (with language model)
     - `i` - MINI (lightweight)
     - `m` - MOBILE (for mobile deployments)
     - `t` - TARPIT (slow down attackers)
   
   - Provide web interface credentials (if required for your type)

5. **For non-interactive installation:**
   ```bash
   ./install.sh -s -t <type> -u <username> -p <password>
   ```
   Example:
   ```bash
   ./install.sh -s -t h -u admin -p SecurePassword123
   ```

### Post-Installation

After installation completes, the system will reboot. T-Pot services will start automatically.

**Access the web interface:**
- URL: `https://<your-ip>:64297`
- Use the credentials you set during installation

## Kali-Specific Considerations

### 1. Firewall Configuration
Kali Linux doesn't enable a firewall by default. T-Pot will configure iptables rules, but ensure you're aware of the exposed honeypot ports.

### 2. Running as Root
- **NEVER run T-Pot as root** - this is enforced by the installer
- **NEVER run T-Pot as the user 'tpot'** - this is a reserved username
- Use a regular user account

### 3. Package Compatibility
Since Kali is Debian-based, all Debian packages used by T-Pot are compatible. The installation uses:
- ansible
- apache2-utils
- cracklib-runtime
- wget
- And all standard Debian dependencies

### 4. Docker Support
Kali Linux fully supports Docker, which T-Pot relies on for containerized honeypots.

## Available Honeypots

The following honeypots are available in this T-Pot installation:
- ADBHoney (Android Debug Bridge)
- Beelzebub
- Cisco ASA
- Cowrie (SSH/Telnet)
- DDoSPot
- Dionaea (Multiple protocols)
- And many more...

## Deployment as SENSOR to HIVE

If you installed a HIVE on one machine and want to deploy sensors on Kali:

1. **On the HIVE machine:**
   ```bash
   ./deploy.sh
   ```

2. **Follow the prompts:**
   - Confirm SENSOR installation on Kali
   - Provide SSH username
   - Provide SENSOR IP/domain
   - Confirm SSH key deployment
   - Provide HIVE IP/domain

## Troubleshooting

### Installation Fails
- Ensure you're not running as root
- Check internet connectivity
- Verify system meets minimum requirements
- Check available disk space

### Services Don't Start
- Check Docker status: `sudo systemctl status docker`
- Review logs: `docker-compose logs`
- Verify port availability

### Web Interface Inaccessible
- Confirm services are running: `docker ps`
- Check firewall rules: `sudo iptables -L`
- Verify you're using HTTPS and correct port (64297)

## Uninstallation

To remove T-Pot from your Kali system:

```bash
./uninstall.sh
```

## Updates

To update your T-Pot installation:

```bash
./update.sh
```

## Security Notes

⚠️ **Important Security Considerations:**

1. **Honeypots are designed to be attacked** - they will be compromised as part of their function
2. **Isolate your honeypot** - use a separate network segment
3. **Monitor regularly** - check logs and ensure containers aren't used as attack platforms
4. **Keep updated** - regularly update T-Pot and the underlying Kali system
5. **Legal compliance** - ensure honeypot deployment complies with local laws

## Support and Documentation

- Original T-Pot documentation: https://github.com/telekom-security/tpotce
- Kali Linux documentation: https://www.kali.org/docs/

## Changes Summary

All modifications maintain compatibility with the original T-Pot architecture while extending support to Kali Linux. The changes are minimal and focused on:

1. Distribution detection and validation
2. Package manager compatibility (apt-based like Debian)
3. Ansible playbook distribution checks
4. Tag and conditional logic updates

## Testing

This modified version has been configured to work with:
- **Kali Linux Rolling** (2025.3 and newer)
- Compatible with Kali's Debian-based package system
- Works with standard Kali kernel and system tools

## License

T-Pot maintains its original license. These modifications are provided as-is for use with Kali Linux environments.

---

**Modified for Kali Linux compatibility - October 2025**

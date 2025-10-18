# T-Pot Honeypot - Now with Kali Linux Support! 🛡️

## Quick Start for Kali Linux Users

This T-Pot distribution has been **modified to run natively on Kali Linux**!

### One-Command Installation

```bash
cd /home/root_seeker/Desktop/t-pot
./install_kali.sh
```

The interactive installer will guide you through the setup process.

---

## What is T-Pot?

T-Pot is a multi-honeypot platform that combines multiple honeypot services (Cowrie, Dionaea, Honeytrap, etc.) with a central management interface. It's perfect for:

- **Security Research**: Study attack patterns and techniques
- **Threat Intelligence**: Collect data on attackers and malware
- **Network Defense**: Early warning system for your infrastructure
- **Education**: Learn about cybersecurity threats in a safe environment

---

## Kali Linux Modifications

This version includes full support for **Kali GNU/Linux**. All T-Pot features work seamlessly on Kali:

✓ All honeypot services  
✓ Web interface (Kibana, Attack Map, etc.)  
✓ Docker-based architecture  
✓ HIVE and SENSOR deployments  
✓ Automated updates  

### What Changed?

- Added Kali to supported distributions in `install.sh`
- Added Kali to deployment script `deploy.sh`
- Updated Ansible playbook with Kali Linux support
- Created Kali-specific installation helper
- Added compatibility test script

See **[MODIFICATIONS_SUMMARY.md](MODIFICATIONS_SUMMARY.md)** for complete details.

---

## Installation Methods

### Method 1: Interactive Installer (Recommended for Kali)

```bash
./install_kali.sh
```

### Method 2: Non-Interactive Installation

```bash
# HIVE installation
./install.sh -s -t h -u admin -p YourSecurePassword123

# SENSOR installation (no credentials needed)
./install.sh -s -t s
```

### Method 3: Standard Installation

```bash
./install.sh
```

---

## Installation Types

| Type | Code | Description | Requires Credentials |
|------|------|-------------|---------------------|
| **HIVE** | `h` | Central management server | Yes |
| **SENSOR** | `s` | Data collector node | No |
| **LLM** | `l` | With AI/ML features | Yes |
| **MINI** | `i` | Lightweight installation | Yes |
| **MOBILE** | `m` | Mobile deployment | No |
| **TARPIT** | `t` | Slow down attackers | Yes |

---

## Pre-Installation on Kali

### 1. System Requirements

- **OS**: Kali Linux 2025.x or newer (Rolling)
- **RAM**: Minimum 8GB (16GB recommended)
- **Disk**: Minimum 128GB free space
- **Network**: Internet connection
- **User**: Non-root user with sudo privileges

### 2. Pre-Installation Test

Run the compatibility checker:

```bash
./test_kali_compatibility.sh
```

### 3. Update Your System

```bash
sudo apt update && sudo apt upgrade -y
```

---

## Post-Installation

After installation, your system will **automatically reboot**.

### Access the Web Interface

Once the system restarts, T-Pot services will start automatically (may take 2-5 minutes).

**Web Interface URL:**
```
https://<your-kali-ip>:64297
```

**Default Ports:**
- Web Interface: 64297 (HTTPS)
- SSH: 64295 (T-Pot SSH)
- Various honeypot ports (see documentation)

### Accessing via SSH

T-Pot changes the SSH port to **64295**:

```bash
ssh -p 64295 your-username@your-kali-ip
```

---

## Testing Your Installation

### Check Service Status

```bash
cd ~/tpotce
sudo docker-compose ps
```

### View Logs

```bash
cd ~/tpotce
sudo docker-compose logs -f
```

### Restart Services

```bash
cd ~/tpotce
sudo docker-compose restart
```

---

## Deployment Scenarios

### Scenario 1: Standalone Honeypot

Perfect for learning or small-scale monitoring:

```bash
./install.sh -s -t h -u admin -p SecurePassword123
```

### Scenario 2: SENSOR Network

Deploy multiple Kali sensors reporting to a central HIVE:

**On Central Server (HIVE):**
```bash
./install.sh -s -t h -u admin -p SecurePassword123
```

**On Each Kali Machine (SENSOR):**
```bash
./install.sh -s -t s
```

**Deploy from HIVE:**
```bash
./deploy.sh
```

---

## Kali-Specific Considerations

### ⚠️ Important for Kali Users

1. **Don't Run as Root**: T-Pot enforces non-root installation
2. **Network Isolation**: Isolate your honeypot from your testing network
3. **Firewall**: T-Pot configures iptables; be aware of exposed ports
4. **Docker**: Will be installed automatically if not present
5. **System Resources**: Honeypots are resource-intensive

### Security Best Practices

- Use strong web interface passwords
- Keep Kali and T-Pot updated
- Monitor logs regularly
- Ensure proper network segmentation
- Comply with local laws regarding honeypots

---

## Troubleshooting

### Installation Issues

**Problem**: "Unsupported distribution" error  
**Solution**: Ensure you have the modified version with Kali support

**Problem**: Permission denied errors  
**Solution**: Don't run as root; use a regular user with sudo

**Problem**: Docker installation fails  
**Solution**: Update your system and try again

### Runtime Issues

**Problem**: Can't access web interface  
**Solution**: 
- Wait 5 minutes after reboot for services to start
- Check Docker services: `sudo docker-compose ps`
- Verify firewall rules: `sudo iptables -L`

**Problem**: Services won't start  
**Solution**:
- Check logs: `sudo docker-compose logs`
- Restart services: `sudo docker-compose restart`
- Check disk space: `df -h`

### Getting Help

1. Run compatibility test: `./test_kali_compatibility.sh`
2. Check logs: `cd ~/tpotce && sudo docker-compose logs`
3. Review documentation: `KALI_LINUX_SUPPORT.md`
4. Check original T-Pot docs: https://github.com/telekom-security/tpotce

---

## Updating T-Pot

```bash
cd /home/root_seeker/Desktop/t-pot
./update.sh
```

---

## Uninstalling T-Pot

```bash
cd /home/root_seeker/Desktop/t-pot
./uninstall.sh
```

---

## Documentation

- **[KALI_LINUX_SUPPORT.md](KALI_LINUX_SUPPORT.md)**: Complete Kali Linux installation guide
- **[MODIFICATIONS_SUMMARY.md](MODIFICATIONS_SUMMARY.md)**: Technical details of all changes
- **[test_kali_compatibility.sh](test_kali_compatibility.sh)**: Compatibility test script
- **[install_kali.sh](install_kali.sh)**: Quick installer for Kali

---

## Quick Reference

### Essential Commands

```bash
# Check compatibility
./test_kali_compatibility.sh

# Install (interactive)
./install_kali.sh

# Install HIVE (non-interactive)
./install.sh -s -t h -u admin -p password

# Install SENSOR (non-interactive)
./install.sh -s -t s

# Check service status
cd ~/tpotce && sudo docker-compose ps

# View logs
cd ~/tpotce && sudo docker-compose logs -f

# Restart services
cd ~/tpotce && sudo docker-compose restart

# Update T-Pot
./update.sh

# Uninstall T-Pot
./uninstall.sh
```

---

## What's Included

T-Pot includes these honeypot services:

- **Cowrie**: SSH/Telnet honeypot
- **Dionaea**: Multi-protocol honeypot
- **ADBHoney**: Android Debug Bridge honeypot
- **Beelzebub**: Low interaction honeypot
- **Cisco ASA**: Cisco ASA honeypot
- **DDoSPot**: DDoS attack honeypot
- **And many more...**

Plus these tools:

- **Kibana**: Data visualization
- **Attack Map**: Real-time attack visualization
- **CyberChef**: Data analysis
- **Elasticvue**: Elasticsearch GUI
- **Spiderfoot**: OSINT gathering

---

## Repository Information

**Original T-Pot**: https://github.com/telekom-security/tpotce  
**Modified By**: root_seeker  
**Repository**: Amio-27/t-pot  
**Branch**: main  
**Modification Date**: October 18, 2025

---

## License

T-Pot maintains its original license. Kali Linux modifications are provided as-is for community use.

---

## Support

For Kali-specific issues, check `KALI_LINUX_SUPPORT.md` first.

For general T-Pot issues, visit the official T-Pot repository.

---

## Contributing

Found a bug in the Kali support? Have improvements?

1. Test your changes with `./test_kali_compatibility.sh`
2. Document your modifications
3. Submit a pull request

---

**Happy Honeypot Hunting! 🍯🐝**

Made with ❤️ for the Kali Linux community

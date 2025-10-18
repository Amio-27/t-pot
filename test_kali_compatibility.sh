#!/usr/bin/env bash

# T-Pot Kali Linux Compatibility Test Script
# This script verifies that Kali Linux is properly detected

echo "========================================="
echo "T-Pot Kali Linux Compatibility Test"
echo "========================================="
echo

# Check OS detection
echo "[1] Checking OS Distribution Detection..."
myCURRENT_DISTRIBUTION=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
echo "    Detected: $myCURRENT_DISTRIBUTION"

if [[ "$myCURRENT_DISTRIBUTION" == "Kali GNU/Linux" ]]; then
    echo "    ✓ Kali Linux correctly detected"
else
    echo "    ✗ Not running on Kali Linux (detected: $myCURRENT_DISTRIBUTION)"
fi
echo

# Check if Kali is in supported list
echo "[2] Checking if Kali is in supported distributions..."
mySUPPORTED_DISTRIBUTIONS=("AlmaLinux" "Debian GNU/Linux" "Fedora Linux" "Kali GNU/Linux" "openSUSE Tumbleweed" "Raspbian GNU/Linux" "Red Hat Enterprise Linux" "Rocky Linux" "Ubuntu")

if [[ " ${mySUPPORTED_DISTRIBUTIONS[@]} " =~ " ${myCURRENT_DISTRIBUTION} " ]]; then
    echo "    ✓ Kali GNU/Linux is in the supported list"
else
    echo "    ✗ Kali GNU/Linux is NOT in the supported list"
fi
echo

# Check Ansible tag assignment
echo "[3] Checking Ansible Tag Assignment..."
myANSIBLE_DISTRIBUTIONS=("Fedora Linux" "Debian GNU/Linux" "Kali GNU/Linux" "Raspbian GNU/Linux" "Rocky Linux" "Red Hat Enterprise Linux")

if [[ "${myANSIBLE_DISTRIBUTIONS[@]}" =~ "${myCURRENT_DISTRIBUTION}" ]]; then
    if [[ "${myCURRENT_DISTRIBUTION}" == "Kali GNU/Linux" ]]; then
        myANSIBLE_TAG="Kali"
        echo "    ✓ Ansible tag correctly set to: $myANSIBLE_TAG"
    else
        myANSIBLE_TAG=$(echo ${myCURRENT_DISTRIBUTION} | cut -d " " -f 1)
        echo "    Tag set to: $myANSIBLE_TAG"
    fi
else
    myANSIBLE_TAG=${myCURRENT_DISTRIBUTION}
    echo "    Tag set to: $myANSIBLE_TAG"
fi
echo

# Check required packages
echo "[4] Checking Required Packages..."
REQUIRED_PACKAGES=("ansible" "apache2-utils" "cracklib-runtime" "wget")
MISSING_PACKAGES=()

for pkg in "${REQUIRED_PACKAGES[@]}"; do
    if dpkg -l | grep -q "^ii  $pkg"; then
        echo "    ✓ $pkg is installed"
    else
        echo "    ✗ $pkg is NOT installed"
        MISSING_PACKAGES+=("$pkg")
    fi
done
echo

# Check Docker
echo "[5] Checking Docker..."
if command -v docker &> /dev/null; then
    echo "    ✓ Docker is installed"
    docker --version
else
    echo "    ✗ Docker is NOT installed"
fi
echo

# Check user
echo "[6] Checking User Requirements..."
if [[ $(whoami) == "root" ]]; then
    echo "    ✗ Running as root (T-Pot should NOT be run as root)"
elif [[ $(whoami) == "tpot" ]]; then
    echo "    ✗ Running as 'tpot' user (reserved username)"
else
    echo "    ✓ Running as user: $(whoami)"
fi
echo

# Summary
echo "========================================="
echo "Test Summary"
echo "========================================="
echo "Distribution: $myCURRENT_DISTRIBUTION"
echo "Ansible Tag: ${myANSIBLE_TAG:-Not Set}"

if [[ ${#MISSING_PACKAGES[@]} -eq 0 ]]; then
    echo "Status: All required packages are installed"
else
    echo "Status: Missing packages: ${MISSING_PACKAGES[*]}"
    echo ""
    echo "To install missing packages, run:"
    echo "    sudo apt update && sudo apt install -y ${MISSING_PACKAGES[*]}"
fi
echo "========================================="

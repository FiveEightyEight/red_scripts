# **Red Scripts**
Repository of common scripts I run.

## Installation

### MAC OSX
1. Create a copy of the script file to your local/bin directory<br/>
`cp red.sh /usr/local/bin/red`<br/>

2. Make the copy file an executable<br/>
`chmod +x /usr/local/bin/red`<br/>

## Scripts
Note: All scripts require the name of the filed copied to `local/bin` preceding the script argument. 
Example: Following installation instructions, all scripts are executed running `red <argument>`.

### Arguments
1. **`resetapp`** - Deletes node_modules, clears npm cache, removes package-lock, and reinstalls modules.
2. **`resetapp c `_`<optional commit message>`_** - In addition to reseting app, package-lock is added with optional commit message. If no commit message is passed, a default message will be used. 

---
_Note_:
Run at your own risk 🤷‍♂️ 

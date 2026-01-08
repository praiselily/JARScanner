# JARScanner
Run the build as an administrator and give the path to your mods folder, scan takes may wary in time depending on size.

Files are hashed and checked against modrinth API and then investigated if unknown. Detections include:
- Hash Database
- Cheat String Patterns
- Known Malicious Packages
- Package Structure Analysis
- Class File Analysis
- Network/API Detection
- Native Code Detection
- Bytecode Manipulation
- Obfuscation detections (in progress)

Run the application as an admin, or import it through powershell for less hassle. 

`powershell -ExecutionPolicy Bypass -Command "iwr https://raw.githubusercontent.com/praiselily/JARScanner/refs/heads/main/JARScanner.ps1 | iex`


Or Download the .exe [here](https://github.com/praiselily/JARScanner/releases/download/Screenshare/JARScanner.exe)

https://imgur.com/a/QgVu2yd

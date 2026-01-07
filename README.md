# JARScanner
This application locates javaw instances in prefetch and determines loaded mods via index. 

Files are hashed and checked against modrinth API and then investigated if unknown. Detections include:
- String searching
- Determining packaging
- Obfuscated classes
- Manifests
- File modifications
- Hardlinks

Run the application as an admin, or import it through powershell for less hassle. 

`powershell -ExecutionPolicy Bypass -Command "iwr https://raw.githubusercontent.com/praiselily/JARScanner/refs/heads/main/JARScanner.ps1 | iex"´
`https://github.com/praiselily/JARScanner/releases/download/Screenshare/JARScanner.exe´

https://imgur.com/a/QgVu2yd

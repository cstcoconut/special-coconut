# special-coconut
Free &amp; Open Source Technology For All 


# Portable Dev Suite: Coconut Core

Turn any folder into a **Coconut Core**, a select collection of portable binaries and SDKs for the following languages/toolchains: [Java 26, Python 13, GCC 15, Bun 1.3, Dotnet 10] by simply running these setup scripts. Currently this is for **WINDOWS OS only** but equivalents for linux and mac will be launched soon. Once a folder is initialized, you can link any external project to these portable runtimes.

---

## ⚡ Setup (Building the Coconut Core)
Run scripts **02 through 08** in order within the folder you want to use as your main portable hub.
* **Internal Testing:** Run `97_inCoreTerminal.bat` to verify the tools **within** the Coconut Core folder.
* **Portability:** You can carry scripts `98_` through `99_` (and `npCorePath.txt`) to **any other folder** on your drive to use your Coconut Core tools there.
* **Validation:** Use `99b_` and `99c_` in your external folders to test the connection to the Core.

---

## 🚀 Usage Examples

### 1. `98_externalTerminal.bat`
*Opens a full CMD session in your project folder with all Core tools injected into the PATH.*

* **Python:** `pip install requests` then `python main.py` to run a script with local dependencies.
* **Java:** `javac App.java` followed by `java App` to compile and run a class.
* **Dotnet:** `dotnet new console` to initialize a fresh C# project in your current directory.
* **Bun/JS:** `bun install` followed by `bun index.ts` to run a TypeScript file.
* **C/GCC:** `gcc -o myapp main.c` to compile a C program using the portable compiler.

---

### 2. `99_externalExec.bat`
*Run a single command against the Coconut Core without staying in a terminal session.*

* **Python:** `99_externalExec.bat "python -m pip install -r requirements.txt"`
* **Java:** `99_externalExec.bat "jar -cvf MyApplication.jar *.class"`
* **Dotnet:** `99_externalExec.bat "dotnet build --configuration Release"`
* **Bun/JS:** `99_externalExec.bat "bun test"` to run your test suite.
* **GCC/C++:** `99_externalExec.bat "g++ main.cpp -o app.exe"`

---

### 3. `99_externalLink.bat`
*Drag and drop a file onto this script to execute it specifically using the Coconut Core environment.*

* **Python:** Drag `script.py` onto `99_externalLink.bat` to run it instantly with the Core's Python 3.13.
* **Batch:** Drag a custom `build_all.bat` onto it to ensure the build script sees the portable `gcc` and `dotnet`.
* **Shell/Bun:** Drag a `server.ts` onto it to launch a Bun server using the Core's runtime.
* **Java:** Drag a `.jar` file onto it (if configured) or a wrapper script to run a Java app.
* **Dotnet:** Drag a `.ps1` (PowerShell) script onto it that contains `dotnet` commands to ensure they use the portable SDK.

*You can also provide the file as an argument to the 99_externalLink.bat and it will be equivalent to dragging and dropping the file over it. This is illustrated by 99c_externalRunTest.bat file*

---

**Note:** Ensure `npCorePath.txt` in your external folder contains the correct path to your Coconut Core directory. As a PRE-REQUISITE You need to have working curl, powershell and zip utilities installed on your windows for seamless extraction.

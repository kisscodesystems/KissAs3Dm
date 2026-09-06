# KissAs3Dm

KissAs3Dm holds the **two demo applications of the
[KissAs3Fw](https://github.com/kisscodesystems/KissAs3Fw) ActionScript 3
framework**. Both of them are working, buildable Adobe AIR desktop applications,
and together they are the reference of how that framework is used.

| Application       | What it is                                                                                                                                                                        |
| ----------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ApplicationDemo` | The whole application: the three layers of the framework, the menu holding one widget per component grouped by topic, and the widgets themselves — movable, resizable, minimizable, closable. A widget is built when its menu item is picked the first time. |
| `QuickUIDemo`     | The reference screen: one of every component of the `ui` package on one single screen, without the layers of the framework, calling every publicly reachable method of every one of them. Every component has a create method of its own, and those methods are the working examples of its usage. |

- **Developed by:** Jozsef Kiss — KissCode Systems Kft

## The framework has to be checked out next to this one

The demo applications are here, the framework they are built on is **a
repository of its own**. Check both of them out into the same folder:

```
~/sources/KissAs3Dm     <- this repository
~/sources/KissAs3Fw     <- git clone https://github.com/kisscodesystems/KissAs3Fw
```

The build and the test run of this project ask you once for the `src` folder of
that checkout — `~/sources/KissAs3Fw/src` above — and store the answer in
`.KISSAS3FW_SRC` in the root of this repository. Both source folders are then put
on the source path of the compiler. It does not have to be a sibling folder, that
is only the tidy way: give whatever path your framework checkout is at.

## What you need

- **A JDK or JRE** — the compiler of the AIR SDK is a java program.
- **The Harman AIR SDK**, 51.2.1 or newer.
- **A valid Harman licence** (`adt.lic`) on Linux and on macOS, both for building
  the package and for running the tests. Without it `adt` and `adl` print the
  licence banner and quit without doing anything. The runtime looks for it at
  `~/.airsdk/adt.lic`.
- **A display.** These are desktop applications, and the test run really opens
  their windows.

## Build and launch

One script builds the swf, creates the self signed certificate, packages the
bundle with `adt` and starts it:

```bash
./KissAs3Dm_build_and_launch_linux.sh                 # ApplicationDemo
./KissAs3Dm_build_and_launch_linux.sh QuickUIDemo     # QuickUIDemo
```

```bash
./KissAs3Dm_build_and_launch_macos.sh
./KissAs3Dm_build_and_launch_macos.sh QuickUIDemo
```

```powershell
powershell -ExecutionPolicy Bypass -File .\KissAs3Dm_build_and_launch_windows.ps1
powershell -ExecutionPolicy Bypass -File .\KissAs3Dm_build_and_launch_windows.ps1 QuickUIDemo
```

Without an argument the `ApplicationDemo` is built; the name of the other demo
application as the first argument builds and starts that one instead. The steps
are in `build/scripts/<platform>`, the window size and the icons of both
applications are in `build/ApplicationDemo.xml` and `build/QuickUIDemo.xml`, and
the finished bundle is written next to your AIR SDK, into
`<AIRSDK_HOME>/bin/<Application>-linux.app` (`.app` on macOS, `-windows` on
Windows). You can zip it or make an installer of it from there.

### The paths of your own computer are asked once

The build needs four things it can not know: your java, your AIR SDK, the `src`
of your KissAs3Fw checkout and your licence file. The first run asks for every
one of them and stores the answers in the root of this repository, in `.JAVA`,
`.AIRSDK_HOME`, `.KISSAS3FW_SRC` and `.LICENSE_FILE` — one plain line each. They
are in `.gitignore`, because they belong to your computer only, and they are
never asked again. See the header of `read_setting.sh` about them. A path that
does not exist is refused right there, and writing a value into a setup script by
hand still overrides the stored one.

## Test

The unit test run compiles **two** test applications — one extending each demo
application, adding nothing but the run of its suites — runs both with `adl` and
prints their reports:

```bash
bash test/KissAs3Dm_run_tests_linux.sh
```

```bash
bash test/KissAs3Dm_run_tests_macos.sh
```

```powershell
powershell -ExecutionPolicy Bypass -File .\test\KissAs3Dm_run_tests_windows.ps1
```

The reports are written to `build/testrun/as3dm/KissAs3Dm-results.txt` and
`build/testrun/as3dm/KissAs3DmQuickUI-results.txt` and printed on the standard
output. The exit code is the first non zero exit code of the two runs.

Two things are worth knowing while you watch it. The demo run takes minutes and
its window stands frozen while it works — it really builds all of the widgets one
by one, inside one single frame, which is why the applications are compiled with
a raised script execution limit. And the demo application asks its own servers for
the active servers and for the background image of its displaying style while it
starts, so with no network at all the run can be left waiting for those answers
until the timeout of the script kills it.

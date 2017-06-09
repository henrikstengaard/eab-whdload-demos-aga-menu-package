# EAB WHDLoad Demos AGA Menu Package

EAB WHDLoad Demos AGA Menu package contains menus for AGS2 and iGame with screenshots and details for all AGA demos currently available in English Board Amiga WHDLoad packs with update 2.6 applied. Menus, screenshots and details are generated using powershell scripts and data files from https://github.com/henrikstengaard/amiga-whdload-game-scripts.

**Note that this package only supports English Board Amiga WHDLoad packs as paths to start demos are specifically generated for English Board Amiga WHDLoad packs.**

## Requirements

EAB WHDLoad Demos AGA Menu package can be installed on any Amiga with Workbench 3.1 (or better) and about 40MB free space on a harddrive.

For EAB WHDLoad Demos AGA Menu package to work properly, it requires following applications and libraries are installed:
- MUI: Install MUI from http://aminet.net/util/libs/mui38usr.lha.
- GuigFX MCC for MUI: Install "guigfx.mcc" from http://aminet.net/dev/mui/MCC_Guigfx.lha.
- TextEditor MCC for MUI: Install "TextEditor.mcc" from http://aminet.net/dev/mui/MCC_TextEditor-15.47.lha or http://aminet.net/dev/mui/MCC_TextEditor_68k.lha depending on CPU is 68000 or better.
- Render Library: Install "render.library" from http://aminet.net/dev/misc/renderlib31.lha.
- GuigFX Library: Install "guigfx.library" from http://aminet.net/dev/misc/guigfxlib.lha or http://aminet.net/dev/misc/guigfxlib_nofpu.lha depending FPU is installed.
- WHDLoad: Install WHDLoad from http://whdload.de/whdload/WHDLoad_usr.lha.
- Soft-kicker: Install Soft-kicker from http://aminet.net/util/boot/skick346.lha.
- Kickstart roms for WHDLoad: Use Kickstart roms from Cloanto Amiga Forever or own dumps.

These applications and libraries are already installed, if HstWB or ClassicWB FULL, ADV, ADVSP package is installed using HstWB Installer.

HstWB Installer can automatically identify and install Kickstart roms for WHDLoad. See more details https://github.com/henrikstengaard/hstwb-installer.

For manual installation without HstWB or ClassicWB, use following guides:
- Install MUI: http://guide.abime.net/wb3.1/chap6.htm
- Install iGame, libraries, SKick, WHDLoad and Kickstart roms: http://www.awmosoft.nl/downloads/igame.pdf

## Installation

Download latest release from https://github.com/henrikstengaard/eab-whdload-demos-aga-menu-package/releases and copy it to HstWB Installer "packages" directory, which typically is "c:\Program Files (x86)\HstWB Installer\Packages".

Installation through HstWB Installer will install and configure EAB WHDLoad Demos AGA Menu package using defined assigns.

## Assigns

Installation of EAB WHDLoad Demos AGA Menu package requires and uses following assigns:

- SYSTEMDIR: = DH0:
- WHDLOADDIR: = DH1:

AGS2 and iGame demo frontends, AGS2 support files will be installed and configured in SYSTEMDIR: assign. AGS2 menus and WHDLOAD directories will be installed in WHDLOADDIR: assign.

EAB WHDLoad Demos AGA Menu package will automatically update SYSTEMDIR:S/User-Assign, SYSTEMDIR:S/Assign-Startup or SYSTEMDIR:S/Startup-Sequence with following assign:

- A-Demos: = WHDLOADDIR:WHDLoad/Demos

This assign is required for AGS2 to work as run files use it to start demos. 

## AGS2

For AGS2 following features had been added in ".Settings" folder:

- Favourites mode: Add or remove demos in ".Favourites" folder in AGS2 menu.
- Music: Turn music on and off for AGS2 menus.
- WHDLoad ButtonWait: Turn ButtonWait option on or off.
- WHDLoad ExpChip: Turn ExpChip option on or off.
- WHDLoad NoAutoVec: Turn NoAutoVec option on or off.
- WHDLoad NoCache: Turn NoCache option on or off.
- WHDLoad NoVBRMove: Turn NoVBRMove option on or off.
- WHDLoad Preload: Turn Preload option on or off.
- Settings: View and save settings for Favourites mode, Music and WHDLoad options.

Favourites mode can be set to the following:

- Add: Adds demo to favourites and returns to AGS2 menu
- Add & Run: Add demo to favourites and run it using WHDLoad.
- Remove: Queues demo to be removed from favourites and returns to AGS2 menu.
- Off: Default run demo using WHDLoad.

When turned on music a random .mod file is played while AGS2 menu is shown and will stop before running a demo. By default there aren't installed any music .mod files. They can be must copied to directory "WHDLOADDIR:Menu/AGS2Demos/Music" (unless changed).

WHDLOAD ButtonWait option makes WHDLoad wait for pressing a button when it shows pictures and/or plays music.

WHDLoad ExpChip option forces WHDLOAD to allocate required memory in Chip Memory and may result in performance degration.
This option can be turned on as an attempt to slow down demos.

WHDLoad NoAutoVec option ensures WHDLoad doesn't quit, if unexpected autovector interrupt or NMI occurs.
This option can be turned on, if WHDLoad crashes with error message "NMI Autovector".

WHDLoad NoCache option makes WHDLOAD disable all caches. 
This option can be turned on as an attempt to slow down demos.

WHDLoad NoVBRMove option moves the vector table using the VBR (Vector Base Register) to a different memory location.
This option can be turned on as an attempt to fix issues running demos.

WHDLoad Preload option makes WHDLoad load data files and disk images into memory to increase performance.
This option is turned on by default to avoid screen flickering, when demos are loading data files.
For lowend Amiga's without Fast memory or accelerator, this option can be turned off, so they can still run most WHDLoad demos.

To preserve settings between reboots, use "Save settings" to write settings to harddisk.

## Configure menus

A configure menus script is installed to SYSTEMDIR:Programs/Configuration to assist with following AGS2 actions:

- Add: Add a demo to AGS2 menu.
- Rename: Rename a demo in AGS2 menu.
- Delete: Delete a demo from AGS2 menu.
- Show Existing: Show only AGS2 menu items for demos, they are installed.
- Show All: Show all AGS2 menu items for demos.
- Hide All: Hide all AGS2 menu items for demos.

### Add

Add action adds a demo to AGS2 menu. It supports hstwbmenuitem.data, WHDLoad slave or any executable file.

Configure menus will present a file selection dialog to select file or a demo to add.
To determine how the selected file will be added, it's will be defined in the following order:

1. HstWB menu item: If filename is "hstwbmenuitem.data".
2. WHDLoad slave: If filename ends with ".slave".
3. Start run file: If filename doesn't match any of the above.

**Note: Using hstwbmenuitem.data gives most flexibility as it allows custom run script to start a demo.**

A AGS2 .run file is created by following parts:

1. S:AGS2RunPreTemplate template: A script template executed before run script for selected file.

2. Run script for selected file:
    1. For a filename of type HstWB menu item, hstwbmenuitem.run will be used it as run script.
    2. For a filename of type WHDLoad slave, S:AGS2WHDLoadRunTemplate template will be used to build a run script for WHDLoad slave.
    3. For a filename of type start run file, a simple run script is build to run the selected file.

3. S:AGS2RunPostTemplate template: A script template executed after run script for selected file.

Configure menus will check if selected file has .iff and .txt next to it. Iff file will be used for screenshot shown in AGS2 menu. For AGA screenshots, the iff file must be an 8-bit image with a max of 200 colors. For OCS screenshots, the iff file must be 4-bit with a maximum of 12 colors. Txt file will be used for details shown in AGS2 menu.

Example of files used, when adding the demo State of the Art using hstwbmenuitem.data file:

- hstwbmenuitem.data: Run file and ags2 name parameters is used from this file.
- hstwbmenuitem.run: Run script to start State of the Art from AGS2 menu.
- hstwbmenuitem.iff: Screenshot for AGS2 menu.
- hstwbmenuitem.txt: Details for AGS2 menu.

Example of files used, when adding the demo State of the Art selecting WHDLoad slave file "StateOfTheArt.Slave":

- StateOfTheArt.Slave: WHDLoad slave to start State of the Art from AGS2 menu. S:AGS2WHDLoadRunTemplate template will be used to build a run script that starts State of the Art using WHDLoad.
- StateOfTheArt.iff: Screenshot for AGS2 menu.
- StateOfTheArt.txt: Details for AGS2 menu.

Example of files used, when adding the demo Little Nell by The Black Lotus selecting it's executable file "LittleNell.exe":

- LittleNell.exe: Executable for starting Little Nell from AGS2 menu. A simple run script is build to run LittleNell.exe.
- LittleNell.exe.iff: Screenshot for AGS2 menu.
- LittleNell.exe.txt: Details for AGS2 menu.

Example hstwbmenuitem.data for State of the Art:
###
    ;HstWB menu item data
    Name=State of the Art - Spaceballs
    RunFile=StateOfTheArt.Slave
    AGS2Name=State of the Art - Spaceba
    iGameName=State of the Art - Spaceballs

The templates contain placeholders which will be replaced, when building run script for AGS2 menu. Following placeholders are used in the templates below:

- "[$RunFile]": Full path to run file, which is usually the selected file.
- "[$AGS2IndexName]": Index name for AGS2 menu and is the first character of entered AGS2 name.
- "[$AGS2Name]": Entered AGS2 name.
- "[$RunDir]": Path to directory containing run file.
- "[$RunFileName]": Filename of run file without path.

S:AGS2RunPreTemplate template:
###
    ; HstWB Menu Item Run script for AGS2
    ; -----------------------------------
    ;RunFile=[$RunFile]

    ; Favourites Mode
    IF EXISTS ENV:ags2favouritesmode
      execute S:AGS2Favourites "[$AGS2IndexName]" "[$AGS2Name]"
      IF $ags2favouritesmode EQ "add"
        SKIP end
      ENDIF
      IF $ags2favouritesmode EQ "remove"
        SKIP end
      ENDIF
    ENDIF

    ; Start AGS2 Run Pre Script, if it exists
    IF EXISTS S:AGS2RunPre
      execute S:AGS2RunPre
    ENDIF

S:AGS2RunPostTemplate template:
###
    ; Start AGS2 Run Post Script, if it exists
    IF EXISTS S:AGS2RunPost
      execute S:AGS2RunPost
    ENDIF

    ; End
    LAB end

S:AGS2WhdloadRunTemplate template:
###
    ; Whdload
    cd "[$RunDir]"
    IF EXISTS ENV:whdloadargs
      whdload "[$RunFileName]" $whdloadargs
    ELSE
      whdload "[$RunFileName]"
    ENDIF

### Rename

Rename action renames a demo in AGS2 menu.

Configure menus will present lists to select the demo to delete. 
First selecting 0-Z index and the demo within that index to rename.
Finally a dialog is presented to enter new name for the selected demo. 

### Delete

Delete action deletes a demo from AGS2 menu. It doesn't delete the demo itself, it's only deleted from AGS2 menu.

Configure menus will present lists to select the demo to delete. 
First selecting 0-Z index and the demo within that index to delete.
Finally a dialog is presented to confirm deleting the selected demo. 

### Show existing

Show existing action updates AGS2 menu, so only installed demos are shown. Demos that aren't installed are hidden.
This can be used each time demos are installed or deleted to update AGS2 menu.

**Note that configure menus will quit, when done updating AGS2 menu due to limitation of AmigaDOS scripts executing other scripts.**

Configure menus iterates through all .run and .ru_ files in WHDLOADDIR:Menu/AGS2Demos and check if it's "RunFile" exists. 
This is typically a full path to WHDLoad slave like "A-Demos:S/StateOfTheArt/StateOfTheArt.Slave" for the demo State of the Art. 
Since .run files are AmigaDOS scripts the "RunFile" is added as a comment, so it doesn't disturb the script.
Here an example what the "RunFile" looks like in a .run script.
###
    ;RunFile=A-Demos:S/StateOfTheArt/StateOfTheArt.Slave 

The existence of the "RunFile" will determine if the AGS2 menu item is shown or hidden.
If the "RunFile" doesn't exist, then the AGS2 menu item is renamed from .run to .ru_ to hide it from AGS2 menu.
Vice versa if the "RunFile" exist, then the AGS2 menu item is renamed from .ru_ to .run to show it in AGS2 menu. 

### Show all

Show all action updates AGS2 menu to show all demos regardless of them being installed or not.

**Note that configure menus will quit, when done updating AGS2 menu due to limitation of AmigaDOS scripts executing other scripts.**

Configure menus iterates through all .ru_ files in WHDLOADDIR:Menu/AGS2Demos and renames .ru_ files to .run to show them in AGS2 menu. 

### Hide all

Hide all action updates AGS2 menu to hide all demos regardless of them being installed or not.

**Note that configure menus will quit, when done updating AGS2 menu due to limitation of AmigaDOS scripts executing other scripts.**

Configure menus iterates through all .run files in WHDLOADDIR:Menu/AGS2Demos and renames .run files to .ru_ to hide them from AGS2 menu. 

## Screenshots

Screenshots of EAB WHDLoad Demos AGA Menu package.

### AGS2 screenshots

Screenshots of browsing demos in AGS2.

![AGS2 1](screenshots/ags21.png?raw=true)

![AGS2 2](screenshots/ags22.png?raw=true)

Screenshots of settings in AGS2.

![AGS2 3](screenshots/ags23.png?raw=true)

### iGame screenshots

Screenshots of browsing demos in iGame.

![iGame 1](screenshots/igame1.png?raw=true)

![iGame 2](screenshots/igame2.png?raw=true)

### HstWB screenshots

Screenshots of AGS2 Demos and iGame installed in System, Demos drawer for HstWB.

![HstWB 1](screenshots/hstwb1.png?raw=true)

![HstWB 2](screenshots/hstwb2.png?raw=true)

Screenshots of Configure Menus installed in System, Programs, Configuration drawer for HstWB.

![HstWB 3](screenshots/hstwb3.png?raw=true)

![HstWB 4](screenshots/hstwb4.png?raw=true)

### ClassicWB screenshots

Screenshots of AGS2 Demos and iGame installed in System, Demos drawer for ClassicWB.

![ClassicWB 1](screenshots/classicwb1.png?raw=true)

![ClassicWB 2](screenshots/classicwb2.png?raw=true)

Screenshots of Configure Menus installed in System, Programs, Configuration drawer for ClassicWB.

![ClassicWB 3](screenshots/classicwb3.png?raw=true)

![ClassicWB 4](screenshots/classicwb4.png?raw=true)

### Workbench screenshots

Screenshots of AGS2 Demos and iGame installed in System, Demos drawer for Workbench.

![Workbench 1](screenshots/workbench1.png?raw=true)

![Workbench 2](screenshots/workbench2.png?raw=true)

Screenshots of Configure Menus installed in System, Programs, Configuration drawer for Workbench.

![Workbench 3](screenshots/workbench3.png?raw=true)

![Workbench 4](screenshots/workbench4.png?raw=true)

### Configure Menus screenshots

Screenshot of configure menus main menu.

![Configure Menus 1](screenshots/configure_menus1.png?raw=true)

Screenshot of AGS2 Demos menu.

![Configure Menus 2](screenshots/configure_menus2.png?raw=true)

Screenshot of select run file dialog, when adding demo in AGS2 menu.

![Configure Menus 3](screenshots/configure_menus3.png?raw=true)

Screenshot of enter name for AGS2 dialog shown after selecting run file, when adding demo in AGS2 menu.

![Configure Menus 4](screenshots/configure_menus4.png?raw=true)

Screenshot of select demo dialog first selecting index, when renaming or deleting a demo.

![Configure Menus 5](screenshots/configure_menus5.png?raw=true)

Screenshot of select demo dialog selecting demo in index, when renaming or deleting a demo.

![Configure Menus 6](screenshots/configure_menus6.png?raw=true)

Screenshot of show existing updating AGS2 menu to only show demos that are installed in A-Demos: assign.

![Configure Menus 7](screenshots/configure_menus7.png?raw=true)

Screenshot of show all updating AGS2 menu to show all demos.

![Configure Menus 8](screenshots/configure_menus8.png?raw=true)

Screenshot of hide all updating AGS2 menu to hide all demos.

![Configure Menus 9](screenshots/configure_menus9.png?raw=true)

### WHDLoad demos screenshot

Screenshot of Directory Opus with left panel at DH1:WHDLoad/Demos and right panel at PC: (added through WinUAE) ready for copying WHDLoad demos from PC to WHDLoad demos drawer.

![dopus_whdload_demos.png](screenshots/dopus_whdload_demos.png?raw=true)

### Music for AGS2 screenshot

Screenshot of Directory Opus with left panel at DH1:Menu/AGS2Demos/Music and right panel at PC: (added through WinUAE) ready for copying mod music files from PC to AGS2 demos menu.

![dopus_ags2demos_music.png](screenshots/dopus_ags2demos_music.png?raw=true)
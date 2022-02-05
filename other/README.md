# <img src="https://user-images.githubusercontent.com/3471625/63195758-c9beaf80-c073-11e9-82e2-74dd6af05600.jpg" width="24">&nbsp; System Preferences

### Desktop & Screen Saver

- **Desktop:** Set desktop image. Some good alternatives are...
  - [Firewatch backgrounds](https://github.com/mortnod/dotfiles/files/3511136/firewatch-backgrounds.zip)
- **Screen saver:** Set screen saver. Some good alternatives are...
  - [Saver Screensson](http://www.siggieggertsson.com/Saver-Screensson)
  - [October 30](https://github.com/lekevicius/october30) or [Brooklyn](https://github.com/pedrommcarrasco/Brooklyn)
  - [Simple Clock Screensaver](https://github.com/Wandmalfarbe/Simple-Clock-Screensaver/)
  - See [awesome-macos-screensavers](https://github.com/agarrharr/awesome-macos-screensavers) for more

### Dock & Menu Bar

- Dock & Menu Bar
  - Check _Automatically hide and show the Dock_
  - **(In the actual Dock)** Remove all applications. I prefer to only see open applications
- Now Playing
  - Uncheck "Show in menu bar"
- Battery
  - Uncheck "Show in menu bar"
- Clock
  - Uncheck "Show the day of the week
  - Uncheck "Show date"
- Spotlight
  - Uncheck "Show in menu bar"

### Mission Control

- Check _Group windows by application_

### Language & Region

- Change short date format to [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
  - This is achieved by clicking **Advanced** → **Dates** → **Short** → `YYYY-MM-DD`

### Security & Privacy

- **General:** Set _Require password [options] after sleep or screen saver begins_ to `immediately`
- **General:** Set a lock message by clicking **Set Lock Message** and writing a message. I use it to show contact information in case I lost my Mac
  - Example: ✉️ morten@noddeland.no 📞 +4791833835
- **General:** Allow apps from `App store and identified developers`
- **FileVault:** Turn it on
- **Firewall:** Turn it on

### Security & Privacy

- Check "Automatically keep my Mac up to date"

### Displays

- **Display:** Set desired screen resolution
- **Night Shift:** Turn off Night Shift. I prefer letting [f.lux](https://justgetflux.com/) handle this instead
- Uncheck _Show mirroring options in the menu bar when available_

### Battery

- **Battery:** Uncheck _Show battery status in menu bar_. This will be replaced with a better battery indicator from [iStat Menus](https://bjango.com/mac/istatmenus/)
- **Battery:** Turn off display after 5 minutes
- **Power Adapter:** Turn off display after 15 minutes

### Keyboard

- **Keyboard:** Get a physical escape key(!) by mapping it to Caps Lock. This is done by clicking **Modifier Keys...**

- **Shortcuts:** **Spotlight** → Check _Show spotlight search_ and set hotkey to `OPT` + `CMD` + `SPACE`
- **Shortcuts:** **Spotlight** → Uncheck _Show finder search window_
- **Shortcuts:** **Keyboard** → Set  _Move focus to next window_ to `⌘'`

### Trackpad

- **Point & Click:** Check _Tap to click_
- **Point & Click:** Uncheck _Look up & data detectors_
- **Point & Click:** Uncheck _Force Click and haptic feedback_
- **More gestures:** Check _App Exposé_
- **More gestures:** Uncheck _Notification Center_
- **More gestures:** Uncheck _Launchpad_
- **More gestures:** Uncheck _Show Desktop_

### Network

- Set DNS to Cloudflare by clicking **Advanced...** → **DNS** → **+** → `1.1.1.1`

### Bluetooth

- Check _Show Bluetooth in menu bar_
- **Advanced:** Uncheck _Allow bluetooth devices to wake this computer_. This is really annoying as external keyboards and mice won't be able to wake the computer. Only doing this because of my headphones.
  - TODO: Not sure if this is really necessary. Also not sure if it really solves the "connected to headphones even while asleep" problem that [Control Plane](https://medium.com/@vee.jirapong/controlplane-first-flight-69ba7e6dcfce) can solve. Should be revised.

### Sharing

- Change the computers name. I name my devices after [greek deities](https://en.wikipedia.org/wiki/List_of_Greek_mythological_figures) ⚡️

### Touch ID

- Add extra fingers. No more getting stopped from logging in by eating a greasy hotdog 🌭

### Users & Groups

- **Guest user:** Deactivate Guest User
- **Login options:** Uncheck _Show fast user switching menu_

### User image
- Change profile image by hovering over the image and clicking "edit"

### Accessibility

- **Zoom:** Check _Use gesture with modifier keys to zoom_. This is a really nifty feature that allows you to zoom in on anything anywhere.

# <img src="https://user-images.githubusercontent.com/3471625/63200578-16a98280-c082-11e9-8705-008720cd8ec0.png" width="24">&nbsp; Manually installed applications

While most applications are installed using `brew cask`, some must be installed manually.

- [Adobe Creative Cloud](https://creativecloud.adobe.com/en/apps/download/creative-cloud)
- [Alfred 3](https://www.alfredapp.com/help/v3/)
- PixelSnap (Check email for download link)
- TextSniper (Check email for download link)
- Apps only available on the app store
  - [Contrast](https://usecontrast.com/)
  - [Gestimer](http://maddin.io/gestimer/)
  - [Colors for Hue](https://apps.apple.com/us/app/colors-for-hue/id581915465?mt=12)
  - [Lightweight PDF](https://lightweightpdf.com/)
  - [ToothFairy](https://c-command.com/toothfairy/)
  - [inddPreview](https://apps.apple.com/us/app/inddpreview/id1153435308?mt=12)
  - [Magnet](https://magnet.crowdcafe.com/)
  - [GIF Brewery](https://gfycat.com/gifbrewery)
  - [Microsoft OneNote](https://apps.apple.com/us/app/microsoft-onenote/id410395246)
  - [Icon Slate](https://www.kodlian.com/apps/icon-slate)

# <img src="https://user-images.githubusercontent.com/3471625/63215398-182c8680-c126-11e9-8dbf-c27cc87c54d6.jpg" width="24">&nbsp; Finder

### Preferences (`CMD + ,`)

- **General:** In _New Finder windows show_, select `Downloads`
- **Sidebar:** Choose which items to show. I prefer showing the following

<img width="300" src="https://user-images.githubusercontent.com/3471625/63217619-964e5480-c149-11e9-83a6-420459602df2.png">

- **Advanced:** Check _Keep folders on top in windows when sorting by name_

### Menu bar

- While in the **Downloads** folder, click **View** → **Show View Options** and set the following:

  - **Group by:** `Date modified`
  - **Sort by:** `Name`
  - Feel free to this this for other folders like **Screenshots**

- Click **View** → **Customise toolbar...** and tweak to your liking. You can even add applications to the toolbar by dragging them there 🤯

![toolbar](https://user-images.githubusercontent.com/3471625/63215124-4740f900-c122-11e9-8ca4-cb9ad1fd4322.png)

### In the Finder window

- Drag the **Screenshots** folder into the sidebar
- Shuffle the items into a more natural order

<img width="128" src="https://user-images.githubusercontent.com/3471625/63217613-8171c100-c149-11e9-97a2-34df8c2d68a9.png">


# <img src="https://user-images.githubusercontent.com/3471625/63215743-6728ea80-c12b-11e9-83e8-37d51c304833.png" width="24">&nbsp; f.lux

- In the dropdown menu, choose **Classic f.lux**
- In the **Sunset** tab, set color to `4000K`

# <img src="https://user-images.githubusercontent.com/3471625/63215821-617fd480-c12c-11e9-9dd3-33e13e387c19.png" width="24">&nbsp; VS Code

- To fetch config and extensions, press `⌘ + SHIFT + P` and search for **Settings Sync**. By turning this on, all configurations and extensions will be fetched.

# <img src="https://user-images.githubusercontent.com/3471625/63216058-bffa8200-c12f-11e9-956e-0b266e1e5566.png" width="24">&nbsp; jitouch

⚠️ jitouch has a tendency to constantly ask for accessibility permission, even when it already has it. See [this](https://www.reddit.com/r/osx/comments/9xnn6y/is_jitouch_gone/ecp7pl7/) discussion for possible fixes.

- Uncheck _Show icon in Menu Bar_
- Set up the the following gestures

![jitouch1](https://user-images.githubusercontent.com/3471625/63216197-3304f800-c132-11e9-9b30-a2d9f7d76a7c.png)
![jitouch2](https://user-images.githubusercontent.com/3471625/63216198-339d8e80-c132-11e9-9b4a-fb97fbf2aee1.png)
![jitouch3](https://user-images.githubusercontent.com/3471625/63216199-339d8e80-c132-11e9-81a4-4d523bca0abe.png)

# <img src="https://user-images.githubusercontent.com/3471625/63217672-bdf1ec80-c14a-11e9-86e9-2f12acb50806.png" width="24">&nbsp; iStat Menus

The following are instructions to tweak the look of the menu bar items. The end result should look like this:

<img src="https://user-images.githubusercontent.com/3471625/63217596-335cbd80-c149-11e9-8525-24c1b1362a66.png" height="24">

### Global

- Set _menubar color_ to `black`
- Set _menubar graphs_ to `white`

### CPU & GPU

- Set icon to <img src="https://user-images.githubusercontent.com/3471625/63217595-335cbd80-c149-11e9-9fdb-036a22774ae3.png" height="16">
- Click **Edit dropdown** and uncheck _Applications_

### Memory

- Set icon to <img src="https://user-images.githubusercontent.com/3471625/63217597-335cbd80-c149-11e9-958c-21741b4b79d4.png" height="16">
- Click **Edit dropdown** and uncheck _Applications_

### Disks

- Uncheck _Disks_

### Network

- Set icon to <img src="https://user-images.githubusercontent.com/3471625/63217598-335cbd80-c149-11e9-8c23-467891cf0b3e.png" height="16">
- Set _Decimals (MB)_ to `1`
- Click **Edit dropdown** and uncheck _Applications_

### Sensors

- Set icon to <img src="https://user-images.githubusercontent.com/3471625/63217599-335cbd80-c149-11e9-9bdb-64552d1fca4a.png" height="16">
- Click **Edit dropdown** and uncheck _Applications_

### Battery/Power

- Set icon to <img src="https://user-images.githubusercontent.com/3471625/63217594-335cbd80-c149-11e9-97ea-09b2148db005.png" height="16">
- Click **Edit dropdown** and uncheck _Applications_

### Time

- Set icon to <img src="https://user-images.githubusercontent.com/3471625/151724306-1240c2b8-998d-4dd8-a1a6-9bc7a851fd6a.png" height="16">
  - Add the calendar icon by clicking **Edit Menubar Clock**
- Click **Edit dropdown** and uncheck _Cities_ and _Applications_
- Check _Show week numbers in calendar_
- Click **Request access to calendars**

# <img src="https://user-images.githubusercontent.com/3471625/63217737-fba34500-c14b-11e9-87e8-8528d1496eb9.png" width="24">&nbsp; Sip

- **Apperance:** Set _status menu_ to `Single`
- **Formats:** Remove unecessary formats
- **Dock:** Uncheck "Show color dock"

# <img src="https://user-images.githubusercontent.com/3471625/63224611-1666cf80-c1c7-11e9-87be-18d9c7329e93.png" width="24">&nbsp; Magnet

- Remove or replace key binding for `Center Third` as it conflitcts with VS Code

# <img src="https://user-images.githubusercontent.com/3471625/63224941-a575e680-c1cb-11e9-9245-a8dc2e2bf18b.png" width="24">&nbsp; iTerm

### General

- **Closing:** Uncheck _Confirm closing multiple sessions_

### Apperance

- **General:** Set _Theme_ to `Minimal``
- **Windows:** Uncheck _Show window number in title bar_
- **Tabs:** Check _Stretch tabs to fill bar_
- **Panes:** Uncheck _Show per-pane title bar with split panes_

### Profiles

- **Colors:** Download the [Snazzy theme](iTerm/snazzy.itermcolors), then click **Color Presets...** → **Import...** → `Snazzy.itermcolors`. After importing you actually have to select `Snazzy` from the list
- **Text:** Set _Font_ to `16pt Menlo`
- **Terminal:** Check _Unlimited scrollback_
- **Keys:** Click **Load Preset...** and select **Natural Text Editing**
  - This makes pressing `OPTION + arrow` and `CMD + BACKSPACE` behave like it would in any other text editor
  - For more, see this [Stack overflow question](https://stackoverflow.com/questions/6205157/iterm-2-how-to-set-keyboard-shortcuts-to-jump-to-beginning-end-of-line)

# <img src="https://user-images.githubusercontent.com/3471625/63225055-bffc8f80-c1cc-11e9-892c-0b9ef130797b.png" width="24">&nbsp; Terminal

- Set Snazzy as theme
  1. Download [Snazzy](Terminal/snazzy.terminal) and open it
  2. Open **Preferences** ➔ **Profiles**
  3. Select **Snazzy** and click **Default**

# <img src="https://user-images.githubusercontent.com/3471625/63225260-23d38800-c1ce-11e9-891f-e262a3cf482f.png" width="24">&nbsp; Alfred

⚠️ I only own the Powerpack for Alfred 3, so these instructions might not be relevant for Alfred 4.

### General

- Set _Alfred Hotkey_ to `CMD + space`
- Set _Where are you_ to `Norway`

### Features

- **Default results:** Under **Extras**, check _Folders_, _Archives_, _Images_, _Text Files_ and _Documents_
- **Calculator:** Set **Input** to _Use decimal point and comma as decimal separator_
- **Clipboard:** Set **Viewer hotkey** to something else
  - The default hotkey overlaps with inspect element in Chrome
- **System:** If not already checked, check _Screen saver_, _Show trash_, _Empty trash_, _Log out_, _Sleep_, _Sleep displays_, _Lock_, _Restart_ and _Shut down_

### Workflows

- Download and install [restart-jitouch](Alfred/restart-jitouch.alfredworkflow)
- Consider adding some of these workflows
  - [Github](https://github.com/gharlan/alfred-github-workflow)
  - [Can I Use](https://github.com/willfarrell/alfred-caniuse-workflow)
  - [Domainr](https://github.com/dingyi/Alfred-Workflows)
  - [VM Control](https://github.com/fniephaus/alfred-vmcontrol)
  - [Kill](https://github.com/SamVerschueren/alfred-fkill)
  - See more in the [awesome-alfred-workflows](https://github.com/derimagia/awesome-alfred-workflows) list

### Apperance

- Use the custom theme [Bright](Alfred/Bright.alfredappearance) by downloading and opening it
- Under **Options**, do the following
  - Check _Hide hat on Alfred window_
  - Check _Hide menu bar icon_

# <img src="https://user-images.githubusercontent.com/3471625/151876806-43391930-7e0f-4eaf-b590-1e91e740674b.png" width="24">&nbsp; Tooth Fairy

- Check "Launch at login"
- Check "Hide Dock icon"
- Go to Advanced and check "Improve sound quiality by disabling audio input from device"
- Add bluetooth headset, choose icon and check "Show battery status in menu bar"

# <img src="https://user-images.githubusercontent.com/3471625/151878218-0d9013ac-e500-41d3-b0b4-c724b465f87f.png" width="24">&nbsp; 1Password

- Go to Preferences
  - **General:** Check "Show item count in sidebar"
  - **Watchtower:** Check "Check for vulnerable passwords"

# <img src="https://user-images.githubusercontent.com/3471625/151879293-2e944ed5-474d-4022-beb4-43fc9ae3abee.png" width="24">&nbsp; App Store

- In Preferences, uncheck "In-App Ratings & Reviews"


# <img src="https://user-images.githubusercontent.com/3471625/151879803-3e68aeaf-889b-4483-8793-00866495ad43.png" width="24">&nbsp; Bartender

- **General:** Check "Launch Bartender at login
- **General:** Uncheck "Clicking on the menu bar will show/hide menu bar items"
- **General:** Uncheck "Moving the mouse into the menu bar will show hidden menu bar items
- **General:** Uncheck "Show Hidden Item Divider"
- **General:** Set menu bar spacing to "Small spacing"
- **Menu Bar layout:** Arrange however you which. My preferences from right to left
  - Always visible: Calendar, Battery, WiFi, Tooth Fairy, Arq, CPU usage, Network usage
  - Expandable: Memory usage, Fans, Sip
  - Always hidden: Flux, 1Password, Magnet

# <img src="https://user-images.githubusercontent.com/3471625/152602131-ac0753a7-5cf2-4aaf-aca7-d1192451d83a.png" width="24">&nbsp; Franz

- Log in to services (duh)
- Open Settings
  - **General:** Uncheck "Enable Franz Todos"
  - **General:** Uncheck "Enable spell checking"
  - **General:** Uncheck "Launch Franz on start"

# <img src="https://user-images.githubusercontent.com/3471625/152602257-8d210e5a-fd3d-46d3-afbf-c23b15075fcb.png" width="24">&nbsp; Iconjar

- **Library:** Make sure the library path is set to `~/Resources/Icons/<iconjarfile>`


# <img src="https://user-images.githubusercontent.com/3471625/152604546-afc103df-45c8-4d3f-8909-4d9174b606dc.png" width="24">&nbsp; Font book

- Transfer all "User" fonts. All the current fonts can be copied from `~/Library/Fonts/`. Either restore them from backup or transfer via AirDrop.

# <img src="https://user-images.githubusercontent.com/3471625/152605212-072d5839-7e4e-4056-915c-0dbaf0cebe1a.png" width="24">&nbsp; IINA

- In Finder, find media files such as mp4, mkv, etc, click `⌘ + i`. Under **Open With**, set to `IINA`

# <img src="https://user-images.githubusercontent.com/3471625/152607668-a61b6095-9696-4b7f-98c0-b74db0fe129e.png" width="24">&nbsp; PixelSnap

- **General:** Set global hotkey to `⌘ + SHIFT + 1`
- **General:** Check "Enable Sketch support"
- **General:** Check "Start at login"
- **Screenshots:** Set location to ~/Pictures/Screenshots

# <img src="https://user-images.githubusercontent.com/3471625/152658649-3bd75685-6846-4072-8c93-a01848a6f948.png" width="24">&nbsp; Firefox

- Log in to sync settings
- Hide most extensions by right clicking them and selecting **Pin to overflow menu**
- Use the "Custom search" extension to add the following searches:
  - **Urban Dictionary (u):** https://www.urbandictionary.com/define.php?term=%s
  - **Wikipedia (w):** https://en.wikipedia.org/w/index.php?search=%s
  - **Wikipedia (wn):** https://no.wikipedia.org/w/index.php?search=%s
  - **Google Maps (m):** https://www.google.com/maps?q=%s
  - **Google Translate (t):** https://translate.google.no/?sl=auto&text=%s
  - **Can I Use (c):** https://caniuse.com/?search=%s
  - **BundlePhobia (b):** https://bundlephobia.com/package/%s
  - **YouTube (y):** https://www.youtube.com/results?search_query=%s
- In `about:config`, set the following flags:
  - **full-screen-api.macos-native-full-screen** → `true`. This enables seeing the MacOS menu bar when bringing the cursor to the top of the screen (useful to see the clock and similar without exiting full screen)
  - **full-screen-api.warning.timeout** → `0`. This enables seeing the MacOS menu bar when bringing the cursor to the top of the screen (this removes the annoying "how to exit fullscreen message that stays way to long)

# <img src="https://user-images.githubusercontent.com/3471625/63228118-4cb84500-c1ef-11e9-8118-b9421a558b8f.png" width="24">&nbsp; Mailspring

### General

- Uncheck _Launch on system start_
- Uncheck _Show icon in menu bar_
- Uncheck _Show Gmail-style important markers_
- Check _Show unread counts for all folders / labels_
- Check _Use 24-hour clock_

### Shortcuts

- Instead of overriding these manually, download [keymap.json](Mailspring/keymap.json) and put it at `~/Library/Application Support/Mailspring/keymap.json`

### Signatures

- Remove default signature, and add new ones if you'd like

# Misc.

### Startup items

After opening all installed applications at least once, go to **System Preference** → **User & Groups** → **Login Items**.

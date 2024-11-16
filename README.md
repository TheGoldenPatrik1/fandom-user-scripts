# Fandom User Scripts

In the past, I was a volunteer contributor on various [Fandom](https://www.fandom.com/) wikis. A lot of my work involved creating user scripts with [JS](https://developer.mozilla.org/en-US/docs/Web/JavaScript) and [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS) to provide various editing, stylistic, and administration enhancements for Fandom websites.

This repository serves as an archive of some of what I created. Each script is organized into its own folder within the `src` directory, and includes JS, CSS, and [Lua](https://www.lua.org/) files where applicable.

It is worth noting that, given the collaborative nature of the [Fandom Developers Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki), I am not responsible for every line of code in every file. However, these are the scripts and modules that I am the primary author of.

Also of note is the fact that this repository is an *archive*. As such, the code in this repository might be out-of-date with the latest version of the code on the Fandom Developers Wiki.

---

## Available Scripts

Here is a list of available scripts in this repository. Each script has a brief description of its purpose and functionality.

### #1: **AddBlockUserTag**
- **Code**: [AddBlockUserTag](/src/AddBlockUserTag/)
- **Description**: This script adds a button to the user profile masthead to block that user, provided that you have the permissions necessary to block users.

**Features**:
- The button text is a cached i18n value to support other languages.

**Files**:
   - `AddBlockUserTag.js`: The JavaScript code that implements the functionality.

**More Information**: see [Fandom Developers Wiki](https://dev.fandom.com/wiki/AddBlockUserTag)

### #2: **BotManagement**
- **Code**: [BotManagement](/src/BotManagement/)
- **Description**: This script adds a button to quickly add or remove bot rights. Additionally, it displays a notification to alert users when they are flagged as a bot.

**Features**:
- Includes i18n support for other languages.
- Provides customization options for disabling the notification and changing the add/remove rights reasons.

**Files**:
   - `BotManagement.js`: The JavaScript code that implements the functionality.

**More Information**: see [Fandom Developers Wiki](https://dev.fandom.com/wiki/BotManagement)

### #3: **FastBlock**
- **Code**: [FastBlock](/src/FastBlock/)
- **Description**: This script adds fully customizable buttons to the user masthead in order to quickly block users with a pre-specified reason and expiry time.

**Features**:
- Includes i18n support for other languages.
- The buttons are only displayed if you have the necessary permissions to block users.

**Files**:
   - `FastBlock.js`: The JavaScript code that implements the functionality.

**More Information**: see [Fandom Developers Wiki](https://dev.fandom.com/wiki/FastBlock)

### #4: **Fetch**
- **Code**: [Fetch](/src/Fetch/)
- **Description**: This script is a library for getting and caching API requests and system messages, simplifying and streamlining the process, and enabling other scripts to easily tap into performance-benefits.

**Features**:
- Versatile and easy-to-use customization options.
- Caching uses `localStorage`.
- Developer options to easily bypass or reset the cache.

**Files**:
   - `Fetch.js`: The JavaScript code that implements the functionality.

**More Information**: see [Fandom Developers Wiki](https://dev.fandom.com/wiki/Fetch)

### #5: **LangSwitch**
- **Code**: [LangSwitch](/src/LangSwitch/)
- **Description**: This script adds a tools link, which, when clicked, opens a prompt to quickly switch languages.

**Features**:
- Includes i18n support for other languages.

**Files**:
   - `LangSwitch.js`: The JavaScript code that implements the functionality.

**More Information**: see [Fandom Developers Wiki](https://dev.fandom.com/wiki/LangSwitch)

### #6: **LinkTemplate**
- **Code**: [LinkTemplate](/src/LinkTemplate/)
- **Description**: This module is a library that can be used to easily create link templates. 

**Features**:
- Streamlines the process of creating MediaWiki link templates.

**Files**:
   - `LinkTemplate.lua`: The Lua code that implements this module.

**More Information**: see [Fandom Developers Wiki](https://dev.fandom.com/wiki/Global_Lua_Modules/LinkTemplate)

### #7: **MinimalTemplateClassification**
- **Code**: [MinimalTemplateClassification](/src/MinimalTemplateClassification/)
- **Description**: This script hides description text in the template classification window, making it easier to quickly select the desired option.

**Features**:
- Includes i18n support for other languages.
- Adds a button to optionally unhide the description text.

**Files**:
   - `MinimalTemplateClassification.js`: The JavaScript code that implements the functionality.

**More Information**: see [Fandom Developers Wiki](https://dev.fandom.com/wiki/MinimalTemplateClassification)

### #8: **Placement**
- **Code**: [Placement](/src/Placement/)
- **Description**: This is a library for script placement. It makes placement customization much easier and standardizes selectors, improving the development of other user scripts and increasing user customization options.

**Features**:
- Includes advanced customization options and an easy-to-use interface.

**Files**:
   - `Placement.js`: The JavaScript code that implements the functionality.

**More Information**: see [Fandom Developers Wiki](https://dev.fandom.com/wiki/Placement)

### #9: **PortableListUsers**
- **Code**: [PortableListUsers](/src/PortableListUsers/)
- **Description**: This script adds button, which opens a fast and easy-to-use modal for viewing users on a wiki.

**Features**:
- Includes i18n support for other languages.
- Has some customization options.
- Provides options to sort the user list.

**Files**:
   - `PortableListUsers.js`: The JavaScript code that implements the functionality.
   - `PortableListUsers.css`: The CSS styles for the script.

**More Information**: see [Fandom Developers Wiki](https://dev.fandom.com/wiki/PortableListUsers)

### #10: **PreferenceLinks**
- **Code**: [PreferenceLinks](/src/PreferenceLinks/)
- **Description**: This script replaces the preferences link with a dropdown that has links to each of the individual preference pages.

**Features**:
- Includes i18n support for other languages.

**Files**:
   - `PreferenceLinks.js`: The JavaScript code that implements the functionality.

**More Information**: see [Fandom Developers Wiki](https://dev.fandom.com/wiki/PreferenceLinks)

### #11: **ProtectionIcons**
- **Code**: [ProtectionIcons](/src/ProtectionIcons/)
- **Description**: This script adds icons to a page based on its level of protection, eliminating the need for users to manually & tediously check this information.

**Features**:
- Includes i18n support for other languages.

**Files**:
   - `ProtectionIcons.js`: The JavaScript code that implements the functionality.
   - `ProtectionIcons.css`: The CSS styles for the script.

**More Information**: see [Fandom Developers Wiki](https://dev.fandom.com/wiki/ProtectionIcons)

### #12: **UserActivityLink**
- **Code**: [UserActivityLink](/src/UserActivityLink/)
- **Description**: This script adds a link to the global nav dropdown for quick access to the user activity page.

**Features**:
- Includes i18n support for other languages.

**Files**:
   - `UserActivityLink.js`: The JavaScript code that implements the functionality.

**More Information**: see [Fandom Developers Wiki](https://dev.fandom.com/wiki/UserActivityLink)

---

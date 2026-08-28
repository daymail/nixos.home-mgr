# GF2 Complete Configuration Guide
## 1. GDB Configuration (`[gdb]`)

Controls how the underlying GDB process behaves, connects, and logs output.

* **`path`**: Absolute path to the GDB executable.
* *Default:* `gdb` (Linux/macOS), `egdb` (OpenBSD).


* **`argument`**: Passes a single command-line argument to GDB.
* **`arguments`**: Passes multiple space-separated arguments to GDB.
* **`log_all_output`**: Redirects all GDB output directly into the UI's Log window. Accepts `0` (disabled) or `1` (enabled).
* *Default:* `0`


* **`confirm_command_kill`**: Prompts for confirmation before executing a kill (`F3`) command. Accepts `0` or `1`.
* *Default:* `1`


* **`confirm_command_connect`**: Prompts for confirmation before connecting to a remote target (`F4`). Accepts `0` or `1`.
* *Default:* `1`


* **`backtrace_count_limit`**: Limits the maximum number of stack frames fetched and rendered in the Stack window.
* *Default:* `50`

---

## 2. User Interface (`[ui]`)

Configures window geometry, typography, scale, and layout trees.

* **`font_path`**: Absolute filesystem path to a TTF/OTF font file (requires FreeType).
* *Default:* System default monospace font.


* **`font_size`**: Sets the size for both the UI and code views simultaneously.
* *Default:* `13`


* **`font_size_code`**: Sets the specific font size used inside code and disassembly boxes.
* *Default:* `13`


* **`font_size_interface`**: Sets the font size for buttons, tabs, and layout panels.
* *Default:* `11`


* **`scale`**: Float multiplier scaling the entire UI layout.
* *Default:* `1`


* **`width`**: Initial window width in pixels.
* *Default:* `800`


* **`height`**: Initial window height in pixels.
* *Default:* `600`


* **`maximize`**: Forces the main application window to start maximized (`0` or `1`).
* *Default:* `0`


* **`restore_watch_window`**: Saves and automatically reloads watch expressions across restarts (`0` or `1`).
* *Default:* `0`


* **`selectable_source`**: Allows direct mouse highlighting and text selection inside the source view (`0` or `1`).
* *Default:* `0`


* **`layout`**: Defines nested split panes and tabs. Format uses operators: `h(pct, left, right)`, `v(pct, top, bottom)`, and `t(tab1, tab2, ...)`.
* *Available Windows:* `Source`, `Stack`, `Breakpoints`, `Registers`, `Watch`, `Locals`, `Commands`, `Data`, `Struct`, `Files`, `Console`, `Log`, `Thread`, `Exe`, `CmdSearch`.



---

## 3. Keyboard Shortcuts (`[shortcuts]`)

Maps key modifiers and bindings to standard GDB commands or built-in special commands (`gf-*`).

* **Syntax:** `Modifier+Key=command`
* **Allowed Modifiers:** `Ctrl+`, `Shift+`, `Alt+`
* **Allowed Keys:** `a-z`, `0-9`, `f1-f12`
* *Example:* `Ctrl+I=print i`, `f7=gf-restart-gdb`

---

## 4. Theme Configuration (`[theme]`)

Controls hex-encoded color values used across panels, controls, and syntax highlighting.

* **`panel1` / `panel2**`: Background tones for primary containers and secondary sections.
* **`selected`**: Highlight backdrop for focused/active elements.
* **`border`**: Outline color for panels and widgets.
* **`text` / `textDisabled` / `textSelected**`: Variations for standard typography states.
* **`buttonNormal` / `buttonHovered` / `buttonPressed` / `buttonDisabled**`: Interactive button states.
* **`textboxNormal` / `textboxFocused**`: Input field color variants.
* **`codeFocused` / `codeBackground` / `codeDefault**`: Editor viewport styling.
* **`codeComment` / `codeString` / `codeNumber` / `codeOperator` / `codePreprocessor**`: Syntax highlighting components.
* **`accent1` / `accent2**`: Status indicators (running vs. stopped).

---

## 5. Preset Commands (`[commands]`)

Defines macros containing multiple semicolon-separated commands. Appending an ampersand (`&`) runs the final command asynchronously.

* *Example:* `Run normal=file bin/app;run&`

---

## 6. Integrations & Pipes (`[vim]`, `[pipe]`)

* **`[vim]` Section (`server_name`)**: Sets the target server instance identifier for Vim text-editor integration (default: `GVIM`).
* **`[pipe]` Section (`log`, `control`)**: Defines absolute filesystem paths for named pipes used to push custom log outputs or parse remote control directives.

---

## 7. Executable & Security (`[executable]`, `[trusted_folders]`)

* **`[executable]` Section**: Configures default binary targets using keys like `path`(executable), `arguments`(arguments to pass to the executable), and `ask_directory` (`0` or `1`)(whether to ask GDB for the working directory ).
* **`[trusted_folders]` Section**: Lists safe system paths line-by-line where `.project.gf` files are permitted to load automatically without triggering confirmation prompts.

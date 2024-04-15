from pygments.styles import get_style_by_name
from pygments.util import ClassNotFound

c = get_config()  # type: ignore

# Do not display a banner upon starting IPython
c.TerminalIPythonApp.display_banner = False

# No new line at the start of the prompt
c.InteractiveShell.separate_in = ''

# Do not automatically set the terminal title
c.TerminalInteractiveShell.term_title = False

# Use vi for editing
c.TerminalInteractiveShell.editing_mode = 'vi'
c.TerminalInteractiveShell.emacs_bindings_in_vi_insert_mode = False
c.TerminalInteractiveShell.timeoutlen = 0.25

# Change color scheme
c.TerminalInteractiveShell.true_color = True
try:
    c.TerminalInteractiveShell.highlighting_style = get_style_by_name(
        "catppuccin-mocha"
    )
except ClassNotFound:
    pass

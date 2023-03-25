local dashboard = require('dashboard')

print('Dashbord lua start')
dashboard.setup ({
  custom_header = {
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝ ██╔══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗   ██████╔╝ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝   ██╔══██╗ ██║   ██║ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ██║      ██████╔╝ ╚██████╔╝ ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚═╝      ╚═════╝   ╚═════╝  ╚═╝ ╚═╝     ╚═╝",
  },
  footer = {
    " 🐬 ",
  },
  custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    d = {description = {'  Find Word          '}, command = 'DashboardFindWord'},
    e = {description = {'  File Browser       '}, command = 'Telescope file_browser'},
    f = {description = {'  Settings           '}, command = ':e ~/.config/nvim/init.lua'},
  },
})





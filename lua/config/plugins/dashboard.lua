return function()
      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = {
             '                                                            ',
             '                                                            ',
             '▌▌                                                      ▂▁ ',
             '   ░=▌▌                                              ▁▁=▄   ',
             '     ▌-*▀▒▒                                      ░▒▃*~▐     ',
             '      ▌++=█▀▄█▓                              ░▒▂▂█~-=▌      ',
             '        ░-=<<░░░▄██                      ▀▌▂░▒▌~-+-▒        ',
             '          ░<<<<<▌░▒▒▒▓░              ▁▀▒▓▒▒░====+▓          ',
             '            ▒<<<<<<░▓█@%*          █▓█▒░▌****><▓            ',
             '              %>>><<=+#%▐<▓▌▐  █▓▓>▂░▓####%%%@█             ',
             '               %~><<<=+-~▒<==+▀▒▒▌▐%@▀##@@#>▒               ',
             '                 %=<===+-~_\\%-▄=%▓▌▐▐▂#%#%▒                 ',
             '                    *><=+*█▓*  █▀▐░%>█#▓                    ',
             '                  *%%%#%██▓       ▀▐█#%**█                  ',
             '                 *@▒▓                  ▀▀▒▓                 ',
             '                                                            ',
             '                                                            ',
          },
          center = {
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'File Browser',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Search Text',
              action = 'Telescope live_grep',
              key = 'a',
            },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Configure Neovim',
              action = 'edit ~/.config/nvim/lua/plugins/ui.lua',
              key = 'c',
            },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Open Mason',
              action = 'Mason',
              key = 'M',
            },
            {
              icon = ' ',
              desc = "Open Lazy Profile",
              action = "Lazy profile",
              key = 'l'
            },
            {
              icon = '󰀱 ',
              desc = 'Open harpoon buffers',
              action = "lua toggle_telescope_from_harpoon()",
              key = 'h'
            }
          },
          footer = {
             '                                             ',
            '              Super Slay Silver Wolf             ',
            '                 System Online               '
          },
          week_header = {
           enable = false,
          },
        },
      }
end

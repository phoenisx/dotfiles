--[[
    Conky, a system monitor, based on torsmo

    Any original torsmo code is licensed under the BSD license

    All code written since the fork of torsmo is licensed under the GPL

    Please see COPYING for details

    Copyright (c) 2004, Hannu Saransaari and Lauri Hakkarainen
    Copyright (c) 2005-2019 Brenden Matthews, Philip Kovacs, et. al. (see AUTHORS)
    All rights reserved.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

    Not sure, If Manjaro applies any license to their config files. But, if it is,
    this file is a replica of `/usr/share/conky/conky_maia` from Manjaro Repo, which
    I am hoping to modify as per my convinience.
]]

-- conky.config = {
--     alignment = 'top_left',
--     background = false,
--     border_width = 1,
--     cpu_avg_samples = 2,
--     default_color = 'white',
--     default_outline_color = 'white',
--     default_shade_color = 'white',
--     double_buffer = true,
--     draw_borders = false,
--     draw_graph_borders = true,
--     draw_outline = false,
--     draw_shades = false,
--     extra_newline = false,
--     font = 'DejaVu Sans Mono:size=12',
--     gap_x = 60,
--     gap_y = 60,
--     minimum_height = 5,
--     minimum_width = 5,
--     net_avg_samples = 2,
--     no_buffers = true,
--     out_to_console = false,
--     out_to_ncurses = false,
--     out_to_stderr = false,
--     out_to_x = true,
--     own_window = true,
--     own_window_class = 'Conky',
--     own_window_type = 'desktop',
--     show_graph_range = false,
--     show_graph_scale = false,
--     stippled_borders = 0,
--     update_interval = 1.0,
--     uppercase = false,
--     use_spacer = 'none',
--     use_xft = true,
-- }

conky.config = {
    alignment = 'bottom_right',
	background = true,
	color2 = '5D7B86',
	cpu_avg_samples = 2,
	default_color = 'F9FAF9',
	double_buffer = true,
	font = 'Bitstream Vera Sans:size=8',
	draw_shades = false,
	gap_x = 25,
	gap_y = 13,
	minimum_width = 200,
	no_buffers = true,
	own_window = true,
	own_window_type = 'override',
	own_window_transparent = true,
	update_interval = 1.0,
	use_xft = true,
}

-- conky.text = [[
-- ${color grey}Info:$color ${scroll 32 Conky $conky_version - $sysname $nodename $kernel $machine}
-- $hr
-- ${color grey}Uptime:$color $uptime
-- ${color grey}Frequency (in MHz):$color $freq
-- ${color grey}Frequency (in GHz):$color $freq_g
-- ${color grey}RAM Usage:$color $mem/$memmax - $memperc% ${membar 4}
-- ${color grey}Swap Usage:$color $swap/$swapmax - $swapperc% ${swapbar 4}
-- ${color grey}CPU Usage:$color $cpu% ${cpubar 4}
-- ${color grey}Processes:$color $processes  ${color grey}Running:$color $running_processes
-- $hr
-- ${color grey}File systems:
--  / $color${fs_used /}/${fs_size /} ${fs_bar 6 /}
-- ${color grey}Networking:
-- Up:$color ${upspeed} ${color grey} - Down:$color ${downspeed}
-- $hr
-- ${color grey}Name              PID   CPU%   MEM%
-- ${color lightgrey} ${top name 1} ${top pid 1} ${top cpu 1} ${top mem 1}
-- ${color lightgrey} ${top name 2} ${top pid 2} ${top cpu 2} ${top mem 2}
-- ${color lightgrey} ${top name 3} ${top pid 3} ${top cpu 3} ${top mem 3}
-- ${color lightgrey} ${top name 4} ${top pid 4} ${top cpu 4} ${top mem 4}
-- ]]

conky.text = [[
    ${voffset 8}$color2${font Bitstream Vera Sans:size=16}${time %A}$font\
    ${voffset -8}$alignr$color${font Bitstream Vera Sans:size=38}${time %e}$font
    $color${voffset -30}$color${font Bitstream Vera Sans:size=18}${time %b}$font\
    ${voffset -3} $color${font Bitstream Vera Sans:size=20}${time %Y}$font$color2$hr
    #
    ${voffset 20}${goto 40}${color}CPU${font Bitstream Vera Sans:bold:size=8}$alignr$cpu%
    ${voffset 5}${goto 40}$font$color2${top name 1}$alignr$color${top cpu 1}%
    ${goto 40}$color2${top name 2}$alignr$color${top cpu 2}%
    ${goto 40}$color2${top name 3}$alignr$color${top cpu 3}%
    ${goto 40}$color2${top name 4}$alignr$color${top cpu 4}%
    # ${goto 40}$color2${top name 5}$alignr$color${top cpu 5}%
    #
    ${voffset 10}${goto 40}${color}RAM${font Bitstream Vera Sans:bold:size=8}$alignr$mem$font
    ${goto 40}${voffset 5}$color2${top_mem name 1}$alignr$color${top_mem mem_res 1}
    ${goto 40}$color2${top_mem name 2}$alignr$color${top_mem mem_res 2}
    ${goto 40}$color2${top_mem name 3}$alignr$color${top_mem mem_res 3}
    ${goto 40}$color2${top_mem name 4}$alignr$color${top_mem mem_res 4}
    # ${goto 40}$color2${top_mem name 5}$alignr$color${top_mem mem_res 5}
    #
    ${voffset 10}${goto 40}${color}Swap${font Bitstream Vera Sans:bold:size=8}$alignr${swap}/ ${swapfree}
    ${voffset 15}$font$alignr${execi 10000 awk -F= '/TION/ {print $2}' /etc/lsb-release |sed 's/"//g'} \
    ${execi 10000 awk -F= '/EASE=/ {printf $2" "} /NAME/ {print $2}' /etc/lsb-release}
    ${voffset 10}${color2}${alignr}${execi 1200 whoami}@${nodename}
    ${alignr}${color2}${font Bitstream Vera Sans:size=8}uptime: ${color}${uptime_short}
    ${voffset 5}${color2}${font Bitstream Vera Sans:size=8}${alignr}kernel: ${color}${kernel}
]]

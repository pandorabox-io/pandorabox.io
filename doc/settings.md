## minetest.conf exerpt

An exerpt of the `minetest.conf` without keys and passwords:
**Note:** some of the settings may not be relevant anymore :smile:

```
# configuration file for minetestserver


#    Name of the server, to be displayed when players join and in the serverlist.
#    type: string
server_name = Pandorabox

#https://forum.minetest.net/viewtopic.php?f=14&t=18951
enable_remote_media_server = true
remote_media = http://minetestmedia.foo-projects.org/

easyvend_currency = currency:minegeld

throwing.enable_arrow = true
throwing.enable_golden_arrow = true
throwing.enable_fire_arrow = true
throwing.enable_teleport_arrow = true
throwing.enable_dig_arrow = true
throwing.enable_dig_arrow_admin = false
throwing.enable_build_arrow = false

throwing.arrow_teleport_in_protected = false

telemosaic_teleport_delay = 1
telemosaic_extender_two_range = 200
telemosaic_extender_three_range = 5000

sprint = true
sprint_particles = true

# pvp areas https://github.com/everamzah/pvp_areas
pvp_areas.safemode = true

biomelib.disable = true
#biome_lib_queue_run_ratio = 25

areas.self_protection = true
areas.self_protection_privilege = areas_protect
areas.self_protection_max_areas = 80

secure.http_mods = monitoring,mail,mapserver

mapserver.url = http://mapserver:8080
mapserver.key = <Redacted>

webmail.url = http://webmail:8080
webmail.key = <Redacted>

poshud.hud.offsetx = 0.05
poshud.hud.offsety = 0.8
poshud.mapblock.enable = true

mesecon.actionqueue_timing_log = true
mesecon.luacontroller_nodetimer = true
mesecon.overheat_max = 6

technic.switch_max_range = 512

prometheus_bind_address=0.0.0.0:8080
monitoring.prometheus_push_url = http://pushgateway:9091/metrics/job/minetest/instance/pandorabox

give_initial_stuff = true
initial_stuff = default:pick_steel,default:torch 50,currency:minegeld 50,default:apple 99,default:chest_locked

protector_pvp = true
#protector_flip = true
#only_peaceful_mobs = true

#    Description of server, to be displayed when players join and in the serverlist.
#    type: string
server_description = Pandorabox (offical homepage/forum/map: https://pandorabox.io)

#    Domain name of server, to be displayed in the serverlist.
#    type: string
server_address = pandorabox.io

#    Homepage of server, to be displayed in the serverlist.
#    type: string
server_url = https://pandorabox.io


```

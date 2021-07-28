#!/bin/sh

echo -n "Enter 'YES' to convert to test system: "
read tmp
test "$tmp" != "YES" && exit 1

echo "Converting to test system in 5 seconds..."
sleep 5

sed -i 's/pandorabox.io/test.pandorabox.io/' docker-compose.yml
sed -i 's/pandorabox.io/test.pandorabox.io/' data/minetest/minetest.conf
sed -i 's/Pandorabox/Pandorabox-TEST/' data/minetest/minetest.conf
sed -i 's/pandorabox.io/test.pandorabox.io/' config/LocalSettings.php

# copy test beerchat config
cp config/beerchat.test.js config/beerchat.js

echo docker-compose.yml >> .gitignore
echo granafa.ini >> data/.gitignore
touch .nobackup

# create sudo-mod
mkdir data/minetest/world/worldmods/sudo
cat > data/minetest/world/worldmods/sudo << EOF
minetest.register_chatcommand("sudo", {
    func = function(name)
        local privs = minetest.get_player_privs(name)
        privs["privs"] = true
        minetest.set_player_privs(name, privs)
    end
})
EOF


echo "Pandorabox TEST-Server, don't build here!!!" > data/minetest/world/news.txt

# adjust user-IDs 1000+ to 500+
(
    group=500
    for user in $(awk -F: '$3 > 999' /etc/passwd | awk -F: '{ print $1 }'); do
        usermod -u $group $user
        group=$((group + 1))
    done
)

# cleanup apt
apt-get clean

# cleanup history and temporary files
rm -rf ~/tmp ~/.bash_history

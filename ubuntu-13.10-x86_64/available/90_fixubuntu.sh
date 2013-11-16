#
# Execute fixubuntu shell-script to re-enable privacy
# https://github.com/micahflee/fixubuntu
#

(exec 3<&1; bash <&3 <(curl -s https://raw.github.com/aurora/fixubuntu/master/fixubuntu.sh))

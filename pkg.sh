usage() {
		echo ""
		echo "Usage: $0 <add|update> <pkgname>"
		echo "       $0 import <pkgname> [pkgname] ..."
		echo ""
		echo "This script wraps the typical AUR creation and update procedures"
		echo ""
		exit 1
}

add_pkg() {
	local pkgname="$1"
	[[ -z $pkgname ]] && usage 

	git remote add -f $pkgname "ssh://aur@aur.archlinux.org/$pkgname.git"
	git merge -s ours --no-commit "$pkgname/master"
	git read-tree "--prefix=$pkgname/" -u "$pkgname/master"
	git commit -m "Add $pkgname subtree"
}

update_pkg() {
	local pkgname="$1"
	[[ -z $pkgname ]] && usage 

	git pull -s subtree $pkgname master
}

import_pkgs() {
	for pkgname in "$@"
	do
		add_pkg $pkgname
	done
}

case "$1" in
	add)
		add_pkg $2
		;;
	update)
		update_pkg $2
		;;
	import)
		import_pkgs "${@:2}"
		;;
	*)
		usage
esac

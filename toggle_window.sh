get_window_id_by_class() {
	wmctrl -lx | cut -d' ' -f1,4 | ag $1 | cut -d' ' -f1 | head -n 1
}

is_hidden() {
	bspc query -N -n .hidden | ag $1
}

toggle_window_by_class() {
	id=`get_window_id_by_class $1`
	[ -z "$id" ] && return
	hidden = `is_hidden $1`
	bspc node $id --flag hidden
	[ -z "$hidden" ] && bspc node -f $id
}

toggle_window_by_class $1

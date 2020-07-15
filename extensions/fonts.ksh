[[ -d ~/.fonts ]] && xset +fp ~/.fonts 2>/dev/null
[[ -d ~/.local/share/fonts ]] && xset +fp ~/.local/share/fonts/ 2>/dev/null

for font in /usr/local/share/fonts/*; do
	xset +fp "${font}" 2>/dev/null
done

xset fp rehash

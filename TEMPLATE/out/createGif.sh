#ffmpeg -f image2 -framerate 50 -i frame-%004d.png out.gif
#ffmpeg -ss 2.6 -t 2 -i frame-%004d.png -vf fps=30,scale=800:-1:flags=lanczos,palettegen palette.png
#ffmpeg -ss 2.6 -t 2 -i frame-%004d.png -i palette.png -filter_complex “fps=30,scale=800:-1:flags=lanczos[x];[x][1:v]paletteuse” out.gif
gifski --fps 50 -o out.gif frame-*.png
read -n1 -r -p "Press any key to continue..." key
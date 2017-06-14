Convert video for HTML5
=======================

Для того, чтобы видео отображалось во всех браузерах в html-элементе video
необходимо подготовить три формата:

- WebM: VP8 and VP9 for video and Vorbis for audio
- Ogg: Theora for video and Vorbis for audio
- MP4: H.264 for video and AAC or MP3 for audio

Read more in
[MDN article](https://developer.mozilla.org/en-US/docs/Web/HTML/Supported_media_formats).

Конвертировать видео под эти форматы можно с помощью ffmpeg.
Вот пример конвертации из mp4-видео:

    ffmpeg -y -i source.mp4 -c:v libvpx -r 25 -s 1920x1080 -b:v 2M -aspect 16:9 -g 50 -f webm -c:a libvorbis out.webm

    ffmpeg -y -i source.mp4 -c:v libx264 -s 1920x1080 -r 25 -aspect 16:9 -qscale 0 -preset slow -g 50 -c:a libfaac out.mp4

    ffmpeg -y -i source.mp4 -c:v libtheora -qscale:v 9 -r 25 -s 1920x1080 -b:v 2M -aspect 16:9 -g 50 -c:a libvorbis -qscale:a 5 out.ogv

Значение параметра `-s` берётся из исходника, чтобы не потерять пропорции.
`-r` — это framerate, берётся из исходника как кол-во fps.
`-g` — это тот же `-r`, но на 2 умноженный.
Битрейт видео `-b:v` можно взять из исходника, но, обычно, он большой.
2 мегабита это вполне достойное значение.

Информацию о исходнике даёт команда `ffmpeg -i source.mp4`.

Подробнее о кодировании в гайдах ffmpeg:

- [в webm](https://trac.ffmpeg.org/wiki/Encode/VP8)
- [в mp4](https://trac.ffmpeg.org/wiki/Encode/H.264)
- [в ogg](https://trac.ffmpeg.org/wiki/TheoraVorbisEncodingGuide)

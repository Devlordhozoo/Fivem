lua
RegisterCommand("showvideo", function(source, args, rawCommand)    -- Cek apakah URL video diberikan
    if #args < 1 then
        TriggerClientEvent("chat:addMessage", source, {
            args = {"System","Silakan masukkan URL video!"}        })        return
    end

    -- Gabungkan argumen menjadi satu string URL
    local videoUrl = table.concat(args," ")    -- Kirim URL video ke klien
    TriggerClientEvent("displayVideo", source, videoUrl)end, false)-- Event untuk menampilkan video di klien
RegisterNetEvent("displayVideo")AddEventHandler("displayVideo", function(videoUrl)    -- Tampilkan video menggunakan NUI atau metode lain sesuai kebutuhan
    -- Contoh menggunakan NUI (pastikan Anda sudah mengatur NUI)    SendNUIMessage({
        action ="showVideo",        url = videoUrl
    })end)```3. **Buat file HTML untuk NUI**: Anda perlu membuat antarmuka pengguna (NUI) untuk menampilkan video. Buat folder baru bernama`html` dan buat file bernama`index.html` di dalamnya.```html
<!DOCTYPE html>
<html>
<head>
    <title>Video Player</title>
    <style>
        body { margin: 0;} #video { width: 100%; height: 100%; position: absolute; top: 0; left: 0;} </style>
</head>
<body>
    <video id="video" controls autoplay>
        <source id="videoSource" src="" type="video/mp4">        Your browser does not support the video tag.    </video>

    <script>
        window.addEventListener('message', function(event) {
            if (event.data.action === 'showVideo') {
                document.getElementById('videoSource').src = event.data.url;
                document.getElementById('video').load();} });    </script>
</body>
</html>
```4. **Daftarkan NUI di`__resource.lua` atau`fxmanifest.lua`**:

```lua
fx_version 'cerulean'
game 'gta5'

client_script 'video_display.lua'
ui_page 'html/index.html'

files {
    'html/index.html'}```5. **Menggunakan perintah dalam game**: Setelah Anda memuat skrip ini di server FiveM Anda, Anda dapat menggunakan perintah`/showvideo <URL>` di chat dalam game untuk menampilkan video.Pastikan untuk mematuhi kebijakan penggunaan FiveM dan tidak melanggar hak cipta saat menggunakan URL video.


RegisterCommand("showvideo", function(source, args, rawCommand)    local videoURL = table.concat(args," ")    
    if videoURL and videoURL ~= "" then
        -- Menampilkan URL video di chat
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0}, multiline = true,
            args = {"Video URL","Tonton video di sini:" .. videoURL}        })        
        -- Menjalankan perintah di terminal Ubuntu
        local command ="echo 'Video URL:" .. videoURL .. "' >> /path/to/your/logfile.txt"        os.execute(command)    else
        -- Jika tidak ada URL, berikan pesan kesalahan
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0}, multiline = true,
            args = {"Kesalahan","Silakan masukkan URL video!"}        })    end
end, false)```3. **Menambahkan ke`fxmanifest.lua`**:
   
fx_version 'cerulean'
game 'gta5'

client_script 'video_url.lua'

```/showvideo https://www.youtube.com/watch?v=dQw4w9WgXcQ

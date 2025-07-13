
// Menggunakan module FiveM
const { onNet, emitNet} = require('fivem-js');

// Mendaftarkan perintah 'showvideo'
onNet('showvideo', (url) => {
    // Memeriksa apakah URL disediakan
    if (url && url!== "") {
        // Mengirim pesan ke pemain
        emitNet('chat:addMessage', source, {
            color: [255, 0, 0],            multiline: true,
            args: ["Video URL","Tonton video di sini:" + url]        });} else {
        // Jika tidak ada URL, berikan pesan kesalahan
        emitNet('chat:addMessage', source, {
            color: [255, 0, 0],            multiline: true,
            args: ["Kesalahan","Silakan masukkan URL video!"]        });}});```3. **Menambahkan ke`fxmanifest.lua`**:
   Jika Anda menggunakan`fxmanifest.lua`, pastikan Anda menambahkannya ke dalam file tersebut:

```lua
fx_version 'cerulean'
game 'gta5'

client_script 'video_url.js'
```4. **Menggunakan Perintah**:
   Setelah skrip di atas di-load ke server Anda, pemain dapat menggunakan perintah`/showvideo <URL>` di chat untuk menampilkan URL video. Misalnya:

```/showvideo https://www.youtube.com/watch?v=dQw4w9WgXcQ
```5. **Menjalankan Skrip**:
   Pastikan server Anda aktif dan skrip tersebut dimuat. Pemain yang menggunakan perintah ini akan melihat pesan dengan URL video yang ditampilkan di chat.Dengan cara ini, Anda dapat menampilkan URL video dalam game menggunakan perintah chat di FiveM dengan skrip JavaScript. Selamat mencoba!

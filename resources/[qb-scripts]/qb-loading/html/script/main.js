let audio = new Audio();
var request = new XMLHttpRequest();
var count = 0;
function Main(){

    return{
        DiscordGuildId: '1117194176354861216', // Also know as Discord server ID [ENABLE DISCORD WIDGET ON YOUR DISCORD SERVER!]
        DiscordInviteLink: 'https://discord.gg/SPbGHZmuKt', // Insert your Discord invite link here.
        memberCount: 0,
        musicAutoplay: true, // Set this to true if you want the music to autoplay
        musicVolume: 0.1, // Set the volume that you like (0 = 0% ; 0.5 = 50% ; 1 = 100%)
        buttons:[
            {label: 'Home', selected: true},
            {label: 'News', selected: false},
            {label: 'Devs', selected: false},
            {label: 'Staff', selected: false},
        ],
        musicList: [
            {label: 'REACT', author: 'Switch Disco feat. Ella Henderson', src: 'audio/react.mp3'},
            {label: 'Won’t Forget You', author: 'Shouse', src: 'audio/wont_forget_you.mp3'},
            {label: 'Dive Too Deep', author: 'Deanz feat. Revel Day', src: 'audio/dive_too_deep.mp3'},
            {label: 'Ice Cream Mans Song', author: 'Plxgue', src: 'audio/monki_josh.mp3'},
        ],
        devs:[
            {discord: 'Hermine', role: 'Owner', img: 'img/teamicons/clown.png'},
            {discord: 'CoCo', role: 'Senior Developer', img: 'img/teamicons/coco.png'},
            {discord: 'Plxgue', role: 'Senior Developer', img: 'img/teamicons/josh.png'},
            {discord: 'DeathKnight', role: 'Developer', img: 'img/teamicons/monki.jpg'},
            {discord: 'VersaceSoClean', role: 'Developer', img: 'img/teamicons/pfpgang.png'},
        ],
        staff:[
            {discord: '💙Zafearah💙', role: 'Admin', img: 'img/teamicons/zafearah.png'},
            {discord: 'Nate Jones', role: 'Admin', img: 'img/teamicons/nate.jpg'},
            {discord: 'Nadyx', role: 'Admin', img: 'img/teamicons/monki.jpg'},
            {discord: 'Gwen', role: 'Mod', img: 'img/teamicons/gwen.png'},
        ],
        feed:[
            {
                date: '2023-06-24 13:00',
                label: 'Testing Phase',
                desc: 'All Job NPCS Hacve been places at legion for testing + New Pawnshop script too help testers',
                img: 'img/news.png',
                author: '@CoCo',
            },
        ],
        // No touching here!!!!
        isMusicPlaying: false,
        musicOpen: true,
        currentSong: 0,
        listen(){
            if(this.musicAutoplay){
                setTimeout(() => { this.play();}, 100);
            }
            request.open('GET', 'https://discordapp.com/api/guilds/'+this.DiscordGuildId+'/widget.json', true);
            request.onload = function() {
            if (request.status >= 200 && request.status < 400) {
                var data = JSON.parse(request.responseText);
                count = data.presence_count;
            }
            };
            request.onerror = function() {
            };
            request.send();
            setTimeout(() => { this.memberCount = count; }, 1000);
        },
        selectBtn(select){
            this.buttons.forEach(function(button){
                button.selected = false;
            });
            return true;
        },
        play(){
           audio.src = this.musicList[this.currentSong].src;
            audio.load();
            audio.play();
            audio.volume = this.musicVolume;
            this.isMusicPlaying = true;
        },
        pause(){
            audio.pause()
            this.isMusicPlaying = false;
        },
        next(){
            if(this.isMusicPlaying){
                audio.pause()
            }
            if(this.currentSong < this.musicList.length-1){
                this.currentSong++;
            }else{
                this.currentSong = 0;
            }
            audio.src = this.musicList[this.currentSong].src;
            audio.load();
            audio.play();
            this.isMusicPlaying = true;
        },
        prev(){
            if(this.isMusicPlaying){
                audio.pause()
            }
            if(this.currentSong != 0){
                this.currentSong = this.currentSong-1;
            }else{
                this.currentSong = this.musicList.length-1;
            }
            audio.src = this.musicList[this.currentSong].src;
            audio.load();
            audio.play();
            this.isMusicPlaying = true;
        },
    }
}

function copyToClipboard(text) {
    const input = document.createElement('input');
    input.value = text;
    document.body.appendChild(input);
    input.select();
    document.execCommand('copy');
    document.body.removeChild(input);

    const notification = document.createElement('div');
    notification.classList.add('notification');
    notification.textContent = `Discord ${text} was copied to clipboard`;
    document.body.appendChild(notification);
    notification.style.opacity = 1;
    setTimeout(() => {
      notification.style.opacity = 0;
      setTimeout(() => {
        document.body.removeChild(notification);
      }, 300);
    }, 3000);
}


$(document).ready(function() {
    var movementStrength = 25;
    var height = movementStrength / $(window).height();
    var width = movementStrength / $(window).width();
    $(document).mousemove(function(e){
        var pageX = e.pageX - ($(window).width() / 2);
        var pageY = e.pageY - ($(window).height() / 2);
        var newvalueX = width * pageX * -1 - 25;
        var newvalueY = height * pageY * -1 - 50;
        $('.bg1').css("background-position", newvalueX+"px     "+newvalueY+"px");
    });

    const moveCursor = (e)=> {
        const mouseY = e.pageY;
        const mouseX = e.pageX;

        $('#cursor').css('transform', `translate3d(${mouseX}px, ${mouseY}px, 0)`)

    }
    window.addEventListener('mousemove', moveCursor)
});


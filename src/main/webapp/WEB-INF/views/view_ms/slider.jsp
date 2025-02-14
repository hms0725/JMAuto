<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>YouTube Player</title>
</head>
<body>

    <div id="player"></div>

    <script>
        let player;
        let lastKnownTime = 0;
        let originalTime;

        function onYouTubeIframeAPIReady() {
            player = new YT.Player('player', {
                height: '390',
                width: '640',
                videoId: 'xdXbJHfuKlY', // 여기에 비디오 ID 입력
                events: {
                    'onReady': onPlayerReady,
                    'onStateChange': onPlayerStateChange
                }
            });
        }

        function onPlayerReady(event) {
            event.target.playVideo();
            checkPlayerTime(); // 주기적으로 재생 위치 체크 시작
        }

        function onPlayerStateChange(event) {
            if (event.data === YT.PlayerState.PAUSED) {
                // 사용자가 조작했는지 확인
                if (Math.abs(player.getCurrentTime() - lastKnownTime) > 0.5) {
                    originalTime = lastKnownTime; // 조작된 시간 기록
                    setTimeout(() => {
                        player.seekTo(originalTime, true);
                        player.playVideo();
                    }, 1000);
                }
            }
        }

        function checkPlayerTime() {
            setInterval(() => {
                lastKnownTime = player.getCurrentTime(); // 현재 재생 위치 저장
            }, 500); // 0.5초마다 현재 시간 업데이트
        }
        
    </script>
   <script src="https://www.youtube.com/iframe_api"></script>
</body>
</html>

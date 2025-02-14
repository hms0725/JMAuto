<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>YouTube API 예제</title>
    <style>
        #player {
            width: 100%;
            height: 400px;
        }
    </style>
</head>
<body>
 <script src="script.js"></script>
   <div>
       <label for="slider">현재 시청시간</label>
       <input type="range" id="slider" min="0" max="0" value="0"/>
       <span id="current-time">0분</span>/<span id="total-time">0분</span>
   </div>
   
   <button id="markAttendance">출석인정</button>
   <div id="status"></div>

 	<div>
       <button id="seekToStart">시작으로 이동</button>
       <button id="seekToHalf">중간으로 이동</button>
       <button id="seekToEnd">끝으로 이동</button>
   </div>
   <!-- YouTube Player -->
   <div id="player"></div>

  
   <script type="text/javascript">
       let totalTime = 0;
       let currentTime = 0;
       let player;

       // YouTube IFrame API를 호출하는 함수
       function onYouTubeIframeAPIReady() {
           player = new YT.Player('player', {
               height: '390',
               width: '640',
               videoId: 'eHKrsYYQ_lI', // 원하는 비디오 ID
               events: {
                   'onReady': onPlayerReady,
               }
           });
       }

	//해당 로직 이용해서 북마크 짚은 곳으로 이동하면 될 듯.
       function onPlayerReady(event) {
           // 비디오가 준비된 후 이벤트 리스너 설정
           document.getElementById('seekToStart').addEventListener('click', () => {
               player.seekTo(0, true); // 시작으로 이동
           });
           document.getElementById('seekToHalf').addEventListener('click', () => {
               const halfTime = player.getDuration() / 2;
               player.seekTo(halfTime, true); // 중간으로 이동
           });
           document.getElementById('seekToEnd').addEventListener('click', () => {
               const totalTime = player.getDuration();
               player.seekTo(totalTime, true); // 끝으로 이동
           });
       }
   </script>
   <script src="https://www.youtube.com/iframe_api"></script>
</body>
</html>

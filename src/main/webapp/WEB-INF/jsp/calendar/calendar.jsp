<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href='/static/lib/main.css' rel='stylesheet' />
    <script src='/static/lib/main.js'></script>
    
    <div id='calendar' class="mt-5"></div>
	 <div class="d-flex justify-content-center mt-5">
		<a href="/couple/home_view"><img src="/static/image/house.png" class="mr-4" height="50"></a>
		<a href="/timeline/timeline_list_view"><img src="/static/image/pictures.png" class="mr-4" width="50"></a>
		<a href="/chat/chat_view"><img src="/static/image/chat.png" class="mr-4" height="50"></a>
	</div>

 	<script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          googleCalendarApiKey: 'AIzaSyBwo4oOfea5TLSuNzZdQnqmJmqusEf6Di0',
          events: {
            googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com'
           ,className: 'gcal-event' // an option! 
          }
        });
        calendar.render();
      });

    </script>

<!-- let calendar = new Calendar(calendarEl, {
  plugins: [ googleCalendarPlugin ],
  googleCalendarApiKey: '<YOUR API KEY>',
  events: {
    googleCalendarId: 'abcd1234@group.calendar.google.com',
    className: 'gcal-event' // an option! 
  }
});-->
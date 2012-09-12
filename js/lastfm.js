//Do it after the html is loaded and ready
$(document).ready(function(){
 	 // Set some vars
 	  var user = 'kirbyt'; //the user you want to follow
 	  var limit = '5'; //limit the data yoou get
 	  var nowp = "true" //include current track
 	  var akey = 'e76121404dfd9b6d924e4339c2d617b8'; //your api key
 	 // Get the JSON URL
     var lfmurl = 'http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user='+user+'&limit='+limit+'&nowplaying='+nowp+'&api_key='+akey+'&format=json';

 	 //So we have a div element in our html with the css class .lastfm
 	 // Now insert a list element if it does not exists
 	  if($('.lastfm ul').length <= 0) { $('.lastfm').append('<ul />'); }

   	 //Now get the Data
   	 $.getJSON(lfmurl, function(data){
   	 	 	 //for each track do somthing
   	 	 	 $.each(data.recenttracks.track, function(index, item){
   	 	 	 	 //insert a list item for every track
   	 	 	 	 // item is our track object
                 var track = item.artist['#text'] + ' – ' + item.name;
   	 	 	 	 $('.lastfm ul').append('<li class="lastfm-item">'+track+'</li>');
   	 	 	 });
   	 });
});

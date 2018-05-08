console.log("bot");

var Twit = require('twit');
var randomWords = require('random-words');
var adj = require('adjectives');

var T = new Twit({
  consumer_key:         'U2K8sNtWLZ2s8HPttE4tVcNBg',
  consumer_secret:      'maLgrWjL1Ks49M9hacle8okOEkUyXfnTi04sDsLzJO95dDMRxi',
  access_token:         '993865164599545856-VS6ITWX7JbbDD2erwZ81Hy9a3VasMZd',
  access_token_secret:  'FnyEL7V8NdkyrfeNW39UOmDxriHPmdVj9ShE59Ugy0Tpd',
})


var exec = require('child_process').exec;
var fs = require('fs');

tweetIt();
setInterval(tweetIt, 1000*20);

function tweetIt() {
  var cmd = 'processing-java --sketch=`pwd`/pixelate --run';
  exec(cmd, processing);
  
  var i = 1;

  function processing() {
  	var filename = 'pixelate/output.png';
  	var params = {
      encoding: 'base64'
  	}
    var b64 = fs.readFileSync(filename, params);

    T.post('media/upload', { media_data: b64 }, uploaded);

    function uploaded(err, data, response) {
      var id = data.media_id_string;
	  var tweet = {
	    status: 'I call this... ' + randomWords() + ' ' + randomWords(),
	    media_ids: [id]
	  }
      T.post('statuses/update', tweet, tweeted);
    }

	function tweeted(err, data, response) {
	  if (err) {
	  	console.log("something broken");
	  } else {
	    console.log("tweeted");
	  }
	}
  }
  i=i+1;
}


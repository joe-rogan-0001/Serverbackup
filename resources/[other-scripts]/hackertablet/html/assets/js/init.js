$(document).ready(function(){
  var level = 0;
  var experience = 0;
  var passwordEntered = false; // Track if the password has been entered

  // Load HTML file
  $('#computer').load('html/index.html');
});

  // Error
  function error(text, duration, color, height) {
    $('#error').css('background', color);
    if (height != null) {
      $('#error').css('height', height);
    } else {
      $('#error').css('height', '');
    }
    $('#error').html('<i class="material-icons">error</i>'+text+'').slideDown('fast', function(){
      setTimeout(function(){
        $('#error').slideUp('fast');
      }, duration);
    });
  }

  // User click
  $("body").on("click", ".user", function() {
    getUser($(this).attr('type'), $(this).attr('dob'));
  });

  // Search form submit
  $("form").submit(function() {
		$('#login').hide();
		$('#main').show();
  	return false;
  });

  // Disable space on the input
  $(".nospace").on({
	  keydown: function(e) {
	    if (e.which === 32)
	      return false;
	  },
	});

// Close button
$('.close').click(function() {
  $('#main').hide();
  $('#appcontent').hide();
  $('#openVehicleLocks-page').hide();
  $('#hackCreditCard-page').hide();
  $('#destroyelectronics-page').hide();
  $('#gpslspd-page').hide();
  $('#hackBank-page').hide();
  $('#blackout-page').hide();
  $('#blackouteast-page').hide();
  $('#carBoost-page').hide();
  $('#phoneLocation-page').hide();
  $('#hackRadioChannel-page').hide();
  $('#phoneOwner-page').hide();
  $('#disruptRadioChan-page').hide();


  if (passwordEntered) {
    $('#loginForm input[type="password"]').val('');
    $('#login').show();
  } else {
    $('#main').show();
  }
});

  // LUA event listener
  window.addEventListener('message', function(event) {
	if (event.data.action == 'open') {
	  $('#computer').show();
    $('#main').hide();
    $('#appcontent').hide();
	} else if (event.data.action == 'close') {
	  $('#computer').hide();
	}
});

  // Hide all the elements (tablet exited)
function hideElements() {
  $('#computer').hide();
  $('#login').show();
  $('#loginForm input[type="password"]').val('');
  $('#main').hide();
  $('#appcontent').hide();
  $('#openVehicleLocks-page').hide();
  $('#hackCreditCard-page').hide();
  $('#destroyelectronics-page').hide();
  $('#gpslspd-page').hide();
  $('#hackBank-page').hide();
  $('#blackout-page').hide();
  $('#blackouteast-page').hide();
  $('#carBoost-page').hide();
  $('#phoneLocation-page').hide();
  $('#hackRadioChannel-page').hide();
  $('#phoneOwner-page').hide();
  $('#disruptRadioChan-page').hide();
}

// Close the NUI, ESC
$(document).keyup(function(e) {
  if (e.keyCode == 27) {
    hideElements();
    if (passwordEntered = true) {
      $('#loginForm input[type="password"]').val('');
      $('#login').show();
    }
    if (passwordEntered = false) {
      $('#login').show();
    }
    $.post('https://hackertablet/esc', JSON.stringify({}));
  }
});


// password listener
document.addEventListener("DOMContentLoaded", function() {
  const loginForm = document.getElementById("loginForm");
  const mainScreen = document.getElementById("main");
  const passwordError = document.getElementById("password");

  loginForm.addEventListener("submit", function(event) {
    event.preventDefault();
    const passwordInput = document.querySelector("#loginForm input[type='password']");
    const password = passwordInput.value;

    // Password validation logic
    if (password === "12345") {
      passwordEntered = true; // Set passwordEntered to true
      document.getElementById("login").style.display = "none";
      mainScreen.style.display = "block";
      mainScreen.style.visibility = "visible";
    } else {
      passwordEntered = false; // Set passwordEntered to false
      document.getElementById("login").style.display = "block";
      passwordInput.value = ""; // Clear the input field
      passwordError.textContent = "Invalid password. Please try again."; // Display error message
      mainScreen.style.display = "none"; // Hide the mainScreen
    }
  });

  // Checking if data is being written in the password input field
  const passwordInput = document.querySelector("#formpassword input[type='password']");
  const passwordLabel = document.querySelector("#formpassword i");

  if (passwordInput && passwordLabel) {
    passwordInput.addEventListener("input", function() {
      if (passwordInput.value.length > 0) {
        passwordLabel.style.opacity = "0.5";
      } else {
        passwordLabel.style.opacity = "1";
      }
    });
  }
});

//PAGES//

// App Buttons
var openVehicleLocks_btn = document.getElementById('openVehicleLocks-btn');
var hackCreditCard_btn = document.getElementById('hackCreditCard-btn');
var destroyelectronics_btn = document.getElementById('destroyelectronics-btn');
var gpslspd_btn = document.getElementById('gpslspd-btn');
var blackout_btn = document.getElementById('blackout-btn');
var blackouteast_btn = document.getElementById('blackouteast-btn');
var carBoost_btn = document.getElementById('carBoost-btn');
var phoneLocation_btn = document.getElementById('phoneLocation-btn');
var hackRadioChannel_btn = document.getElementById('hackRadioChannel-btn');
var hackBank_btn = document.getElementById('hackBank-btn');
var phoneOwner_btn = document.getElementById('phoneOwner-btn');
var disruptRadioChan_btn = document.getElementById('disruptRadioChan-btn');

// App Contents
var openVehicleLocks_page = document.getElementById('openVehicleLocks-page');
var hackCreditCard_page = document.getElementById('hackCreditCard-page');
var destroyelectronics_page = document.getElementById('destroyelectronics-page');
var gpslspd_page = document.getElementById('gpslspd-page');
var blackout_page = document.getElementById('blackout-page');
var blackouteast_page = document.getElementById('blackouteast-page');
var carBoost_page = document.getElementById('carBoost-page');
var phoneLocation_page = document.getElementById('phoneLocation-page');
var hackRadioChannel_page = document.getElementById('hackRadioChannel-page');
var hackBank_page = document.getElementById('hackBank-page');
var phoneOwner_page = document.getElementById('phoneOwner-page');
var disruptRadioChan_page = document.getElementById('disruptRadioChan-page');

// Visibility between App Buttons & Content
openVehicleLocks_btn.onclick = function(){
  document.getElementById('main').style.visibility = "hidden";
  document.getElementById('appcontent').style.display = "block";
  document.getElementById('openVehicleLocks-page').style.display = "block";
};

hackCreditCard_btn.onclick = function(){
  document.getElementById('main').style.visibility = "hidden";
  document.getElementById('appcontent').style.display = "block";
  document.getElementById('hackCreditCard-page').style.display = "block";
};

destroyelectronics_btn.onclick = function(){
  document.getElementById('main').style.visibility = "hidden";
  document.getElementById('appcontent').style.display = "block";
  document.getElementById('destroyelectronics-page').style.display = "block";
};

gpslspd_btn.onclick = function(){
  document.getElementById('main').style.visibility = "hidden";
  document.getElementById('appcontent').style.display = "block";
  document.getElementById('gpslspd-page').style.display = "block";
};

blackout_btn.onclick = function(){
  document.getElementById('main').style.visibility = "hidden";
  document.getElementById('appcontent').style.display = "block";
  document.getElementById('blackout-page').style.display = "block";
};

blackouteast_btn.onclick = function(){
  document.getElementById('main').style.visibility = "hidden";
  document.getElementById('appcontent').style.display = "block";
  document.getElementById('blackouteast-page').style.display = "block";
}

carBoost_btn.onclick = function(){
  document.getElementById('main').style.visibility = "hidden";
  document.getElementById('appcontent').style.display = "block";
  document.getElementById('carBoost-page').style.display = "block";
};

phoneLocation_btn.onclick = function(){
  document.getElementById('main').style.visibility = "hidden";
  document.getElementById('appcontent').style.display = "block";
  document.getElementById('phoneLocation-page').style.display = "block";
};

hackRadioChannel_btn.onclick = function(){
  document.getElementById('main').style.visibility = "hidden";
  document.getElementById('appcontent').style.display = "block";
  document.getElementById('hackRadioChannel-page').style.display = "block";
};

hackBank_btn.onclick = function(){
  document.getElementById('main').style.visibility = "hidden";
  document.getElementById('appcontent').style.display = "block";
  document.getElementById('hackBank-page').style.display = "block";
};

phoneOwner_btn.onclick = function(){
  document.getElementById('main').style.visibility = "hidden";
  document.getElementById('appcontent').style.display = "block";
  document.getElementById('phoneOwner-page').style.display = "block";
};

disruptRadioChan_btn.onclick = function(){
  document.getElementById('main').style.visibility = "hidden";
  document.getElementById('appcontent').style.display = "block";
  document.getElementById('disruptRadioChan-page').style.display = "block";
};


// HACKING BUTTONS //

var openVehicleHack = document.getElementById('car-lock');
var hackCreditHack = document.getElementById('creditcardbutton');
var destroyelectronicsHack = document.getElementById('destroy-engine');
var gpslspdHack = document.getElementById('lspdgps-hack');
var blackoutHack = document.getElementById('blackOutHack');
var blackouteasthack = document.getElementById('blackOutEastHack');
var carBoostHack = document.getElementById('car-boost');
var phoneLocationHack = document.getElementById('telephone-location');
var radioChannelHack = document.getElementById('radio-freq');
var hackBankHack = document.getElementById('telephone-bank');
var phoneOwnerHack = document.getElementById('phone-ID');
var disruptRadioChanHack = document.getElementById('radio-channel');


openVehicleHack.onclick = function() {
  var plateNumber = document.getElementById("opvehnplate").value;  // Get the value of the "opvehnplate" input field
	var hackType = "hackVehicleLocks";  // Set the hack type (modify accordingly)
  var requestData = {
      type: hackType,
      plateNumber: plateNumber,
    };
  hideElements();
  $.post(`https://${GetParentResourceName()}/hack_process`, JSON.stringify(requestData))
  };

hackCreditHack.onclick = function() {
  var requestData = {
    type: 'hackCreditCard',
  };
  hideElements();
  $.post(`https://${GetParentResourceName()}/hack_process`, JSON.stringify(requestData))
};

destroyelectronicsHack.onclick = function() {
  var plateNumber = document.getElementById("plateNumber2").value;
	var hackType = "destroyelectronics";
  var requestData = {
      type: hackType,
      plateNumber: plateNumber,
    };
  hideElements();
  $.post(`https://${GetParentResourceName()}/hack_process`, JSON.stringify(requestData))
  };

 gpslspdHack.onclick = function() {
    var LSPDBlipduration = document.getElementById("PoliceGPSTimer").value;
    var hackType = "lspdHack";
    var requestData = {
        type: hackType,
        duration: LSPDBlipduration,
        job: "police",
      };
    hideElements();
    $.post(`https://${GetParentResourceName()}/hack_process`, JSON.stringify(requestData))
    };

blackoutHack.onclick = function() {
      var blackoutDuration = document.getElementById("blackouttime").value;
      var hackType = "blackOut";
      var requestData = {
          type: hackType,
          duration: blackoutDuration
        };
      hideElements();
      $.post(`https://${GetParentResourceName()}/hack_process`, JSON.stringify(requestData))
      };

blackouteasthack.onclick = function() {
        var blackoutDuration = document.getElementById("blackouteasttime").value;
        var hackType = "blackOutEast";
        var requestData = {
            type: hackType,
            duration: blackoutDuration
          };
        hideElements();
        $.post(`https://${GetParentResourceName()}/hack_process`, JSON.stringify(requestData))
        };

carBoostHack.onclick = function() {
        var requestData = {
          type: 'tweakEcu',
        };
        hideElements();
        $.post(`https://${GetParentResourceName()}/hack_process`, JSON.stringify(requestData))
      };

phoneLocationHack.onclick = function() {
        var phoneNumber = document.getElementById("telephone-noloc").value;
        var duration = document.getElementById("locationTimer").value;
        var hackType = "findLocation";
        var requestData = {
            type: hackType,
            phoneNumber: phoneNumber,
            duration: duration
          };
        hideElements();
        $.post(`https://${GetParentResourceName()}/hack_process`, JSON.stringify(requestData))
        };

radioChannelHack.onclick = function() {
          var radioChannel = document.getElementById("radioFreq").value;
          var sourceID = document.getElementById("radioFreqID").value;
          var hackType = "radiofreqHack";
          var requestData = {
              type: hackType,
              sourceID: sourceID,
              radioChannel: radioChannel,
            };
          hideElements();
          $.post(`https://${GetParentResourceName()}/hack_process`, JSON.stringify(requestData))
          };


hackBankHack.onclick = function() {
    var phoneNumber = document.getElementById("nobankh").value;
    var sourceID = document.getElementById("hbankid").value;
    var hackType = "hackBank";
          var requestData = {
              type: hackType,
              sourceID: sourceID,
              phoneNumber: phoneNumber,
            };
   hideElements();
$.post(`https://${GetParentResourceName()}/hack_process`, JSON.stringify(requestData))
};


phoneOwnerHack.onclick = function() {
    var phoneNumber = document.getElementById("telephone-no").value;
    var hackType = "phoneUserID";
    var requestData = {
        type: hackType,
        phoneNumber: phoneNumber,
      };
    hideElements();
    $.post(`https://${GetParentResourceName()}/hack_process`, JSON.stringify(requestData))
    };



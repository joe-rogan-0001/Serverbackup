let debugMode;
let usedQuestions = [];
let goodAnswer = [];
let userAnswer = [];
let currentQuestion = 1;
let displayedQuestions;
let needRightAnswers;
let errorPoints = 0;
let questionNumber;
let failedTimer = false;
let hasRegistered = false;
let currentTest = null;

function openPage(pageN) {
  if (pageN == 0) {
    $(".pages").css("display", "none");
    $("#home").css("display", "block");
  }
  if (pageN == 1) {
    $(".pages").css("display", "none");
    $("#register").css("display", "block");
  }
  if (pageN == 2) {
    $(".pages").css("display", "none");
    $("#theory").css("display", "block");
    if (hasRegistered == false) { endQuestions(); }
  }
  if (pageN == 3) {
    $("#register").css("display", "block");
    $("#register-form-itself").empty();
    $("#register-form-itself").append(`<h3>Registered</h3>`);
  }
  if(debugMode == true) { console.log("page opend: " + pageN); }
}

function resetVariables() {
  currentQuestion = 1;
  usedQuestions = [];
  goodAnswer = [];
  userAnswer = [];
  errorPoints = 0;
  questionNumber = 1;
  failedTimer = false;
  hasRegistered = false;
  currentTest = null;
}

function closeUI() {
  if(debugMode == true) { console.log("NUI closed"); }
  $.post("https://mtl-drivingSchool/close", JSON.stringify({}));
}

function getRandomQuestions(currentTest) {
  if(debugMode == true) { console.log("getting random questions"); }
  var random = Math.floor(Math.random() * currentTest.length);

  while (true) {
    if (usedQuestions.indexOf(random) === -1) {
      break;
    }
    random = Math.floor(Math.random() * currentTest.length);
  }
  usedQuestions.push(random);
  return random;
}

function endQuestions() {
  if(debugMode == true) { console.log("questions ended"); }
  $("#theory-header").html("PLEASE REGISTER");
  $("#questionSelf").html("PLEASE REGISTER");
  $(".answerA").html("PLEASE REGISTER");
  $(".answerB").html("PLEASE REGISTER");
  $(".answerC").html("PLEASE REGISTER");
  $(".answerD").html("PLEASE REGISTER");
  document.getElementById("errors").innerHTML = "PLEASE REGISTER";
  document.getElementById("time-left-timer").innerHTML = "PLEASE REGISTER";
}

function initializeQuestions() {
  if(debugMode == true) { console.log("questions initialized"); }
  
  if(currentTest == null) {
    currentTest = B;
  } else {
    if(currentTest == "A") {
      currentTest = A;
    } else if (currentTest == "B") {
      currentTest = B;
    } else if (currentTest == "C") {
      currentTest = C;
    } else if (currentTest == "D") {
      currentTest = D;
    }
  }

  var randomQuestion = getRandomQuestions(currentTest);

  $("#theory-header").html("Question no. " + currentQuestion + ": ");
  $("#questionSelf").html(currentTest[randomQuestion].question);
  $(".answerA").html(currentTest[randomQuestion].propositionA);
  $(".answerB").html(currentTest[randomQuestion].propositionB);
  $(".answerC").html(currentTest[randomQuestion].propositionC);
  $(".answerD").html(currentTest[randomQuestion].propositionD);
  document.getElementById("errors").innerHTML = errorPoints + " / 3";

  questionNumber = currentTest[randomQuestion].questionNumber;
  goodAnswer.push(currentTest[randomQuestion].response + currentTest[randomQuestion].questionNumber);
}

$(document).ready(function () {


  function goodEnd() {
    if (debugMode == true) { console.log("Good ending of theory"); }

    $.post("https://mtl-drivingSchool/closeGood", JSON.stringify({}));
    resetVariables();
    return;
  }

  function badEnd() {
    if (debugMode == true) { console.log("Bad ending of theory"); }

    $.post("https://mtl-drivingSchool/closeBad", JSON.stringify({}));
    resetVariables();
    return;
  }

  function paddedFormat(num) {
    return num < 10 ? "0" + num : num;
  }

  function startCountDown(duration, element) {
    if(debugMode == true) { console.log("countdown started"); }
    var secondsRemaining = duration;
    var min = 0;
    var sec = 0;

    var countInterval = setInterval(function () {
      min = parseInt(secondsRemaining / 60);
      sec = parseInt(secondsRemaining % 60);

      element.textContent = `${paddedFormat(min)}:${paddedFormat(sec)}`;

      secondsRemaining = secondsRemaining - 1;
      if (failedTimer == true) {
        clearInterval(countInterval);
        resetVariables();
        return;
      }
      if (secondsRemaining < 0) {
        clearInterval(countInterval);
        badEnd();
        return;
      }
    }, 1000);
  }


  function initializeFirstError() {
    if(debugMode == true) { console.log("first error initalized"); }
    var time_minutes = 3;
    var time_seconds = 0;

    var duration = time_minutes * 60 + time_seconds;
    element = document.querySelector("#time-left-timer");
    element.textContent = `${paddedFormat(time_minutes)}:${paddedFormat(
      time_seconds
    )}`;
    failedTimer = false;
    startCountDown(--duration, element);
  }

  function initQ() {
    openPage(3);

    initializeQuestions();
    initializeFirstError();
  }

  function initWRQ() {
    initializeQuestions();
    initializeFirstError();
  }

  window.addEventListener("message", (event) => {
    let item = event.data;
    // NAV BAR

    if (item.display == true && item.type == "ui" && item.enabledRegister == true) {
      debugMode = item.debugEnabled;
      displayedQuestions = item.displayedQuestions;
      needRightAnswers = item.needRightAnswers;
      if(debugMode == true) { console.log("initialized UI / display true - type ui - enabledRegister true"); }
        $("#fullscreen").css("display", "block");
        $("#sidebar").empty();
        $("#sidebar").append(`
          <li class="nav-item">
            <a onclick="openPage(0)" id="homeButton" class="nav-link active py-3" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Start">
              <i class="bi bi-house" style="color: white; font-size: 1.3rem;"></i>
              <p style="font-size: 12px; font-color: white; color: white;">Start</p>
            </a>
          </li>
          <li>
            <a onclick="openPage(1)" id="LogInButton" class="nav-link py-3" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Register">
              <i class="bi bi-journal" style="color: white; font-size: 1.3rem;"></i>
              <p style="font-size: 12px; font-color: white; color: white;">Register</p>
            </a>
          </li>
          <li>
            <a onclick="openPage(2)" id="theoryButton" class="nav-link py-3" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Theory Test">
              <i class="bi bi-easel" style="color: white; font-size: 1.3rem;"></i>
              <p style="font-size: 12px; font-color: white; color: white;">Theory</p>
            </a>
          </li>
          <li>
            <a onclick="closeUI()" id="closeButton" href="#" class="nav-link py-3" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Close">
              <i class="bi bi-door-open" style="color: white; font-size: 1.3rem;"></i>
              <p style="font-size: 12px; font-color: white; color: white;">Close</p>
            </a>
          </li>
          `);
          // Start
          $("#home-header").empty();
          $("#home-header").append(
            "Welcome to the unique driving school in Los Santos"
          );
          $("#home-text").empty();
          $("#home-text").append(`
            When you visit us for the first time, read this text. We explain the process to a very special feeling offreedom.
            Please register with us at the beginning. You will need your ID card, which we will be happy to scan for you.
            After successful registration and studying the learning content you can complete the theoretical part of the driving aptitude test.
            You may have a maximum of 3 errors. <br><br>
            After you have passed the theory, the practical part of the driving aptitude test awaits you. In which you,
            suitable for a beginner driver, Peugot 206 drive. Do not drive too fast or demolish the vehicle. You may have a maximum of 3 errors.
            <br><br> Please note that you will not be reimbursed for the driving test. We wish you good luck and good sense.`);

          // Register
          $("#register-header").empty();
          $("#register-header").append(
            '<h3 id="register-header">Registration form</h3>'
          );
          $("#register-form-itself").empty();
          $("#register-form-itself").append(`
          <div class="col-md-6">
            <label for="Vorname" class="form-label">First name</label>
            <input type="text" class="form-control" id="Vorname" placeholder="Max" required>
          </div>
          <div class="col-md-6">
            <label for="Nachname" class="form-label">Last name</label>
            <input type="text" class="form-control" id="Nachname" placeholder="Exampleman" required>
          </div>
          <div class="col-6">
            <label for="Straße" class="form-label">Street</label>
            <input type="text" class="form-control" id="Strasse" placeholder="Example St." required>
          </div>
          <div class="col-6">
            <label for="Hausnummer" class="form-label">No. </label>
            <input type="text" class="form-control" id="Hausnummer" placeholder="100" required>
          </div>
          <div class="col-md-6">
            <label for="PLZ" class="form-label">Postal</label>
            <input type="text" class="form-control" id="PLZ" placeholder="12345" required>
          </div>
          <div class="col-md-6">
            <label for="Stadt" class="form-label">City</label>
            <input type="text" class="form-control" id="Stadt" placeholder="Los Santos" required>
          </div>
          <p>Desired class</p>
          <div class="col-6">
            <input class="form-check-input" type="radio" name="driverClass" value="B" id="B">
            <label class="form-check-label" for="B">
            Class B (Car - $500)
            </label>
          </div>
        `);
          $("#register-form-itself").append(`
          <div id="register-button-div" class="col-4 text-left">
            <button id="register-button" class="mr-2 btn btn-primary" style="margin-right: 10px">Register</button>
          </div>`);

          $("#theory-header1").empty();
          $("#theory-header1").append("Theory test");
          $("#theory-button-withoutRegister").css("display", "none");
          $("#theory-form-itself-withoutRegister").css("display", "none");

          $('#sidebar li a').on('click', function () {
            $('a').removeClass('active');
            $(this).addClass('active');
          });
          if (item.display2 == true && item.type2 == "pData") {
            debugMode = item.debugEnabled;
            displayedQuestions = item.displayedQuestions;
            needRightAnswers = item.needRightAnswers;
            if(debugMode == true) { console.log("initialized UI / display2 true - type2 pData"); }
            $(".pages").css("display", "none");
            $("#register").css("display", "block");
            initQ();
          } else {
            $(".pages").css("display", "none");
            $("#home").css("display", "block");
          }
    } else if (item.display == true && item.type == "ui" && item.enabledRegister == false) {
      debugMode = item.debugEnabled;
      displayedQuestions = item.displayedQuestions;
      needRightAnswers = item.needRightAnswers;
      if(debugMode == true) { console.log("initialized UI / display true - type ui - enabledRegister false"); }
      $("#fullscreen").css("display", "block");
      $("#sidebar").empty();
      $("#sidebar").append(`
  <li class="nav-item">
    <a onclick="openPage(0)" id="homeButton" class="nav-link active py-3" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Start">
      <i class="bi bi-house" style="color: white; font-size: 1.3rem;"></i>
      <p style="font-size: 12px; font-color: white; color: white;">Start</p>
    </a>
  </li>
  <li>
    <a onclick="openPage(2)" id="theoryButton" class="nav-link py-3" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Theory Test">
      <i class="bi bi-easel" style="color: white; font-size: 1.3rem;"></i>
      <p style="font-size: 12px; font-color: white; color: white;">Theory</p>
    </a>
  </li>
  <li>
    <a onclick="closeUI()" id="closeButton" href="#" class="nav-link py-3" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Close">
      <i class="bi bi-door-open" style="color: white; font-size: 1.3rem;"></i>
      <p style="font-size: 12px; font-color: white; color: white;">Close</p>
    </a>
  </li>
  `);
      // Start
      $("#home-header").empty();
      $("#home-header").append(
        "Welcome to the unique driving school in Los Santos"
      );
      $("#home-text").empty();
      $("#home-text").append(`
  When you visit us for the first time, read this text. We explain the process to a very special feeling offreedom.
  You can start the theory test now. You will need your ID card, which we will be happy to scan for you.
  After studying the learning content you can complete the theoretical part of the driving aptitude test.
  You may have a maximum of 3 errors. <br><br>
  After you have passed the theory, the practical part of the driving aptitude test awaits you. In which you,
  suitable for a beginner driver, Peugot 206 drive. Do not drive too fast or demolish the vehicle. You may have a maximum of 3 errors.
  <br><br> Please note that you will not be reimbursed for the driving test. We wish you good luck and good sense.`);

      $("#register-form-itself").append(`
      <div id="register-button-div" class="col-4 text-left">
        <button id="register-button" class="mr-2 btn btn-primary" style="margin-right: 10px">Register</button>
      </div>`);

      $("#theory-header1").empty();
      $("#theory-header1").append("Theory test");
      $("#theory-form-itself-withoutRegister").css("display", "block");
      $("#theory-form-itself-withoutRegister").empty();
      $("#theory-form-itself-withoutRegister").append(`
      <p>Desired class</p>
      <div class="col-6">
        <input class="form-check-input" type="radio" name="driverClass" value="B" id="B">
        <label class="form-check-label" for="B">
        Class B (Car - $500)
        </label>
      </div>
      <div id="theory-button-withoutRegister-div" class="col-4 text-left">
                <button id="theory-button-withoutRegister" class="mr-2 btn btn-primary" style="margin-right: 10px">Start theory</button>
              </div>
    `);
      $("#theory-button-withoutRegister").css("display", "flex");
      
      $("#question-form").css("display", "none");
      $("#theory-header").css("display", "none");
      $("#questionSelf").css("display", "none");

      
      
      $('#sidebar li a').on('click', function () {
        $('a').removeClass('active');
        $(this).addClass('active');
      });
      if (item.display2 == true && item.type2 == "pData" && item.enabledRegister == false) {
        debugMode = item.debugEnabled;
        displayedQuestions = item.displayedQuestions;
        needRightAnswers = item.needRightAnswers;
        if(debugMode == true) { console.log("initialized UI / display2 true - type2 ui - enabledRegister false"); }
        initWRQ();
        $(".pages").css("display", "none");
        $("#theory").css("display", "block");
        $("#question-form").css("display", "block");
        $("#theory-header").css("display", "block");
        $("#questionSelf").css("display", "block");
        $("#theory-button-withoutRegister").css("display", "none");
        $("#theory-form-itself-withoutRegister").css("display", "none");
      } else {
        $(".pages").css("display", "none");
        $("#home").css("display", "block");
      }

    } else {
      $("#fullscreen").css("display", "none");
      if(debugMode == true) { console.log("no way found to activate NUI"); }
      if(hasRegistered == true) {
        badEnd();
        failedTimer = true;
      }
    }
    $('#sidebar li a').on('click', function () {
      $('a').removeClass('active');
      $(this).addClass('active');
    });
  });


  $("#theory-form-itself-withoutRegister").on('submit', function (e) {
    e.preventDefault();
    var radioValueClass = $("input[type='radio'][name='driverClass']:checked").val();

    if (radioValueClass == null){
      console.log('No radio value class found!');
      return;
  }

    $.post(
      "https://mtl-drivingSchool/checkPersonalData",
      JSON.stringify({
        Klasse: radioValueClass,
        ActivatedRegistration: false,
      })
    );

    $("#question-form").css("display", "flex");
    $("#theory-header").css("display", "flex");
      $("#questionSelf").css("display", "flex");
      $("#register").css("display", "none");
      $("#register-form-itself").css("display", "none");
      $(".pages").css("display", "none");
    $("#theory").css("display", "block");

    if(debugMode == true) {
      console.log ("Submitted Personal Data");
      console.log ("class: " + radioValueClass);
    }
    
    currentTest = radioValueClass;
    hasRegistered = true;
  });


  $("#register-form-itself").on('submit', function (e) {
    e.preventDefault();
    var inputValueVorname = $("#Vorname").val();
    var inputValueNachname = $("#Nachname").val();
    var inputValueStrasse = $("#Strasse").val();
    var inputValueHausnummer = $("#Hausnummer").val();
    var inputValuePLZ = $("#PLZ").val();
    var inputValueStadt = $("#Stadt").val();
    var radioValueClass = $("input[type='radio'][name='driverClass']:checked").val();


    $.post(
      "https://mtl-drivingSchool/checkPersonalData",
      JSON.stringify({
        Vorname: inputValueVorname,
        Nachname: inputValueNachname,
        Strasse: inputValueStrasse,
        Hausnummer: inputValueHausnummer,
        PLZ: inputValuePLZ,
        Stadt: inputValueStadt,
        Klasse: radioValueClass,
        ActivatedRegistration: true,
      })
    );

    if(debugMode == true) {
      console.log ("Submitted Personal Data");
      console.log ("first name: " + inputValueVorname);
      console.log ("last name: " + inputValueNachname);
      console.log ("class: " + radioValueClass);
    }

    currentTest = radioValueClass;
    hasRegistered = true;
  });


  $("#question-form").on('submit', function (e) {
    e.preventDefault();
    if ($("input:radio[name='question']:checked").length <= 0) {
      $("#selectAlert").css("display", "block");
      if(debugMode == true) { console.log("submitted class form without checked class"); }
      return false;
    } else {
      $("#selectAlert").css("display", "none");
      if(debugMode == true) { console.log("submitted class form with checked class"); }
    }
    var i;
    if (hasRegistered == false) {
      if(debugMode == true) { console.log("submitted theory form while not registered"); }
      return false;
    }
    if (currentQuestion != displayedQuestions) {
      userAnswer.push($('input[name="question"]:checked').val() + questionNumber);
      userAnswerForError = $('input[name="question"]:checked').val() + questionNumber;
      currentQuestion++;



      if ($.inArray(userAnswerForError, goodAnswer) !== -1) {
      } else {
        errorPoints++;
      }

      if (errorPoints == 3) {
        badEnd();
        secondsRemaining = 0;
        failedTimer = true;
      }
      initializeQuestions();
      $("input[name=question]").prop('checked', false);
    } else {
      userAnswer.push($('input[name="question"]:checked').val());
      if (userAnswer[i] !== goodAnswer[i]) {
        errorPoints++;
      }
      if (errorPoints == 3) {
        badEnd();
        secondsRemaining = 0;
        failedTimer = true;
      }
      var goodAnswerInt = 0;
      for (i = 0; i < displayedQuestions; i++) {
        if (userAnswer[i] == goodAnswer[i]) {
          goodAnswerInt++;
        }
      }

      if (goodAnswerInt >= needRightAnswers) {
        goodEnd();
        failedTimer = true;
      } else {
        badEnd();
        secondsRemaining = 0;
        failedTimer = true;
      }
    }
  });
});

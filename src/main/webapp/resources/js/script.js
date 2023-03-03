let timeSecond = 0;
const timeH = document.querySelector("#timer");
const timerStartButton = document.querySelector("#timer_button")
const brewTime = document.querySelector("#brew_time").innerHTML;
const coffeeId = document.querySelector('#coffeeId').value;
const coffeeGrounds = document.querySelector('#coffeeGrounds').innerHTML;


const rateButton = document.createElement('button');
rateButton.classList.add('timer_button');
rateButton.innerHTML = 'Done';
rateButton.setAttribute('id', 'rate_button');

rateButton.addEventListener('click', function(event) {
    window.location = '/coffee/rate?coffeeId=' + coffeeId + '&coffeeGrounds=' + coffeeGrounds;
});


const stopTimerButton = document.createElement('button')
stopTimerButton.id = 'stop_button';
stopTimerButton.classList.add('timer_button');
stopTimerButton.innerText= 'Stop';

stopTimerButton.addEventListener('click', endCount);


timerStartButton.addEventListener('click', function (event) {
    timerStartButton.parentElement.replaceChild(stopTimerButton, timerStartButton);
    displayTime(timeSecond);

    const countDown = setInterval(() => {
        timeSecond++;
        displayTime(timeSecond);
        if (timeH.innerHTML == "Time out") {
            endCount();
            clearInterval(countDown);
        }
    }, 1000);

})
function displayTime(second) {
    const min = Math.floor(second / 60);
    const sec = Math.floor(second % 60);
    timeH.innerHTML = `
  ${min < 10 ? "0" : ""}${min}:${sec < 10 ? "0" : ""}${sec}
  `;
}

function endCount() {
    timeH.innerHTML = "Time out";
    stopTimerButton.parentElement.replaceChild(rateButton, stopTimerButton);
    timeH.parentElement.removeChild(timeH);
}


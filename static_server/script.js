// Display a greeting message based on the time of day
function showGreeting() {
    const now = new Date();
    const hours = now.getHours();
    let greeting = "Hello!";

    if (hours < 12) {
        greeting = "Good morning!";
    } else if (hours < 18) {
        greeting = "Good afternoon!";
    } else {
        greeting = "Good evening!";
    }

    document.getElementById("greeting").textContent = greeting;
}

// Change the background color randomly
function changeBackgroundColor() {
    const colors = ["#FF5733", "#33FF57", "#3357FF", "#F1C40F", "#9B59B6", "#E74C3C"];
    const randomColor = colors[Math.floor(Math.random() * colors.length)];
    document.body.style.backgroundColor = randomColor;
}

// Button click counter
let clickCount = 0;
function updateClickCount() {
    clickCount++;
    document.getElementById("click-count").textContent = `Button clicked: ${clickCount} times`;
}

// Initialize page functionality
document.addEventListener("DOMContentLoaded", () => {
    showGreeting(); // Show greeting when the page loads
});

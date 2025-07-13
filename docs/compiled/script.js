let logoScroll = 60;
let logoElement;
function init() {
    logoElement = document.getElementById("logo");
    window.addEventListener("scroll", handlescroll);
}
function handlescroll() {
    logoElement.style.opacity = ((logoScroll - window.scrollY) / logoScroll).toString();
}

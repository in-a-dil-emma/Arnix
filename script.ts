let logoScroll: number = 60
let logoElement: HTMLElement;

function init() {
    logoElement = document.getElementById("logo")!;
    window.addEventListener("scroll", handlescroll);
}

function handlescroll() {
    logoElement.style.opacity = ((logoScroll - window.scrollY) / logoScroll).toString();
}
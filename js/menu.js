document.addEventListener("DOMContentLoaded", () => {
    const menu = document.querySelector(".menu");
    const overlay = document.querySelector(".overlay");
    const openMenuBtn = document.getElementById("openMenuBtn");
    const closeMenuBtn = document.querySelector(".close-btn");

    // Evento para abrir el menú
    openMenuBtn.addEventListener("click", (event) => {
        event.preventDefault(); // Evita que el enlace recargue la página
        menu.classList.add("visible");
        overlay.classList.add("visible"); // Muestra el overlay
    });

    // Evento para cerrar el menú
    closeMenuBtn.addEventListener("click", () => {
        menu.classList.remove("visible");
        overlay.classList.remove("visible"); // Oculta el overlay
    });

    // Cierra el menú si se hace clic en el overlay
    overlay.addEventListener("click", () => {
        menu.classList.remove("visible");
        overlay.classList.remove("visible");
    });
});
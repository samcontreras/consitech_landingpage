import React, { useEffect } from "react";

export const Header = (props) => {
  useEffect(() => {
    const handleScroll = () => {
      const scrolled = window.pageYOffset;
      const intro = document.querySelector('.intro');
      const container = document.querySelector('.intro .container');
      
      if (container && intro) {
        // Mueve el contenedor hacia arriba mientras se hace scroll
        container.style.transform = `translateY(${scrolled * 0.5}px)`;
        
        // Mueve el fondo a una velocidad diferente para crear efecto parallax
        intro.style.backgroundPositionY = `${scrolled * 0.7}px`;
      }
    };

    // Agregar el event listener cuando el componente se monta
    window.addEventListener('scroll', handleScroll);

    // Limpiar el event listener cuando el componente se desmonta
    return () => {
      window.removeEventListener('scroll', handleScroll);
    };
  }, []); // Array vacío significa que el efecto se ejecuta solo una vez al montar el componente

  return (
    <header id="header">
      <div className="intro">
        <div className="overlay">
          <div className="container">
            <div className="intro-text">
              <h1>
                {props.data ? props.data.title : "Loading"}
                <span></span>
              </h1>
              <p>{props.data ? props.data.paragraph : "Loading"}</p>
              <a
                href="#features"
                className="btn btn-custom btn-lg page-scroll"
              >
                Leer más
              </a>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
};
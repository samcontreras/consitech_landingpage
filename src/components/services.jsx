import React from "react";

export const Services = (props) => {
  return (
    <div id="services" className="text-center">
      <div className="container">
        <div className="section-title">
          <h2>Nuestros Servicios</h2>
          <p>
          En el dinámico mundo empresarial actual, la tecnología no es solo una herramienta: es el motor que impulsa la innovación y el crecimiento. Nuestro portafolio de servicios está diseñado para potenciar su negocio, combinando experiencia técnica con un profundo entendimiento de sus necesidades empresariales.
          Ofrecemos soluciones tecnológicas integrales que abarcan desde el desarrollo de software personalizado hasta la implementación de sistemas empresariales completos. Cada servicio está pensado para maximizar su eficiencia operativa y fortalecer su posición en el mercado.
          </p>
        </div>
        <div className="row">
          {props.data
            ? props.data.map((d, i) => (
                <div key={`${d.name}-${i}`} className="col-md-4">
                  {" "}
                  <i className={d.icon}></i>
                  <div className="service-desc">
                    <h3>{d.name}</h3>
                    <p>{d.text}</p>
                  </div>
                </div>
              ))
            : "loading"}
        </div>
      </div>
    </div>
  );
};

# Consultas-SQL-Avanzadas

# Sistema de Reservas de Alojamientos Turísticos

## Base de Datos

| Tecnología | Versión |           Propósito               |
|------------|---------|-----------------------------------|
| PostgreSQL | 15+     | Base de datos relacional          |
| SQL        |ANSI SQL | Gestión de consultas y relaciones |

---

# Modelo Entidad - Relación

El sistema está diseñado para administrar alojamientos turísticos, reservas, pagos y reseñas realizadas por huéspedes.

## Arquitectura de Base de Datos

```text
              ┌───────────────────┐
              │   propietarios    │
              │-------------------│
              │ id_propietario PK │
              │ nombre            │
              │ apellido          │
              │ email             │
              │ telefono          │
              └─────────┬─────────┘
                        │ 1:N
                        │
              ┌─────────▼─────────┐
              │    alojamientos   │
              │-------------------│
              │ id_alojamiento PK │
              │ id_propietario FK │
              │ nombre            │
              │ descripcion       │
              │ precio_noche      │
              │ capacidad         │
              └──────┬──────┬─────┘
                     │      │
                1:N  │      │ 1:N
                     │      │
             ┌───────▼───┐  │
             │ reservas  │◄─┘
             │-----------│
             │ id_reserva│
             │ id_huesped│
             │ id_alojam.│
             │ fechas    │
             │ estado    │
             └─────┬─────┘
                   │
          ┌────────┴─────────┐
          │                  │
         1:N                1:N
          │                  │

 ┌────────▼───────┐   ┌──────▼───────┐
 │    pagos       │   │   reseñas    │
 │----------------│   │--------------│
 │ id_pago        │   │ id_resena    │
 │ id_reserva FK  │   │ id_reserva FK│
 │ monto          │   │ calificacion │
 │ metodo_pago    │   │ comentario   │
 └────────────────┘   └──────┬───────┘
                              │
                              │
                       ┌──────▼──────┐
                       │  huespedes  │
                       │-------------│
                       │ id_huesped  │
                       │ nombre      │
                       │ email       │
                       │ telefono    │
                       └─────────────┘
```

---

## Relaciones Principales

- **Propietarios → Alojamientos** → Un propietario puede registrar múltiples alojamientos.
- **Huéspedes → Reservas** → Un huésped puede realizar muchas reservas.
- **Alojamientos → Reservas** → Un alojamiento puede tener múltiples reservas.
- **Reservas → Pagos** → Cada reserva puede generar pagos asociados.
- **Reservas → Reseñas** → Los huéspedes pueden dejar reseñas de reservas realizadas.

---

## Entidades del Sistema

| Entidad      |          Descripción              |
|--------------|-----------------------------------|
| Propietarios | Gestionan los alojamientos        |
| Alojamientos | Lugares disponibles para reservar |
| Huéspedes    | Usuarios que realizan reservas    |
| Reservas     | Registro de estancias             |
| Pagos        | Control financiero                |
| Reseñas      | Opiniones y calificaciones        |


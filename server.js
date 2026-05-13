const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');
require('dotenv').config();


const app = express();
const PORT = process.env.PORT; //puerto del servidor de node

app.use(cors());
app.use(express.json());

// Configuración de la conexión a la base de datos MySQL
const dbConfig = {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT, //puerto de MySQL
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD, //contraseña de MySQL
    database: process.env.DB_DATABASE
};

app.get('/api/equipos', async (req, res) => {
    try {
        const connection = await mysql.createConnection(dbConfig);
        const [rows] = await connection.execute('SELECT * FROM equipos');
        await connection.end();

        // Mapear los resultados para que coincidan con el formato esperado por el frontend
        const equiposFormateados = rows.map(equipo => ({
            id: equipo.id,
            nombre: equipo.nombre,
            ciudad: equipo.ciudad,
            estadio: equipo.estadio,
            fundacion: equipo.fundacion,
            colores: [equipo.color_principal, equipo.color_secundario]
        }));

        res.json(equiposFormateados);
    } catch (error) {
        console.error('Error al conectar con la base de datos:', error);
        res.status(500).json({ error: 'Error al conectar con la base de datos' });
    }
});

app.listen(PORT, () => {
    console.log(`Servidor backend corriendo en http://localhost:${PORT}`);
});

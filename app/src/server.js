const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.send(`
        <div style="font-family: sans-serif; text-align: center; padding: 50px;">
        <h1> DevSecOps Cloud-Native App<h1>
    </p>
        <div style="color: green; font-weight: bold; font-size: 1.2rem;">System Status: Healthy</div>
        </div>
        `);
});

app.get('/health', (req, res) => {
    res.status(200).json({status: 'UP', timestamp: new Date() });
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
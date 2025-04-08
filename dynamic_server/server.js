const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send('Hello, this is a dynamically deployed Node.js app with Nginx!');
});

const PORT = 3030;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});

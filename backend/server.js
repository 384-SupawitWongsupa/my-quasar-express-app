const express = require('express');
const cors = require('cors');
const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

app.get('/api/demo', (req, res) => {
    res.json({
        git: {
            detail: 'Git is a distributed version control system that tracks changes in any set of computer files.'
        },
        docker: {
            detail: 'ศุปวิทย์ วงศ์สุภา 6604101384'
        }
    });
});

app.listen(port, () => {
    console.log(`Backend server running at http://localhost:${3000}`);
});

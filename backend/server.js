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
            detail: 'Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers.'
        }
    });
});

app.listen(port, () => {
    console.log(`Backend server running at http://localhost:${port}`);
});

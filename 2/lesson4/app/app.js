const express = require('express');
const promClient = require('prom-client');

const app = express();
const port = 8000;

// Define a custom metric
const myMetric = new promClient.Counter({
    name: 'my_metric',
    help: 'This is my custom metric'
});

// Register the metric with the Prometheus registry
promClient.register.registerMetric(myMetric);

// Define a route to increment the custom metric
// app.get('/increment', (req, res) => {
//     myMetric.inc();
//     res.send('Metric incremented!');
// });

// Define a route to expose the Prometheus metrics
app.get('/metrics', async (req, res) => {
    try {
        myMetric.inc();
        const metrics = await promClient.register.metrics();
        res.set('Content-Type', promClient.register.contentType);
        res.send(metrics);
    } catch (err) {
        console.error(err);
        res.status(500).send('Internal Server Error');
    }
});

// Start the server
app.listen(port, () => {
    console.log(`App listening on port ${port}!`);
});

import express from 'express';
//import { tracer, meter } from './tracer';

const app = express();
app.use(express.json());

// Create metrics
// const requestCounter = meter.createCounter('requests_total', {
//   description: 'Total number of requests',
// });

// const responseLatency = meter.createHistogram('response_latency_seconds', {
//   description: 'Response latency in seconds',
//   unit: 'seconds',
//   boundaries: [0.01, 0.05, 0.1, 0.5, 1, 2],
// });

// Middleware for tracing
app.use((req, res, next) => {
  // const span = tracer.startSpan(`HTTP ${req.method}`, {
  //   attributes: {
  //     'http.method': req.method,
  //     'http.route': req.path,
  //   },
  // });

  // Add trace context to request
  // Object.defineProperty(req, '__span', {
  //   value: span,
  //   enumerable: false,
  // });

  res.on('finish', () => {
    //span.end();
  });

  next();
});

// Example routes demonstrating different scenarios
app.get('/health', async (_, res) => {
  //requestCounter.add(1);
  
  const latency = Math.random() * 100;
  await new Promise(resolve => setTimeout(resolve, latency));
  //responseLatency.record(latency / 1000);

  res.status(200).json({ status: 'healthy' });
});

app.post('/users', async (req, res) => {
  //requestCounter.add(1);
  
  //const span = tracer.startSpan('Create User Operation');
  try {
    const user = req.body;

    // Simulate processing time
    const processingTime = Math.random() * 500;
    await new Promise(resolve => setTimeout(resolve, processingTime));

    //span.setAttribute('user.id', user?.id || 'unknown');

    res.status(201).json({ id: Date.now(), ...user });
  } catch (error) {
    //span.setStatus({ code: 2, message: error.message });
    throw error;
  } finally {
    //span.end();
  }
});

const PORT = 4000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
#!/bin/bash

echo "Starting Ollama server..."
ollama serve &
SERVE_PID=$!

echo "Waiting for Ollama server to be active..."
while ! ollama list | grep -q 'NAME'; do
  sleep 1
done

ollama pull $SLM_MODEL


wait $SERVE_PID
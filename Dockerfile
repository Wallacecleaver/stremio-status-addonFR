FROM node:20-alpine

WORKDIR /app

# Copy package files first (better layer caching)
COPY package*.json ./

# Install only production dependencies
RUN npm install --omit=dev

# Copy the rest of the app
COPY . .

# Back4app / most PaaS inject PORT automatically; your app already reads process.env.PORT
EXPOSE 7000

CMD ["node", "index.js"]

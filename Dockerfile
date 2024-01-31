FROM ubuntu:latest

# Update package lists and install Node.js and npm
RUN apt-get update \
    && apt-get install -y nodejs \
    && apt-get install -y npm

# Check Node.js version
RUN node -v

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if exists)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose port 8080
EXPOSE 8080
# Command to run the application
CMD ["npm", "start"]

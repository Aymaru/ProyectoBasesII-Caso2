
# Install node v10
FROM node:10

# Set the workdir /usr/src/app
WORKDIR /usr/src/app

# Expose application ports - (4300 - for API and 4301 - for front end)
EXPOSE 3000

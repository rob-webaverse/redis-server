FROM node	
ENV LAST_UPDATED 20160605T165400	
LABEL description="webaverse-redis-server"
	
# Copy source code
COPY . /redis-server
	

# Change working directory
WORKDIR /redis-server
	

# Install dependencies
RUN apt update -y
RUN apt install sudo -y
RUN npm install forever -g
RUN npm install
	

# Expose API port to the outside
EXPOSE 80
EXPOSE 443
	

	# Launch application
CMD forever -a -l /host/forever.log -o stdout.log -e stderr.log index.js

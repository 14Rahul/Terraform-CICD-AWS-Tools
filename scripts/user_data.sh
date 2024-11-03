#! /bin/bash

# Update and install Apache
sudo yum update -y
sudo yum install -y httpd.x86_64

# Start and enable Apache service
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

# Create a custom HTML page
echo "<html>
<head>
    <title>Welcome to My Custom Apache Page</title>
</head>
<body>
    <h1>Hello from the Custom Apache Page New!</h1>
    <p>This is a custom page served by Apache on your EC2 instance.</p>
</body>
</html>" | sudo tee /var/www/html/index.html

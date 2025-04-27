In order to run a laravel project, I need to start docker-desktop, then in a terminal, start and keep running docker compose and then in another terminal start and keep running artisan. 

Also, if I wanted to run a CLI command, such as migrate, I needed yet another terminal window.

Not very difficult or labourious, just tedious each and every time and results in multiple needless terminal windows that fill up screen space when developing on a laptop.

The need for fewer terminal windows seemed obvious and also the starting and stopping of the three main processes screamed out for streamlining.

So I created a BASH file that can be called from anywhere via the command "./lara.sh -p='name of project folder' -a=start" to run all the required processes in one single terminal window. Using "-a=stop" will...well, you've guessed it. 

I also made sure that the output from the processes is turned off, as it is not needed 99% of the time

I used BASH on a UNIX system about 20 years ago and this is the first time I've used it since, this time on Ubuntu/Linux.

AWood, 27-04-2025


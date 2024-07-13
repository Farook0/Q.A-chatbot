# use the offical python 3.12.4 image
FROM python:3.12.4 


#set the working directory to /code

WORKDIR /code

##copy the current directory contents in the container at /code

COPY ./requirements.txt /code/requirements.txt


# install the requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# setup a new user named "user"

RUN useradd user

# switch to the user "user"

USER user


#set home to the user's home directory

ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH


#set the working directory to the user home directory

WORKDIR $HOME/app


# Copy the current directory contents into the container at $HOME/app setting the owner to

COPY --chown=user . $HOME/app

#Start the fastAPI app on port 7860

CMD [ "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "7860"]



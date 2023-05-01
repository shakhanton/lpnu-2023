FROM python:3.10

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD [ "python3", "-m" , "django", "run", "--host=0.0.0.0", "--port=5000"]








app.py



docker build .
docker run image_name

curl localhost:5000
curl 127.0.0.1:5000



python app.py 
Hello 



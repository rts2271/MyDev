FROM python

ARG ARG_USER
ARG ARG_USERID
ARG ARG_GROUP

RUN adduser --uid $ARG_USERID $ARG_USER --disabled-password

RUN apt-get update &&\
    apt-get install --no-install-recommends --assume-yes --quiet ca-certificates \
    curl wget git zip ffmpeg
    
RUN pip install setuptools-rust    
RUN pip install sounddevice
RUN pip install pip-tools
RUN pip install SpeechRecognition
RUN pip install langchain
RUN pip install rich
RUN pip install openai-whisper

CMD ["bash"]

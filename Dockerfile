# Usage: docker run --rm -v .:/data -v .:/opt/sharpshooter/output -it sharpshooter --payload js --dotnetver 4 --stageless --rawscfile /data/shellcode.bin --output test
FROM python:2.7

ENV dir=/opt/sharpshooter

ADD . $dir

WORKDIR $dir

# Upgrade `setuptools`, otherwise you'll get an 'egg_info' error.
RUN pip2 install --upgrade setuptools && \
    # Finally, install the requirements.
    pip2 install -r requirements.txt

VOLUME /data
ENTRYPOINT ["python2", "SharpShooter.py"]
